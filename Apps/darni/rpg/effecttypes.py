from .base import *


class Modifier(Effect):
    def __init__(self, name, prop, value, *args, **kwargs):
        self.prop = prop
        self.value = value
        self.info_postfix = ''
        Effect.__init__(self, name, self._activate, self._deactivate, *args, **kwargs)
        WinterObject.__refs__[Effect].append(weakref.ref(self))
        self.short_info = self.info

    @property
    def info(self):
        return '%s +%s %s' % (self.prop, self.value, self.info_postfix)

    def _activate(self):
        self.target[self.prop] += self.value

    def _deactivate(self):
        self.target[self.prop] -= self.value


class ModifierPercent(Effect):
    def __init__(self, name, prop, value, *args, **kwargs):
        self.prop = prop
        self.value = value
        self.info_postfix = ''
        Effect.__init__(self, name, self._activate, self._deactivate, *args, **kwargs)
        WinterObject.__refs__[Effect].append(weakref.ref(self))
        self.short_info = self.info

    @property
    def info(self):
        return '%s +%s%% %s' % (self.prop, self.value, self.info_postfix)

    def _activate(self):
        self.target[self.prop] *= 1 + self.value / 100

    def _deactivate(self):
        self.target[self.prop] /= 1 + self.value / 100


class DurableModifier(Effect, WinterRunnable):
    def __init__(self, name, prop, value, every=100, total=0, *args, **kwargs):
        self.prop = prop
        self.value = value
        self.info_postfix = ''
        self.every = every
        self.total = total
        Effect.__init__(self, name, self._activate, self._deactivate, *args, **kwargs)
        WinterObject.__refs__[Effect].append(weakref.ref(self))
        WinterRunnable.__init__(self, every, total)
        self.short_info = self.info

    @property
    def info(self):
        return '%s +%s %s every: %ssec, total: %ssec' % (
            self.prop, self.value, self.info_postfix,
            self.every / 1000, self.total / 1000)

    def _activate(self):
        WINTERPOOL.append(self)

    def _deactivate(self):
        try:
            WINTERPOOL.remove(self)
        except Exception:
            pass

    def lastShot(self):
        self.deactivate()

    def shot(self):
        try:
            self.target[self.prop] += self.value
            self.target.onChange()
        except:
            self.lastShot()
