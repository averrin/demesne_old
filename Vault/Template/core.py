from PySide.QtGui import *
from PySide.QtCore import *
from winterside.baseQt import SBAction
from winterside.winterBug import try_this
from winterside.snowflake import CWD, loadIcons

from augment import *
from winterside.baseQt import API




class Core(QObject):
    """
        Store all your app logic here
    """

    def _afterInit(self):
        """
            when application totally init
        """
        self.api = API()
        self.api.ex=self.app.getMethod
        self.api.config=self.app.config
        self.main()
        # self.api.info('Core loaded.')


    def main(self):
        """
            dummy for main core method.
        """
        pass

