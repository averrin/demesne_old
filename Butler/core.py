# -*- coding: utf-8 -*-
from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import API
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD, loadIcons
from etherstone.base import EtherIntegration
from config import Config
import os
from bottle import *
import subprocess


class Core(QObject):
    '''
        Store all your app logic here
    '''

    def _afterInit(self):
        '''
            when application totally init
        '''
        self.api = API()
        # self.view=self.app.mainWidget.view
        # self.icons = loadIcons(CWD + 'static/icons/')
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
    def main_menu():
        appdir = CWD + '../Apps/'
        apps = os.listdir(os.path.normpath(appdir))
        configs = []
        for app in apps:
            if os.path.isfile(appdir + app + '/config/main.cfg'):
                cfg=Config(file(appdir + app + '/config/main.cfg')).info
                cfg.icon='/apps/%s/icons/app.png'%app
                cfg.dir=app
                vc='success'
                if cfg.version.endswith('alpha'):
                    vc=''
                elif cfg.version.endswith('beta'):
                    vc='warning'
                cfg.ver_class=vc
                configs.append(cfg)
        return {'apps': configs, 'STATIC': 'http://localhost:4801/static/',
                'VAULT':'http://localhost:4801/vault/'}

    def credits(self):
        self.app.mainWidget.view.loadPage('credits.tpl')

    @route('/settings')
    def show_settings():
        core.emit(SIGNAL('exec'),'api.info boom')
        # API().sm.show()

    @route('/script/:method/:args')
    def script(method,args):
        args=args.split(',')
        args=' '.join(args)
        core.emit(SIGNAL('exec'),'%s %s' % (method,args))

    @route('/apps/:app/:fdir/:file_name')
    def server_static_images(app='',fdir='',file_name=''):
        root='%s../Apps/%s/%s/' % (CWD,app,fdir)
        return static_file(file_name, root=root)

    @route('/launch/:app')
    def launch(app):
        appdir = CWD + '../Apps/'
        path=appdir+app+'/main.py'
        path=path.replace('\\','\\')
        p=subprocess.Popen(['python',path], shell=False, stdout=subprocess.PIPE)
        status=p.communicate()[0].strip()
        if status.endswith('Started'):
            return 'Success'
        else:
            return 'Fail'

    @route('/newapp')
    @view('newapp')
    def newapp():
        return {'STATIC': 'http://localhost:4801/static/',
                'VAULT':'http://localhost:4801/vault/'}

