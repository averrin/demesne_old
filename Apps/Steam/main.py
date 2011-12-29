#!/usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime, time

starttime = datetime.now()

import sys, os


sys.path.append('Garden')
sys.path.append('../../Garden')
from winterstone.extraQt import WinterLine

from winterstone.snowflake import *
from winterstone.extraQt import WinterEditor, WinterDirTree


from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.extraQt import WinterSideBar

from winterstone.baseQt import WinterQtApp, API, WinterAction, SBAction, WinterAPI
from etherstone.base import EtherIntegration
#from grab import *


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

        url='http://store.steampowered.com/search/tab?tab=Discounts&count=99'
        css='http://cdn.store.steampowered.com/public/css/styles_storev5.css'

        css='http://cdn.store.steampowered.com/public/css/styles_storev5.css'

#        g = Grab()
#        g.go(url)

#        persents=g.search_rex(re.compile('-\d+%'))
#        print persents.group(0)

        wi=EtherIntegration(self,UI=False)
        widget=wi.getWebView(toolbar=False)
        widget.view.js('var fileref=document.createElement("link");fileref.setAttribute("rel", "stylesheet");fileref.setAttribute("type", "text/css");fileref.setAttribute("href", %s)'%css)


        widget.view.load(QUrl(url))
#        self.widget=widget

#        widget.setLayout(QVBoxLayout())

        self.setMainWidget(widget)
        self.sideBar = WinterSideBar(self)
#        widget.view.loadFinished.connect(self.start)

        self.core.start()

#    def start(self):
#        css='http://cdn.store.steampowered.com/public/css/styles_storev5.css'
#        self.widget.view.js('var fileref=document.createElement("link");fileref.setAttribute("rel", "stylesheet");fileref.setAttribute("type", "text/css");fileref.setAttribute("href", %s)'%css)


    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)

    def getLog(self):
        return self.log

def resolve(map1, map2, key):
    print key
    return 'overwrite'

def main():
    qtapp = QApplication(sys.argv)
    qtTranslator = QTranslator()
    if qtTranslator.load(CWD+"lang/%s.qm" % QLocale.system().name()):
        qtapp.installTranslator(qtTranslator)
        print QLocale.system().name(), qtapp.tr('Translate loaded')
    ui = UI(qtapp)

    ui.show()
    api = API()

    if api.config.options.app.showRavenor:
        showRavenor(ui)

    endtime = datetime.now()
    delta = endtime - starttime
    api.info('Initialization time: %s' % delta)  

    qtapp.exec_()


def showRavenor(ui):
    sys.path.append('../Ravenor')
    import raven
    from winterstone.base import WinterConfig
    from config import ConfigMerger

    raven.API().CWD+='../Ravenor/'
    ravenconfig=WinterConfig(file(raven.API().CWD  + 'config/main.cfg'))
    darniconfig=WinterConfig(file(CWD  + 'config/main.cfg'))
    merger = ConfigMerger(resolve)
    merger.merge(darniconfig.options.app, ravenconfig.options.app)
    API().config=darniconfig
    from etherstone.base import EtherIntegration
    wi=EtherIntegration(ui,UI=False)
    ravenor=raven.Panel(ui)
    ravenor.tree=raven.Tree(ravenor,ravenor.api.CWD)
    newpanel=raven.NewForm(ravenor)
    ui.sideBar = WinterSideBar(ui)
    ui.createSBAction('squares','Content',ravenor.tree.getWidget(),toolbar=True,keyseq=darniconfig.options.app.tree_shortcut)
    ui.createSBAction('newPage','New',newpanel,toolbar=True,keyseq=darniconfig.options.app.new_shortcut)
    ui.createSBAction('newPage','Edit',newpanel,toolbar=False,keyseq=darniconfig.options.app.new_shortcut)

    cmd=raven.CommandLine(ravenor)
    lay=QWidget()
    lay.setLayout(QVBoxLayout())
    lay.layout().addWidget(cmd)
    lay.layout().addWidget(ravenor)

    
    ui.mainWidget.addTab(lay,QIcon(raven.API().CWD+'icons/app.png'),'Ravenor')




if __name__ == '__main__':
    main()


