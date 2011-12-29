from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import API
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD, loadIcons
from etherstone.base import EtherIntegration
from config import Config
import os
from bottle import *


class Core(object):
    '''
        Store all your app logic here
    '''

    def _afterInit(self):
        '''
            when application totally init
        '''
        self.api = API()
        # self.view=self.app.mainWidget.view
        self.icons = loadIcons(CWD + 'static/icons/')
        global core
        core = self

    def main(self):
        '''
            dummy for main core method.
        '''
        #        self.view.loadPage('main.html')

        self.wi = EtherIntegration(UI=True)

    @route('/')
    @view('main')
    def main_menu(self):
        appdir = CWD + '../Apps/'
        apps = os.listdir(appdir)
        configs = []
        for app in apps:
            configs.append(Config(file(appdir + app + '/config/main.cfg')).info)
        return {'apps': configs, 'STATIC': 'http://localhost:4801/static/'}

    def credits(self):
        self.app.mainWidget.view.loadPage('credits.tpl')

    @route('/settings')
    def show_settings(self):
        API().sm.show()

