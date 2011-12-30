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

from rpg.base import *
from ui import *

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

        widget = QTabWidget(self)
        widget.setLayout(QVBoxLayout())
        self.inv = InventoryPanel(self, self.core.hero)
        self.doll = DollPanel(self, self.core.hero)

        tables = QWidget()

        tables.setLayout(QGridLayout())
        widget.layout().addWidget(tables)
        hi = QWidget()
        hi.setLayout(QHBoxLayout())

        tables.layout().addWidget(hi)
        tables.layout().addWidget(self.inv, 0, 1)

        self.stats = StatsPanel(self, self.core.hero)
        hi.layout().addWidget(self.stats)
        hi.layout().addWidget(self.doll)

        self.log = GameLog(self)

        self.status = EffectsBar(self)
        #        widget.layout().addWidget(self.status)
        self.log.setTitleBarWidget(self.status)

        panel = QStackedWidget()
        # tables.layout().addWidget(panel,1,1)

        self.setMainWidget(widget)
        self.sideBar = WinterSideBar(self)

        self.addDockWidget(Qt.BottomDockWidgetArea, self.log)

        icon = QIcon(self.api.icons[self.api.config.options.app.inv_icon])
        widget.addTab(tables, icon, 'Inventory')
        icon = QIcon(self.api.icons[self.api.config.options.app.vault_icon])
        vt = QWidget()
        vt.setLayout(QVBoxLayout())
        self.vault = ContainerPanel(self, self.core.vault)
        vt.layout().addWidget(self.vault)

        reroll = QPushButton('ReRoll')
        reroll.clicked.connect(self.core.reroll)
        vt.layout().addWidget(reroll)

#        widget.addTab(vt, icon, 'Vault')


        self.core.start()

        self.createSBAction('dummy', 'Vault', vt, toolbar=True, keyseq='F5')
        self.api.setBadge('Vault','black','0')
#        self.api.setEmblem('Vault','red')
#        self.api.delBadge('Vault')
#        SBAction.objects.get(title='Vault').setAlpha(100)





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
        print QLocale.system().name(), qtapp.tr('Translate loaded')
    ui = UI(qtapp)

    ui.show()
    api = API()

    if api.config.options.app.showRavenor:
        showRavenor(ui)

    endtime = datetime.now()
    delta = endtime - starttime
    ui.api.info('Initialization time: %s' % delta)

    qtapp.exec_()


def showRavenor(ui):
    sys.path.append('../Ravenor')
    import raven
    from winterstone.base import WinterConfig
    from config import ConfigMerger

    raven.API().CWD += '../Ravenor/'
    ravenconfig = WinterConfig(file(raven.API().CWD + 'config/main.cfg'))
    darniconfig = WinterConfig(file(CWD + 'config/main.cfg'))
    merger = ConfigMerger(resolve)
    merger.merge(darniconfig.options.app, ravenconfig.options.app)
    API().config = darniconfig
    from etherstone.base import EtherIntegration

    wi = EtherIntegration(ui, UI=False)
    ravenor = raven.Panel(ui)
    ravenor.tree = raven.Tree(ravenor, ravenor.api.CWD)
    newpanel = raven.NewForm(ravenor)
    ui.sideBar = WinterSideBar(ui)
    ui.createSBAction('squares', 'Content', ravenor.tree.getWidget(), toolbar=True,
        keyseq=darniconfig.options.app.tree_shortcut)
    ui.createSBAction('newPage', 'New', newpanel, toolbar=True, keyseq=darniconfig.options.app.new_shortcut)
    ui.createSBAction('newPage', 'Edit', newpanel, toolbar=False, keyseq=darniconfig.options.app.new_shortcut)

    cmd = raven.CommandLine(ravenor)
    lay = QWidget()
    lay.setLayout(QVBoxLayout())
    lay.layout().addWidget(cmd)
    lay.layout().addWidget(ravenor)

    ui.mainWidget.addTab(lay, QIcon(raven.API().CWD + 'icons/app.png'), 'Ravenor')


if __name__ == '__main__':
    main()


