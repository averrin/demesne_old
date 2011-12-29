from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import SBAction
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD, loadIcons

from winterstone.extraQt import WinterEditor, CustomStyle, CustomLexer, FocusProxy
from augment import *

from winterstone.base import WinterObject
from winterstone.base import Borg
from winterstone.extraQt import WinterDirTree
from winterstone.extraQt import WinterSearch, WinterLine
from config import Config

from rpg.base import *
from ui import API
from rpg.items import *


class Core(QObject):
    """
        Store all your app logic here
    """

    def _afterInit(self):
        """
            when application totally init
        """
        self.api = API()
        self.main()
        # self.api.info('Core loaded.')


    def main(self):
        """
            dummy for main core method.
        """


        # self.hero.inventory.add(self.set1.getItem(self.hero))
        # self.hero.inventory.add(self.set1.getItem(self.hero))

        self.app.script.addObject('core', self)
        self.app.script.addObject('player', hero)
        self.app.script.addObject('inv', hero.inventory)

        self.hero = hero

        eventer.onSlotWear = self.updateSlot
        eventer.onSlotUnWear = self.clearSlot
        eventer.onEnchantActivate = self.onEffectActivate
        eventer.onEnchantDeActivate = self.onEffectDeActivate
        eventer.onSetActivate = self.onSetActivate
        eventer.onSetDeActivate = self.onSetDeActivate
        eventer.onUse = self.onUse
        eventer.onDrop = self.onDrop
        self.hero.onChange = self.heroChange
        eventer.msg = self.api.log
        eventer.onInventoryAdded = self.onInventoryAdded




        #        self.vault=Container('Vault',[ItemPrototypes.random(),ItemPrototypes.random(),ItemPrototypes.random(),Sets['SSwift'].getItem(self.hero),Sets['SSwift'].getItem(self.hero),Sets['SSwift'].getItem(self.hero)])
        self.vault = Container('Vault', [])

    #        self.reroll()



    def reroll(self):
        self.app.vault.container = Container('Vault',
            [ItemPrototypes.random(), ItemPrototypes.random(), ItemPrototypes.random(), ItemPrototypes.random(),
             ItemPrototypes.random(), ItemPrototypes.random()])
        self.app.vault.updateItems()

    def onInventoryAdded(self, item):
        try:
            self.app.inv.updateItems()
        except AttributeError:
            pass

    def start(self):
    #        self.helm.equip()
    #        self.goldRing.equip()
    #        self.helm.unequip()
        self.app.stats.update()

    def updateSlot(self, slot, item):
        target = None
        for n in xrange(len(self.hero.doll.slots)):
            if self.app.doll.item(n, 0).slot == slot:
                target = self.app.doll.item(n, 0)
                break
        if target is not None:
            qitem = QTableWidgetItem(item.name)
            self.app.doll.setItem(n, 1, qitem)
            qitem.setIcon(QIcon(self.api.icons[item.icon]))
            qitem.setToolTip(item.info)
            self.api.inv(self.tr('%1 weared').arg(item.name))

        target = None
        for n in xrange(len(self.hero.inventory.items)):
            if self.app.inv.item(n, 0).item == item:
                target = self.app.inv.item(n, 0)
                break
        if target is not None:
            for i in xrange(0, self.app.inv.columnCount()):
                if self.app.inv.item(n, i):
                    self.app.inv.item(n, i).setBackgroundColor(QColor(self.api.config.options.app.inv_equipped_color))

        self.app.status.update()

    def heroChange(self, *args):
        try:
            self.app.status.update()
            self.app.stats.update()
            self.app.inv.updateItems()
        except AttributeError, e:
            print e

    def clearSlot(self, slot, item):
        target = None

        for n in xrange(len(self.hero.doll.slots)):
            if self.app.doll.item(n, 0).slot == slot:
                target = self.app.doll.item(n, 0)
                break
        if target is not None:
            self.app.doll.setItem(n, 1, QTableWidgetItem(''))
            target.item = None
            self.api.inv(self.tr('%1 unweared').arg(item.name))

        target = None
        for n in xrange(len(self.hero.inventory.items)):
            if self.app.inv.item(n, 0).item == item:
                target = self.app.inv.item(n, 0)
                break
        if target is not None:
            # self.app.inv.setItem(n,2,QTableWidgetItem(''))
            for i in xrange(0, self.app.inv.columnCount()):
                if self.app.inv.item(n, i):
                    self.app.inv.item(n, i).setBackgroundColor(Qt.transparent)

        self.app.status.update()

    def onEffectActivate(self, effect):
        self.api.effect(self.tr('%1 activated').arg(effect.name))

    def onEffectDeActivate(self, effect):
        self.api.effect(self.tr('%1 deactivated').arg(effect.name))

    def onSetActivate(self, iset):
        self.api.iset(self.tr('%1 weared').arg(iset.name))

    def onSetDeActivate(self, iset):
        self.api.iset(self.tr('%1 unweared').arg(iset.name))

    def onUse(self, item):
        self.api.log(self.tr('%1 used').arg(item.name))

    def onDrop(self, item):
        self.api.drop(self.tr('%1 dropped').arg(item.name))