#!/usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime

starttime = datetime.now()

import sys

sys.path.append('Garden')
sys.path.append('../Garden')
sys.path.append('../../Garden')
from winterside.snowflake import *
from PySide.QtGui import *
from PySide.QtCore import *
from winterside.baseQt import WinterQtApp

__author__ = 'averrin'


class UI(WinterQtApp):
    """
        Main class
    """

    def __init__(self, app):
        """
            Create your own mymainwidget inherits QWidget and set it through self.setMainWidget. For future access use self.mainWidget property
        """
        WinterQtApp.__init__(self, app)

    def _afterMWInit(self):
        """
            Fired after MainWindow initialisation
        """

        pass

    def _afterAppInit(self):
        """
            Fired after WinterApp initialisation
        """

        widget = QWidget(self)
        self.setMainWidget(widget)

    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)


def resolve(map1, map2, key):
    return 'overwrite'


def main():
    qtapp = QApplication(sys.argv)
    qtTranslator = QTranslator()
    if qtTranslator.load(CWD + "lang/%s.qm" % QLocale.system().name()):
        qtapp.installTranslator(qtTranslator)
        print QLocale.system().name(), qtapp.tr('Translate loaded')
    ui = UI(qtapp)

    if ui.config.options.maximized:
        ui.showMaximized()
    else:
        ui.show()
    api = ui.api

    endtime = datetime.now()
    delta = endtime - starttime
    ui.api.info('Initialization time: %s' % delta)
    print 'Started'
    qtapp.exec_()


if __name__ == '__main__':
    main()
