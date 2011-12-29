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

    def __init__(self):
        """
            Create your own mymainwidget inherits QWidget. For future access use self.mainWidget property
        """
        WinterQtApp.__init__(self)
        wi = EtherIntegration(self, UI=True)
        mymainwidget = wi.getWebView(debug=True)

        self.setMainWidget(mymainwidget)

        mymainwidget.view.loadFinished.connect(start)
        mymainwidget.view.loadPage('/')


    def _afterMWInit(self):
        """
            Fired after MainWindow initialisation
        """

        pass

    def _afterAppInit(self):
        """
            Fired after WinterApp initialisation
        """
        pass


    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)


def main():
    qtapp = QApplication(sys.argv)
    global ui
    ui = UI()
    #    start()
    qtapp.exec_()


#   this strange workaround for method.connect(start), for example on loadFinished from webView
def start():
    global ui
    ui.show()
    api = API()

    endtime = datetime.now()
    delta = endtime - starttime
    api.info('Initialization time: %s' % delta)


if __name__ == '__main__':
    main()