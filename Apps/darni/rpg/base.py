import random
import sys


sys.path.append('Garden')
sys.path.append('../../Garden')

from winterstone.base import WinterObject, WinterAPI
from winterstone.baseQt import WinterPool, WinterRunnable, WINTERPOOL
from winterstone.snowflake import CWD
from config import Config
import weakref

fAPI = WinterAPI

rules = Config(open(CWD + 'rpg/rules.cfg'))


class Eventer(object):
    def onSlotWear(self, slot, item):
        pass

    def onSlotUnWear(self, slot, item):
        pass

    def onEffectActivate(self, effect):
        pass

    def onEffectShot(self, effect):
        pass

    def onEffectDeActivate(self, effect):
        pass

    def onEnchantActivate(self, effect):
        pass

    def onEnchantDeActivate(self, effect):
        pass

    def onSetActivate(self, effect):
        pass

    def onSetDeActivate(self, effect):
        pass

    def onUse(self, item):
        pass

    def onDrop(self, item):
        pass

    def onInventoryAdded(self, item):
        pass

    def msg(self, msg):
        pass

eventer = Eventer()


class CantWearException(Exception):
    pass


class CantEquipException(Exception):
    pass


class CantUnEquipException(Exception):
    pass


class AlreadyDeactivatedException(Exception):
    pass


class CantActivateException(Exception):
    pass


class Slot(WinterObject):
    def __init__(self, name, icon, doll):
        WinterObject.__init__(self)
        self.icon = icon
        self.item = None
        self.name = name
        self.doll = doll

    def wear(self, item):
        if self.name == item.slot and self.check(item):
            if self.item is not None:
                if hasattr(item, 'onSlotFull'):
                    result = item.onSlotFull(self)
                    if result:
                        Slot.objects.get(name=item.slot).wear(item)
                        item.slot = self.name
                    return
                self.clear()
            self.item = item
            item.onWear(self)
            eventer.onSlotWear(self, item)
            self.doll.owner.onEquip()
        else:
            raise CantWearException('Item check failed or wrong slot')

    def clear(self):
        if self.item is not None:
            self.item.onUnWear(self)
            eventer.onSlotUnWear(self, self.item)
            self.item = None

    def check(self, item):
        return True


class Item(WinterObject):
    def __init__(self, name, icon=rules.DefaultIcon, weight=0, desc='', quality=3, material=None, rarity=0):
        WinterObject.__init__(self)
        self.name = name
        self.weight = weight
        self.inv = None
        self.material = material
        self.rarity = rarity
        self.quality = quality
        self.is_id = False
        self.icon = icon
        self.desc = desc

    def onCopy(self):
        WinterObject.__refs__[Item].append(weakref.ref(self))

    @property
    def info(self):
        info = "<img src=%s style='float:left;'><b>%s</b>(%s)<br>Quality: %s<br><i>%s</i>" % (
        fAPI().icons[self.icon], self.name, self.weight, rules.qualities[self.quality], self.desc)
        if hasattr(self, 'from_set') and self.from_set is not None:
            info += "<br>From set: <b>%s</b><br>" % self.from_set.name
            info += '<br>'.join([effect.short_info for effect in self.from_set.enchant.effects])
        return info

    def onDrop(self, inv):
        self.inv = None

    def onGet(self, inv):
        self.inv = inv

    def setEnchant(self, enchant):
        self.enchant = enchant
        if enchant.namepostfix:
            self.name += ' of %s' % enchant.namepostfix
        return self


class Wearable(Item):
    def __init__(self, name, slot, *args, **kwargs):
        Item.__init__(self, name, *args, **kwargs)
        self.slot = slot
        self.equipped = False
        self.enchant = None
        self.from_set = None

    def onWear(self, slot):
        self.equipped = True
        if self.enchant is not None:
            self.enchant.activate(slot.doll.owner)
        if self.from_set is not None:
            self.from_set.activateEnchant(slot.doll.owner)

    def onUnWear(self, slot):
        self.equipped = False
        if self.enchant is not None:
            self.enchant.deactivate()
        if self.from_set is not None:
            self.from_set.deactivateEnchant()

    def equip(self):
        if self.inv is not None:
            slot = self.inv.owner.doll.__getattr__(self.slot)
            slot.wear(self)
        else:
            raise CantEquipException('Item isn\'t in inventory')

    def unequip(self):
        if self.equipped:
            slot = Slot.objects.get(item=self)
            if slot:
                slot.clear()
        else:
            raise CantUnEquipException('Item isn\'t equipped')


