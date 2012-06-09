# -*- coding: utf-8 -*-
from PyQt4.QtGui import *
from PyQt4.QtCore import *
import re
from datetime import datetime, time, timedelta

class Table(QTableWidget):
    def __init__(self,parent):
        self.parent=parent
        QTableWidget.__init__(self,0,4)
        self.horizontalHeader().setResizeMode(QHeaderView.Stretch)
        self.headers=[u'Процедура',u'Время min',u'Время avg',u'Время max']
        self.setHorizontalHeaderLabels(self.headers)
        self.itemClicked.connect(self.parent.onPress)

    def pylog(self,call,num,ctime,result):
        procname=re.compile('call ([\w_]*)\(([^\)]*)\)')
        proc=procname.match(call).group(1)
        args=procname.match(call).group(2)
        if proc not in self.parent.calls:
            n=self.rowCount()
            self.parent.calls[proc]={'args':args,'time':[ctime],'n':n}      
            self.insertRow(n)
            ci=QTableWidgetItem(proc)
            self.setItem(n,0,ci)
            self.setItem(n,4,QTableWidgetItem(str(num)))
            ti=QTableWidgetItem(str(ctime))
            ti.args=args
            self.setItem(n,1,ti)
            self.parent.progress.setValue(self.parent.progress.value()+1)
            if proc not in self.parent.callsavg:
                self.parent.callsavg[proc]={}
            self.parent.callsavg[proc][self.parent.tt if self.parent.tt else 1]=(ctime,ctime,1)
            self.parent.args[proc]=[]
            self.parent.args[proc].append(args)
        elif ctime:
            self.parent.calls[proc]['time'].append(ctime)
            times=self.parent.calls[proc]['time']
            times=sorted(times)
            timin=self.item(self.parent.calls[proc]['n'],1)
            if not timin or timin.text()!=str(times[0]):
                timin=QTableWidgetItem(str(times[0]))
                timin.args=args
                if times[0]>timedelta(seconds=1):
                    timin.setBackground(QColor('darkorange'))
                self.setItem(self.parent.calls[proc]['n'],1,timin)
            timax=self.item(self.parent.calls[proc]['n'],3)
            if not timax or timax.text()!=str(times[-1]):
                timax=QTableWidgetItem(str(times[-1]))
                timax.args=args
                if times[-1]>timedelta(seconds=1):
                    timax.setBackground(QColor('darkorange'))
                self.setItem(self.parent.calls[proc]['n'],3,timax)
            # avg=sum(times)/len(times)
            avg=times[0]
            for t in times[1:]:
                avg+=t
            avg=avg/len(times)
            tiavg=QTableWidgetItem(str(avg))
            if avg>timedelta(seconds=1):
                tiavg.setBackground(QColor('darkorange'))
            self.setItem(self.parent.calls[proc]['n'],2,tiavg)
            self.parent.progress.setValue(self.parent.progress.value()+1)
            if proc not in self.parent.callsavg:
                self.parent.callsavg[proc]={}
            self.parent.callsavg[proc][self.parent.tt if self.parent.tt else 1]=(avg,times[-1],len(times))
            self.parent.args[proc]=[]
            self.parent.args[proc].append(timin.args)
            if timax:
                self.parent.args[proc].append(timax.args)
        self.parent.callsnum+=1

    def errlog(self,err,num,call):
        if not self.parent.skiperrors.isChecked() and call:
            procname=re.compile('call ([\w_]*)\(([^\)]*)\)')
            proc=procname.match(call).group(1)
            args=procname.match(call).group(2)

            n=self.rowCount() 
            self.insertRow(n)
            ci=QTableWidgetItem(proc)
            ci.args=args
            self.setItem(n,0,ci)
            self.setItem(n,4,QTableWidgetItem(str(num)))
            n=self.rowCount()
            self.insertRow(n)
            self.setSpan(n,0,1,4)
            erri=QTableWidgetItem(err)
            erri.setBackground(QColor('darkred'))
            self.setItem(n,0,erri)
            self.parent.progress.setValue(self.parent.progress.value()+1)
        self.parent.callsnum+=1
        self.parent.errnum+=1