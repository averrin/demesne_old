import os
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



class Core(QObject):
    """
        Store all your app logic here
    """

    def _afterInit(self):
        """
            when application totally init
        """
#        self.api = API()
        self.main()
        # self.api.info('Core loaded.')


    def main(self):
        """
            dummy for main core method.
        """


       # self.hero.inventory.add(self.set1.getItem(self.hero))
       # self.hero.inventory.add(self.set1.getItem(self.hero))

        pass

    def start(self):
        pass