class EntityGen(dict):
    def random(self):
        proto = list(self.keys())[random.randint(0, len(self) - 1)]
        return self[proto]


class EnchantGen(EntityGen):
    def __getitem__(self, key):
        prototype = dict.__getitem__(self, key).copy()
        enchant = Enchant(**prototype)
        return enchant


class EffectGen(EntityGen):
    def __getitem__(self, key):
        prototype = dict.__getitem__(self, key).copy()
        itemclass = prototype['type']
        del prototype['type']
        effect = itemclass(**prototype)
        omin = int(effect.value / 4 - (effect.value / 4) * 1.5)
        omax = int(effect.value / 4 + (effect.value / 4) * 1.5)
        offset = random.randint(0 - int(omin), int(omax))

        effect.value += int(offset)

        return effect


class ItemGen(EntityGen):
    def __getitem__(self, key):
        prototype = dict.__getitem__(self, key).copy()
        itemclass = prototype['type']
        del prototype['type']
        item = itemclass(**prototype)
        if isinstance(item, Armor):
            omin = int(item.defense / 4 - (item.defense / 4) * item.quality / 10)
            omax = int(item.defense / 4 + (item.defense / 4) * item.quality / 10)
            offset = random.randint(0 - int(omin), int(omax))
            if offset > 0 and hasattr(self, 'owner'):
                offset *= (1 + self.owner.Luck / 100)
            item.defense += int(offset)
        elif isinstance(item, Weapon):
            omin = item.damage / 4 - (item.damage / 4) * item.quality / 10
            omax = item.damage / 4 + (item.damage / 4) * item.quality / 10
            offset = random.randint(0 - int(omin), int(omax))
            if offset > 0 and hasattr(self, 'owner'):
                offset *= (1 + self.owner.Luck / 100)
            item.damage += int(offset)
        return item

    def randomEnchant(self, item):
        enchant = list(Enchants.values())[random.randint(0, len(Enchants) - 1)]
        if hasattr(enchant, 'except_classes') and item.__class__ in enchant.except_classes or\
            hasattr(enchant, 'only_classes') and item.__class__ not in enchant.only_classes or\
            hasattr(enchant, 'for_set') and enchant.for_set:
            return self.randomEnchant(item)
        item.setEnchant(enchant)

    def setOwner(self, owner):
        self.owner = owner

    def random(self, enchant=1):
        proto = list(self.keys())[random.randint(0, len(self) - 1)]
        while 'rarity' in dict.__getitem__(self, proto) and dict.__getitem__(self, proto)['rarity'] > 9:
            proto = list(self.keys())[random.randint(0, len(self) - 1)]
        item = self[proto]
        if enchant:
            if enchant == 1:
                pass
            else:
                self.randomEnchant(item)
        return item


ItemPrototypes = ItemGen()
Items = {}
Effects = {}
EffectPrototypes = EffectGen()
Enchants = {}
EnchantPrototypes = EnchantGen()
Sets = {}


class Set(WinterObject):
    def __init__(self, name, items, enchant):
        WinterObject.__init__(self)
        self.name = name
        self.items = items
        self.enchant = enchant
        self.generated_items = []
        for n, item in enumerate(self.items):
            if not isinstance(item, Wearable):
                item = ItemPrototypes[item]
                self.items[n] = item
            item.from_set = self

    def getItem(self, target):
        items = self.items[:]
        for item in target.inventory.items:
            if item in items:
                items.remove(item)
        if items:
            item = items[random.randint(0, len(items) - 1)]
            if item not in self.generated_items:
                self.generated_items.append(item)
                return item
            else:
                return None
        else:
            return None

    def activateEnchant(self, target):
        items = Wearable.objects.filter(from_set=self, equipped=True)
        n = 0
        for item in target.inventory.items:
            if item in items:
                n += 1
        if n == len(self.items):
            self.enchant.activate(target)
            eventer.onSetActivate(self)

    def deactivateEnchant(self):
        try:
            self.enchant.deactivate()
            eventer.onSetDeActivate(self)
        except AlreadyDeactivatedException:
            pass


