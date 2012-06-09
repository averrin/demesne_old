from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import API
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD,loadIcons
from etherstone.base import EtherIntegration


from rpgbase import genItem


class Core(object):
    '''
        Store all your app logic here
    '''
    def _afterInit(self):
        '''
            when application totally init
        '''
        self.api = API()
        self.view=self.app.mainWidget.view
        self.icons=loadIcons(CWD+'static/icons/')

    def main(self):
        '''
            dummy for main core method.
        '''
#        self.view.loadPage('main.html')

        self.wi=EtherIntegration(self,UI=True)

    def loadUI(self):
        self.app.createSBAction(QIcon(self.icons['26_0']),'Hero',self.wi.getWebView(),toolbar=True)
        self.app.createSBAction(QIcon(self.icons['5_0']),'Inventory',self.wi.getWebView(),toolbar=True)
        self.app.createSBAction(QIcon(self.icons['20_4']),'Skills',self.wi.getWebView(),toolbar=True)


    def load_items(self):
        self.loadUI()
        items=[]
        for i in xrange(50):
            items.append(genItem(''))

        self.app.mainWidget.view.loadPage('hello.html',items=items)

    def main_menu(self):
        self.app.mainWidget.view.loadPage()

    def credits(self):
        self.app.mainWidget.view.loadPage('credits.html')

    def show_settings(self):
        self.app.sm.show()

