from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import SBAction
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD, loadIcons
from winterstone.base import WinterPlugin

from rpg.base import *
from rpg.items import *

class Test(WinterPlugin):
    def activate(self):
        ItemPrototypes['Helm01'] = {'type': Armor, 'name': 'Helm', 'slot': 'Head', 'defense': 15,
                                    'icon': 'inv_helmet_01', 'weight': 10, 'desc': 'Helm from plugin', 'quality': 5}

        self.active = True
        return True

    def deactivate(self):
        self.api.info('trololo')
        self.active = False
        return True
