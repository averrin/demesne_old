from PyQt4.QtGui import *
from PyQt4.QtCore import *
from augment import *
from winterstone.baseQt import WinterAPI as API
import subprocess
import sqlite3
import os

class Core(QObject):
    """
        Store all your app logic here
    """

    def _afterInit(self):
        """
            when application totally init
        """
        self.api = API()
        self.api.ex = self.app.getMethod
        self.api.config = self.app.config
        self.main()
        # self.api.info('Core loaded.')

    def main(self):
        """
            dummy for main core method.
        """
        # self.hero.inventory.add(self.set1.getItem(self.hero))
        # self.hero.inventory.add(self.set1.getItem(self.hero))
        pass

    class Azura(object):

        def __init__(self):
            self.voice = self.Voice()

        class Voice(object):
            def __init__(self):
                db = sqlite3.connect(os.path.join('contrib', 'lex.sqlite'))
                cursor = db.cursor()

                # cursor.execute('create table answers (type, text)')

                q = "select rowid, text from answers where type = %s"

                self.answers = {}
                for type in range(0, 5):
                    cursor.execute(q % type)
                    self.answers[type] = cursor.fetchall()

                cursor.close()

            def say(self, type):
                text = self.answers[type][random.randint(0, self.answers[type] - 1)]
                self.sayText(text)

            def sayText(self, text):
                args = [
                    'contrib\TTS\Govorilka_cp.exe',
                    text.encode('cp1251'),
                    '-E', 'Alyona (Russian) SAPI5',
                    '-d', 'contrib\TTS\Dic\Alyona22k.dic',
                    '-d', 'contrib\TTS\Dic\omograph.dic',
                    '-d', 'contrib\TTS\Dic\_punctuation.dic'
                ]
                # print(' '.join(args))
                subprocess.Popen(args)