class Inventory(object):
    def __init__(self, owner):
        self.items = []
        self.owner = owner

    @property
    def capacity(self):
        return self.owner.Strength * rules.InvCapacityMultip

    def calcWeight(self):
        all_weight = 0
        for item in self.items:
            all_weight += item.weight
        return all_weight

    def canGet(self, item):
        all_weight = self.calcWeight()
        if (self.capacity - all_weight) >= item.weight:
            if hasattr(item, 'canGet'):
                return item.canGet(self.owner)
            else:
                return True
        else:
            return False

    def add(self, item):
        if item and self.canGet(item):
            self.items.append(item)
            item.onGet(self)
            eventer.onInventoryAdded(item)

    def remove(self, item):
        self.items.remove(item)
        item.onDrop(self)
        eventer.onDrop(item)
        item.inv = None

    def destroy(self, item):
        self.items.remove(item)
        item.inv = None


class Container(WinterObject):
    def __init__(self, name, items=[], coins=0):
        WinterObject.__init__(self)
        self.name = name
        self.items = items
        self.coins = coins
        for item in self.items[:]:
            if item is None or not item:
                self.items.remove(item)
        for n, item in enumerate(self.items):
            if not isinstance(item, Item):
                item = ItemPrototypes[item]
                self.items[n] = item

    def add(self, item):
        # if issubclass(item,Item):
        self.items.append(item)
        # elif type(item).__name__=='list':
        # self.items.expand(item)

    def remove(self, item):
        # if issubclass(item,Item):
        self.items.remove(item)
        # elif type(item).__name__=='list':
        # for i in item:
        # self.items.remove(i)

    def get(self, item):
        pass


class Doll(object):
    def __init__(self, owner):
        self.owner = owner
        self._slots = rules.slots
        self.slot_names = []
        self.slots = []
        for slot in self._slots:
            self.slots.append(Slot(slot['name'], slot['icon'], self))
            self.slot_names.append(slot['name'])

    def __getattr__(self, item):
        if item in self.slot_names:
            slot = Slot.objects.get(name=item, doll=self, item=None)
            if slot:
                return slot
            else:
                return Slot.objects.get(name=item, doll=self)
        else:
            return self.__getattribute__(item)


class Effect(WinterObject):
    def __init__(self, name, activate=None, deactivate=None, icon=rules.DefaultIcon):
        WinterObject.__init__(self)
        self.name = name
        self._activate = activate
        self._deactivate = deactivate
        self.target = None
        self.icon = icon
        self.short_info = self.info
        self.info_postfix = ''
        self.activated = False

    @property
    def info(self):
        return self.name

    def activate(self, target):
        if self.activate is not None:
            self.target = target
            try:
                self._activate()
                self.activated = True
                eventer.onEffectActivate(self)
            except Exception as e:
                self.target = None
                raise CantActivateException(str(e))
            self.target.onChange()

    def deactivate(self):
        if self.deactivate is not None:
            if self.target is not None:
                self._deactivate()
                self.activated = False
                target = self.target
                self.target = None
                target.onChange()
                eventer.onEffectDeActivate(self)
            else:
                raise AlreadyDeactivatedException('Effect already deactivated')


class Enchant(WinterObject):
    def __init__(self, name, effects=None, icon=rules.DefaultIcon, namepostfix='', **kwargs):
        WinterObject.__init__(self, **kwargs)
        self.name = name
        self.effects = []
        self.icon = icon
        self.namepostfix = namepostfix
        if effects is not None:
            if isinstance(effects, list):
                for effect in effects:
                    if isinstance(effect, Effect):
                        self.effects.append(effect)
                        effect.info_postfix += '<br>Gained from %s' % self.name
            else:
                raise TypeError('Wrong effects list definition')

    @property
    def info(self):
        info = '<b>%s</b><br>' % self.name
        info += '<br>'.join([effect.short_info for effect in self.effects])
        return info

    def activate(self, target):
        for effect in self.effects:
            effect.activate(target)
        eventer.onEnchantActivate(self)

    def deactivate(self):
        for effect in self.effects:
            effect.deactivate()
        eventer.onEnchantDeActivate(self)


from .itemtypes import *
from .effecttypes import *
from .creatures import *
