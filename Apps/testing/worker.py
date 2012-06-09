# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
import MySQLdb
import random
import sys
CWD = sys.path[0] + '/'
import re
from datetime import datetime, time, timedelta
import time

class Worker(QThread):   
    def __init__(self,app,opts,num, parent = None, loginwait=True):
        QThread.__init__(self, parent)
        self.app=app
        self.num=num
        self.opts=opts
        self.stop=False
        self.killed=False
        self.loginwait=loginwait
        
        self.start()

    def run(self):
        self.sc=self.app.sepconnects.isChecked()
        
        if not self.sc:
            try:
                self.emit(SIGNAL('log'),'#%s Start connection' % self.num)
                self.db=MySQLdb.connect(host = self.opts[3],
                             user = self.opts[1],
                             passwd = self.opts[2],
                             db = self.opts[4], charset = "utf8", use_unicode = True)
                self.cursor=self.db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
                self.emit(SIGNAL('log'),'#%s Connected'%self.num)
            except Exception,e:
                self.emit(SIGNAL('err'),e)
                self.emit(SIGNAL('errlog'),e,self.num,'Connection')
                self.killed=True
                self.stop=True
             
        loginq="call web_user_login(@r, '%s', md5('%s'), '', '127.0.0.1', '', '%s')" % (self.opts[5],self.opts[6],self.opts[9])
        w=random.randint(0,1000)/100
        try:       
            if self.loginwait:
                self.emit(SIGNAL('log'),'#%s Wait %s seconds before login' % (self.num,w))
                time.sleep(w)
            self.cursor.execute(loginq)
            q=self.cursor.fetchall()[0]
            if q['message']=='Site is not allowed':
                print self.opts[5]
                self.killed=True
                self.stop=True
            sid=str(int(q['sid']))
            self.sid=sid
            self.emit(SIGNAL('log'),'#%s Logined'%self.num)
        except Exception,e:
            # self.emit(SIGNAL('err'),e)
            self.emit(SIGNAL('deadlock'))
            self.emit(SIGNAL('err'),'Locked: %s' % self.opts[5])
            self.killed=True
            self.stop=True
            self.sid=0

        f = file(CWD+'proc.list', 'r')
        n=0
        for line in f:
            if self.stop or (self.opts[-2] and n==self.opts[-2]):
                break
            if line:
                line=line.replace('$sid',sid)
                line=line.replace('$login_hash','')
                line=line.replace('$ip','127.0.0.1')
                line=line.replace('$user_agent','')
            


                try:
                    self.execquery(line)
                except Exception, e:          
                    try:
                        # if e.args[0]!=1016:
                        self.emit(SIGNAL('errlog'),'ERROR %s: %s'%e.args,self.num,line)
                        # elif e.args[0]==1213:
                        #     self.emit(SIGNAL('deadlock'))

                        # else:
                        #     self.execquery(line)
                        
                    except:
                        self.emit(SIGNAL('err'),e)
            n+=1
        f.close()
        self.db.close()
        self.emit(SIGNAL('proc_end'),self.num)

    def execquery(self,line):
        if self.sc:
            starttime = datetime.now()
            self.db=MySQLdb.connect(host = self.opts[3],
                     user = self.opts[1],
                     passwd = self.opts[2],
                     db = self.opts[4])
            self.cursor=self.db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
        else:
            self.cursor=self.db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
            starttime = datetime.now()
        
        try:
            line=line.decode('utf-8')
        except Exception,e:
            self.emit(SIGNAL('err'),e)
        self.cursor.execute(line)
        selects=self.cursor.fetchall()
        result=''
        # for q in selects:
        #     for field in q:
        #         result+=field+': '+str(q[field]).decode('utf-8')+'; '
        endtime = datetime.now()
        delta = endtime - starttime
        self.cursor.close()
        self.emit(SIGNAL('pylog'),line,self.num,delta,result)