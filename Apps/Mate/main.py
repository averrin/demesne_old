#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from datetime import datetime

starttime = datetime.now()

import sys


sys.path.append('Garden')
sys.path.append('../Garden')
sys.path.append('../../Garden')

from winterstone.snowflake import *

from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.extraQt import WinterSideBar

from winterstone.baseQt import WinterQtApp, API

from tabs import *

__author__ = 'averrin'

print(CWD)


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
        widget = QTabWidget()
        self.azura = self.core.Azura()
        widget.addTab(FirmataTab(self), 'Firmata')
        widget.addTab(PinoutTab(), 'Pinout')
        widget.addTab(SketchesTab(), 'Sketches')
        self.setMainWidget(widget)

    def keyPressEvent(self, event):
        if event.key() == Qt.Key_Escape:
            QMainWindow.close(self)

    def getLog(self):
        return self.log


def resolve(map1, map2, key):
    return 'overwrite'


def main():
    qtapp = QApplication(sys.argv)
    qtTranslator = QTranslator()
    if qtTranslator.load(CWD + "lang/%s.qm" % QLocale.system().name()):
        qtapp.installTranslator(qtTranslator)
        print(QLocale.system().name(), qtapp.tr('Translate loaded'))
    ui = UI(qtapp)

    if ui.config.options.ui.maximized:
        ui.showMaximized()
    else:
        ui.show()
    api = ui.api

    if api.config.options.app.showRavenor:
        showRavenor(ui)

    endtime = datetime.now()
    delta = endtime - starttime
    ui.api.info('Initialization time: %s' % delta)

    print('Started')
    qtapp.exec_()


if __name__ == '__main__':
    main()
