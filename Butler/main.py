#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

sys.path.append('Garden')
sys.path.append('../Garden')

from datetime import datetime
from winterstone.snowflake import *
from winterstone.extraQt import WinterEditor, WinterDirTree
from etherstone.base import EtherIntegration

from PyQt4.QtGui import *
from PyQt4.QtCore import *


starttime = datetime.now()

from winterstone.baseQt import WinterQtApp, API

__author__ = 'averrin'

class UI(WinterQtApp):
    """
        Main class
    """

    def __init__(self,app):
        """
            Create your own mymainwidget inherits QWidget. For future access use self.mainWidget property
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
        wi = EtherIntegration(self, UI=True)
        mymainwidget = wi.getWebView(debug=True)

        self.setMainWidget(mymainwidget)

        mymainwidget.view.loadFinished.connect(start)
        mymainwidget.view.loadPage('/')

        mymainwidget.view.page().mainFrame().setScrollBarPolicy(Qt.Horizontal, Qt.ScrollBarAlwaysOff)

        self.connect(self.core,SIGNAL('exec'),self.script.executeRaw)

        self.api.js=mymainwidget.view.js

    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)

    # def echo(self,*args):
        # print args


def main():
    qtapp = QApplication(sys.argv)
    global ui
    ui = UI(qtapp)
    #    start()
    qtapp.exec_()


#   this strange workaround for method.connect(start), for example on loadFinished from webView
def start():
    global ui
    if ui.config.options.maximized:
        ui.showMaximized()
    else:
        ui.show()
    api = API()

    endtime = datetime.now()
    delta = endtime - starttime
    api.info('Initialization time: %s' % delta)

    ui.mainWidget.view.js('$.ajax("/settings")')


if __name__ == '__main__':
    main()