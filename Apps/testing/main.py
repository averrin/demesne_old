#!/usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime, time

starttime = datetime.now()

import sys, os, shutil


sys.path.append('Garden')
sys.path.append('../Garden')
sys.path.append('../../Garden')
from winterstone.extraQt import WinterLine

from winterstone.snowflake import *
from winterstone.extraQt import WinterEditor, WinterDirTree

from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.extraQt import WinterSideBar

from winterstone.baseQt import WinterQtApp, API, WinterAction, SBAction, WinterAPI, Switch

import os
import re
from datetime import datetime, time, timedelta
from worker import Worker
from ui import Table
import matplotlib
matplotlib.use('QT4Agg')
import matplotlib.pyplot as plt
import config
users = config.Config(file(CWD+'users.cfg','r')).users
from PyQt4.QtWebKit import QWebView
from jinja2 import Template



__author__ = 'averrin'

class UI(WinterQtApp):
    """
        Main class
    """
    def __init__(self,app):
        """
            Create your own mymainwidget inherits QWidget and set it through self.setMainWidget. For future access use self.mainWidget property
        """
        WinterQtApp.__init__(self,app)



    def _afterMWInit(self):
        """
            Fired after MainWindow initialisation
        """

        pass

    def _afterAppInit(self):
        """
            Fired after WinterApp initialisation
        """

        self.setWindowTitle(u'Нагрузочное тестирование БД')

        table=Table(self)
        # table.setEditTriggers(QAbstractItemView.NoEditTriggers)
        self.table=table

        forms=QWidget()
        forms.setLayout(QGridLayout())
        userform=QWidget()
        userform.setLayout(QFormLayout())
        userform.setLayout(QVBoxLayout())
        userform.layout().addWidget(QLabel(u'Список пользователей настраивается в файле main.cfg. <br>Пользователи циклично распределяются по потокам.'))

        dbform=QWidget()
        dbform.setLayout(QFormLayout())
        self.user=QLineEdit()
        self.user.setText(self.config.options.app.db_user)
        self.password=QLineEdit()
        self.password.setText(self.config.options.app.db_password)
        self.host=QLineEdit()
        self.host.setText(self.config.options.app.db_host)
        self.base=QLineEdit()
        self.base.setText(self.config.options.app.db_base)
        self.domain=QLineEdit()
        self.domain.setText(self.config.options.app.domain)
        dbform.layout().addRow(u'Пользователь',self.user)
        dbform.layout().addRow(u'Пароль',self.password)
        dbform.layout().addRow(u'Сервер',self.host)
        dbform.layout().addRow(u'Имя базы',self.base)
        dbform.layout().addRow(u'Имя домена',self.domain)


        threadform=QWidget()
        threadform.setLayout(QGridLayout())
        self.num=QSpinBox()
        self.num.setMaximum(999)
        self.num.setMinimum(1)
        self.num.setValue(self.config.options.app.threads_num)
        self.num.setToolTip(u'Значительно влияет на время выполнения и загрузку компьютера')

        threadform.layout().addWidget(QLabel(u'Количество потоков'),1,0)
        threadform.layout().addWidget(self.num,1,1)
        self.sepconnects=Switch(u'Создавать отдельные подключения на каждый запрос')
        threadform.layout().addWidget(self.sepconnects,3,0)
        self.skiperrors=Switch(u'Пропускать ошибки')
        threadform.layout().addWidget(self.skiperrors,4,0)

        self.fullc=Switch(u'Полный цикл')
        self.fullc.setChecked(True)
        self.fullc.stateChanged.connect(self.togglefull)
        threadform.layout().addWidget(self.fullc,5,0)
        self.minthreads=QSpinBox()
        self.minthreads.setValue(1)
        self.minthreads.setMaximum(999)
        self.minthreads.setMinimum(1)

        threadform.layout().addWidget(QLabel(u'Начально потоков'),6,0)
        threadform.layout().addWidget(self.minthreads,6,1)

        self.step=QSpinBox()
        self.step.setValue(1)
        self.step.setMaximum(999)
        self.step.setMinimum(1)
        threadform.layout().addWidget(QLabel(u'Шаг'),7,0)
        threadform.layout().addWidget(self.step,7,1)

        self.mc=QSpinBox()
        self.mc.setValue(0)
        self.mc.setMaximum(99999)
        self.mc.setMinimum(0)
        threadform.layout().addWidget(QLabel(u'Максимум запросов (0 = весь файл)'),2,0)
        threadform.layout().addWidget(self.mc,2,1)

        # options=QTabWidget()
        # options.addTab(dbform,u'Настройки БД')

        graphoptions=QWidget()
        graphoptions.setLayout(QFormLayout())
        # options.addTab(graphoptions,u'Настройки графика')
        self.notshowmavg=Switch(u'Не показывать среднюю по максимуму')
        graphoptions.layout().addRow('',self.notshowmavg)

        self.showlevel01=Switch(u'Всегда показывать линию уровня 0.1sec')
        graphoptions.layout().addRow('',self.showlevel01)
        self.showlevel1=Switch(u'Всегда показывать линию уровня 1sec')
        graphoptions.layout().addRow('',self.showlevel1)

        self.notshowerr=Switch(u'Не показывать ошибки')
        graphoptions.layout().addRow('',self.notshowerr)

        self.detail=Switch(u'Детальный отчет')
        threadform.layout().addWidget(self.detail,8,0)

        # graphoptions.layout().addRow('',self.detail)

        # forms.layout().addWidget(options,1,1)
        # forms.layout().addWidget(threadform,1,0)

        self.sideBar = WinterSideBar(self)
        threadform.layout().setAlignment(Qt.AlignTop)
        self.createSBAction('configure','MainOptions',threadform,toolbar=True)
        self.createSBAction('db','db settings',dbform,toolbar=True)
        self.createSBAction('graph','graph settings',graphoptions,toolbar=True)


        self.resize(1200,600)
        widget=QWidget()
        widget.setLayout(QVBoxLayout())
        widget.layout().addWidget(forms)
        widget.layout().addWidget(QLabel(u''))
        widget.layout().addWidget(table)


        buttons=QWidget()
        buttons.setLayout(QHBoxLayout())

        hb=QPushButton(u'Справка')
        hb.clicked.connect(self.help)

        self.progress=QProgressBar()
        buttons.layout().addWidget(hb)
        buttons.layout().addWidget(self.progress)

        spacerItem=QWidget()
        spacerItem.setSizePolicy(QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Minimum))
        buttons.layout().addWidget(spacerItem)
        sb=QPushButton(u'Поехали!')
        sb.clicked.connect(self.launch)
        buttons.layout().addWidget(sb)
        bb=QPushButton(u'Стоп')
        bb.clicked.connect(self.stop)
        buttons.layout().addWidget(bb)
        qb=QPushButton(u'Выход')
        qb.clicked.connect(self.quit)
        buttons.layout().addWidget(qb)

        self.help=QMainWindow()
        self.help.resize(800,600)
        self.help.setWindowTitle(u'Справка')
        hwidget=QWidget()
        hwidget.setLayout(QVBoxLayout())
        self.help.browser=QWebView()
        hwidget.layout().addWidget(self.help.browser)
        self.help.setCentralWidget(hwidget)


        self.viewer=QWebView()
        self.viewer.setFixedWidth(950)
        self.viewer.hide()

        wrapper=QWidget()
        wrapper.setLayout(QHBoxLayout())
        wrapper.layout().addWidget(widget)
        wrapper.layout().addWidget(self.viewer)

        widget.layout().addWidget(buttons)

        self.total=0
        self.callsnum=0
        self.errnum=0

        self.data=[]
        self.edata=[]
        self.mdata=[]
        self.tt=0
        self.tts=[]
        self.force_stop=False
        self.callsavg={}
        self.pdata={}
        self.cc={}

        self.args={}

        self.setMainWidget(wrapper)
        # self.sideBar = WinterSideBar(self)

        self.core.start()

    def togglefull(self):
        if self.fullc.isChecked():
            self.minthreads.setEnabled(True)
            self.step.setEnabled(True)
            self.detail.setEnabled(True)
        else:
            self.minthreads.setEnabled(False)
            self.step.setEnabled(False)
            self.detail.setEnabled(False)


    def full(self):
        if int(self.num.value())-int(self.minthreads.value())>=1:
            self.total=int(self.num.value())
            self.num.setValue(self.minthreads.value())
            self.start()
        else:
            QMessageBox.information(self, 'Warning', u'Для полного цикла требуется минимум два потока')


    def help(self):
        self.help.browser.load(QUrl('help.html'))
        self.help.show()

    def quit(self):
        self.stop()
        sys.exit()

    def stop(self):
        self.force_stop=True
        for t in self.threads:
            t.stop=True
        self.progress.reset()
        self.api.info('Threads was stopped')
        QMessageBox.information(self, 'Threads was stopped', u'Ага, остановили')
        self.total=0
        self.callsnum=0
        self.errnum=0

        self.data=[]
        self.edata=[]
        self.mdata=[]
        self.tt=0
        self.tts=[]
        self.force_stop=False
        self.callsavg={}
        self.pdata={}
        self.cc={}

        self.args={}

        plt.close()
        plt.clf()

    def deadlock(self):
        # for t in self.threads:
            # t.stop=True
        # self.progress.reset()
        self.api.error('Deadlock!')
        # QMessageBox.information(self, 'Deadlock', u'Попробуйте еще раз.')

    def onPress(self,item):
        if hasattr(item,'args'):
            QMessageBox.information(self, 'Call arguments', item.args)

    def launch(self):
        if self.fullc.isChecked():
            self.full()
        else:
            self.start()

    def start(self):
        self.table.clear()
        self.table.setRowCount(0)
        self.table.setHorizontalHeaderLabels(self.table.headers)
        opts=[
        self.user.text(),
        self.password.text(),
        self.host.text(),
        self.base.text(),
        ]
        self.threads=[]
        for n,opt in enumerate(opts):
            opts[n]=str(opt)
        opts.insert(0,CWD+'qt.sh')
        

        f = file(CWD+'proc.list', 'r')
        count=0
        for line in f:
            count+=1
        if count>int(self.mc.value()) and int(self.mc.value()):
            count=int(self.mc.value())
        else:
            self.mc.setValue(count)
        f.close()

        self.progress.reset()
        self.progress.setMaximum(count*int(self.num.value()))

        for i in xrange(int(self.num.value())):
            topts=opts[:]
            for o in users[i%len(users)]:
                topts.append(users[i%len(users)][o])
            
            topts.append(str(i))
            topts.append(int(self.mc.value()))
            topts.append(self.domain.text())
            if int(self.num.value())!=1:
                w=Worker(self,topts,i,self)
            else:
                w=Worker(self,topts,i,self,False)

            self.threads.append(w)
            self.connect(w,SIGNAL('pylog'),self.table.pylog)
            self.connect(w,SIGNAL('errlog'),self.table.errlog)
            self.connect(w,SIGNAL('proc_end'),self.proc_end)
            self.connect(w,SIGNAL('deadlock'),self.deadlock)
            self.connect(w,SIGNAL('log'),self.api.debug)
            self.connect(w,SIGNAL('err'),self.api.error)

        self.calls={}
        
        self.ended=0


    def proc_end(self,num):
        self.ended+=1
        if not self.threads[num].killed:
            self.tt+=1
            self.api.info('Thread #%s ended [sid: %s] (Total finished: %s)' % (num,self.threads[num].sid,self.ended))
        else:
            self.api.info('Thread #%s KILLED (Total finished: %s)' % (num,self.ended))
        if self.ended==len(self.threads) and not self.force_stop:
            if self.total and self.total>int(self.num.value()):
                self.num.setValue(int(self.num.value())+int(self.step.value()))
                self.progress.setValue(self.progress.minimum())
                self.api.info('One cycle finished. Total calls: %s, Errors: %s' % (self.callsnum,self.errnum))

                self.average()
                self.start()
            elif self.total:
                self.progress.setValue(self.progress.maximum())
                self.api.info('Full cycle finished. Total calls: %s, Errors: %s' % (self.callsnum,self.errnum))
                QMessageBox.information(self, u'Полный цикл', u'Прогон закончен. Всего вызовов: %s, Ошибок: %s' % (self.callsnum,self.errnum))
                self.average()
                self.stop()
                
            else:
                self.progress.setValue(self.progress.maximum())
                # print u'Всего вызовов: %s, Ошибок: %s' % (self.callsnum,self.errnum)
                self.data=[]
                self.mdata=[]
                self.edata=[]
                self.api.info('Finished. Total calls: %s, Errors: %s' % (self.callsnum,self.errnum))
                QMessageBox.information(self, u'Завершено', u'Всего вызовов: %s, Ошибок: %s' % (self.callsnum,self.errnum))
                self.stop()
            self.tt=0

    def average(self):
        totalavg=timedelta(seconds=0)
        m=[]
        for proc in self.calls:
            item=self.calls[proc]
            avg=item['time'][0]
            for t in item['time'][1:]:
                avg+=t
            avg=avg/len(item['time'])
            totalavg+=avg
            m.append(sorted(item['time'])[-1])

        totalavg/=len(self.calls)
        td=totalavg
        td=(td.microseconds + (td.seconds + td.days * 86400) * 1000000)

        self.data.append(td)
        self.edata.append(self.errnum*100)
        tm=timedelta(seconds=0)
        for t in m:
            tm+=t
        tm/=len(m)
        tm=(tm.microseconds + (tm.seconds + tm.days * 86400) * 1000000)
        self.mdata.append(tm)
        self.graph()

    def graph(self):
        self.tts.append(self.tt)
        if sorted(self.mdata)[-1]>100000 or self.showlevel01.isChecked():
            line=[]
            for i in self.data:
                line.append(100000)
            l=plt.plot(self.tts,line)
            plt.setp(l, color='blue', linewidth=1.0,label='0.1 second')

        if sorted(self.mdata)[-1]>1000000 or self.showlevel1.isChecked():
            lline=[]
            for i in self.data:
                lline.append(1000000)
            ll=plt.plot(self.tts,lline)
            plt.setp(ll, color='red', linewidth=2.0,label='1 second')
        
        avg=plt.plot(self.tts,self.data)
        plt.setp(avg, color='g', linewidth=2.0,marker='o',label='Average time')
        if not self.notshowmavg.isChecked():
            m=plt.plot(self.tts,self.mdata)
            plt.setp(m, color='orange', linewidth=2.0,marker='o',label='Average max time')
        if not self.notshowerr.isChecked():
            err=plt.plot(self.tts,self.edata)
            plt.setp(err, color='red', linewidth=1.0,marker='.',label='Error count*100')

        plots=[avg]
        labels=['Average time']
        if sorted(self.mdata)[-1]>100000 or self.showlevel01.isChecked():
            plots.append(l)
            labels.append('0.1 second')
        if sorted(self.mdata)[-1]>1000000 or self.showlevel1.isChecked():
            plots.append(ll)
            labels.append('1 second')
        if not self.notshowmavg.isChecked():
            plots.append(m)
            labels.append('Average max time')
        if not self.notshowerr.isChecked():
            plots.append(err)
            labels.append('Error count*100')
        leg = plt.legend(plots,labels, fancybox=True)
        leg.get_frame().set_alpha(0.5)


        plt.ylabel('Microseconds (1 second = 1000000 ms)')
        plt.xlabel('Threads count')

        plt.title('Average time of procedure calls')
        # plt.text(60, .025, r'$\mu=100,\ \sigma=15$')
        # plt.axis([1, len(self.data), 0, sorted(self.mdata)[-1]])
        plt.grid(True)
        # plt.minorticks_on()
        ax=avg[0].get_axes()
        # ax.minorticks_on()
        ticks=self.data[:]
        ticks.insert(0,0)
        ticks.extend(self.mdata)
        ticks=sorted(ticks)

        for n in xrange(len(ticks)-2):
            if not ticks[n+1]-ticks[n]>0.1*ticks[-1]:
                ticks[n]=0
                ticks=sorted(ticks)
        ticks=list(set(ticks))

        ax.set_yticks(ticks, minor=False)
        # self.tts.insert(0,0)
        # ax.set_xticks(self.tts, minor=False)
        try:
            ax.minorticks_on()
        except:
            pass
        # ylabels=[str(x) for x in self.data]
        # ylabels.insert(0,'0')
        # ax.set_yticklabels(ylabels, minor=True)

        plt.savefig('chart.png')
        plt.close()
        plt.clf()

        if self.detail.isChecked():
            try:
                os.mkdir(CWD+'charts')
            except OSError:
                pass
            for proc in self.callsavg:
                data=self.callsavg[proc]
                x=data.keys()
                y1=[]
                y2=[]
                for threads in data:
                    tm=data[threads][1]
                    tm=(tm.microseconds + (tm.seconds + tm.days * 86400) * 1000000)
                    y1.append(tm)
                    ta=data[threads][0]
                    ta=(ta.microseconds + (ta.seconds + ta.days * 86400) * 1000000)
                    y2.append(ta)
                    if proc not in self.pdata:
                        self.pdata[proc]={}
                    self.pdata[proc][threads]={'tavg':ta, 'tmax':tm}
                    self.cc[proc]=data[threads][2]
                m=plt.plot(x,y1)
                plt.setp(m, color='orange', linewidth=2.0,marker='o')
                a=plt.plot(x,y2)
                plt.setp(a, color='green', linewidth=2.0,marker='o')

                plots=[m,a]
                labels=['Average max time','Average time']

                if sorted(self.mdata)[-1]>100000 or self.showlevel01.isChecked():
                    line=[]
                    for i in self.data:
                        line.append(100000)
                    l=plt.plot(self.tts,line)
                    plt.setp(l, color='blue', linewidth=1.0,label='0.1 second')

                if sorted(self.mdata)[-1]>1000000 or self.showlevel1.isChecked():
                    lline=[]
                    for i in self.data:
                        lline.append(1000000)
                    ll=plt.plot(self.tts,lline)
                    plt.setp(ll, color='red', linewidth=2.0,label='1 second')

                if not self.notshowmavg.isChecked():
                    plots.append(m)
                    labels.append('Average max time')
                if not self.notshowerr.isChecked():
                    plots.append(err)
                    labels.append('Error count*100')

                leg = plt.legend(plots,labels, fancybox=True)
                leg.get_frame().set_alpha(0.5)


                plt.ylabel('Microseconds (1 second = 1000000 ms)')
                plt.xlabel('Threads count')
                plt.title('Average time of %s call' % proc)
                plt.grid(True, which='both')

                plt.savefig('charts/%s.png'%proc)
                plt.close()
                plt.clf()

        self.report()
        self.errnum=0
        self.calls={}
            

    def report(self):
        try:
            os.mkdir(CWD+'reports')
        except OSError:
            pass
        tpl=file(CWD+'templates/total_report.html','r').read()
        template=Template(tpl.decode('utf-8'))
        data=[]
        for i,dot in enumerate(self.tts):
            data.append({'threads':dot,'tavg':self.data[i],'tmax':self.mdata[i]})
        args={'host':self.host.text(),'base':self.base.text(),'data':data,'cpt':str(self.mc.value()),
        'tts':str(self.tts),'cycles':len(data),'procs':self.callsavg,'detail':self.detail.isChecked(),
        'cc':self.callsnum,'errc':self.errnum}
        report=template.render(**args).encode('utf-8')
        file(CWD+'index.html','w').write(report)

        self.viewer.show()
        self.viewer.load(QUrl(CWD+'index.html'))
        self.viewer.reload()

        
        if self.detail.isChecked():
            tpl=file(CWD+'templates/proc_report.html','r').read()
            template=Template(tpl.decode('utf-8'))
            for proc in self.callsavg:
                args={'proc':proc,'host':self.host.text(),'base':self.base.text(),'data':self.pdata[proc],
                'cycles':self.cc[proc],'tts':len(self.callsavg[proc]),'args':self.args[proc]}
                report=template.render(**args).encode('utf-8')
                file(CWD+'reports/%s.html'%proc,'w').write(report)



    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)

    def getLog(self):
        return self.log

def main():
    qtapp = QApplication(sys.argv)
    qtTranslator = QTranslator()
    if qtTranslator.load(CWD+"lang/%s.qm" % QLocale.system().name()):
        qtapp.installTranslator(qtTranslator)
        print QLocale.system().name(), qtapp.tr('Translate loaded')
    ui = UI(qtapp)

    ui.showMaximized()
    api = API()

    endtime = datetime.now()
    delta = endtime - starttime
    api.info('Initialization time: %s' % delta)

    print 'Started'
    qtapp.exec_()


if __name__ == '__main__':
    main()


