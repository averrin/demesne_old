#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os, sys

sys.path.append('Garden')

from augment import *
from clint.textui import puts, indent, colored
from winterstone.base import Borg, WinterObject
import inspect


class Dispatcher(Borg):
    def __init__(self):
        Borg.__init__(self)
        if not hasattr(self, 'links'):
            self.links = []
        if not hasattr(self, 'listeners'):
            self.listeners = []

    @enter(lambda x, y=None: x.refresh())
    def whoListen(self, signal=''):
        if not signal:
            linkers = []
            for link in self.links:
                for o in WinterObject.objects.all():
                    if hasattr(o, link['method'].__name__) and\
                    o.__getattribute__(link['method'].__name__) == link['method']:
                        linkers.append(o)
            return self.listeners + list(set(linkers))
        else:
            linkers = []
            for link in self.links:
                if link['signal'] == signal:
                    for o in WinterObject.objects.all():
                        if hasattr(o, link['method'].__name__) and\
                        o.__getattribute__(link['method'].__name__) == link['method']:
                            linkers.append(o)

            for o in self.listeners:
                if hasattr(o, 'on_%s' % signal):
                    linkers.append(o)

            return list(set(linkers))

    def connect(self, signal, method, **kwargs):
        link = {}
        link['signal'] = signal
        link['method'] = method

        if 'obj' in kwargs:
            link['obj'] = kwargs['obj']
        if 'sender' in kwargs:
            link['sender'] = kwargs['sender']
        self.links.append(link)

    def disconnect(self, signal, method, **kwargs):
        links = self.links[:]
        for link in links:
            if link['signal'] == signal and link['method'] == method:
                self.links.remove(link)

    @enter(lambda x, y, z=None: x.refresh())
    def emit(self, signal, obj=None, *args, **kwargs):
        print('Emitted signal: [%s]' % colored.blue(signal))
        for link in self.links:
            if link['signal'] == signal:
                if ('obj' in link and link['obj'] == obj) or 'obj' not in link:
                    if not 'sender' in link:
                        link['method'](*args, **kwargs)
                    elif link['sender']:
                        link['method'](obj, *args, **kwargs)

        for listener in self.listeners:
            if hasattr(listener, 'on_%s' % signal):
                method = listener.__getattribute__('on_%s' % signal)
                method(*args, **kwargs)

    def dispatchMe(self, obj):
        self.listeners.append(obj)

    def stopDispatchMe(self, obj):
        self.listeners.remove(obj)

    def refresh(self):
        links = self.links[:]
        for link in links:
            if inspect.isfunction(link['method']):
                crit = {'%s__has' % link['method'].__name__: True}
                for o in WinterObject.objects.filter(**crit):
                    l = link.copy()
                    l['method'] = o.__getattribute__(link['method'].__name__)
                    self.links.append(l)
                self.links.remove(link)

    def connect_on(self, signal, **kwargs):
        def deco(fn):
            self.connect(signal, fn, **kwargs)
            return fn
        return deco

events = Dispatcher()


class Hero(WinterObject):
    @leave(lambda x: events.emit('after_test', x))
    def test(self):
        pass
        # events.emit('cry',self)

    def on_attack(self):
        puts('Object dispatching connect')


hero = Hero()


class Enemy(WinterObject):
    def hello(self, sender):
        puts('Sender: %s!' % sender)

    def hello2(self):
        puts('Connect without sender')

    @enter(lambda x: events.emit('attack', x))
    def test(self):
        pass

    @events.connect_on('cry', obj=hero)
    def hello3(self):
        puts('Deco connect with sender test')

    @events.connect_on('smile')
    def hello4(self):
        puts('Deco connect without sender test')


hero_friend = Hero()
enemy = Enemy()
# boss=Enemy()
#events.connect('after_test',enemy.hello,obj=hero,sender=True)
#events.connect('after_test',enemy.hello2,obj=hero)
Dispatcher().dispatchMe(hero)
events.connect('after_test', hero.on_attack)

with indent(4, quote=colored.green(' >')):
#    hero.test()
#    hero_friend.test()
    enemy.test()
    Dispatcher().stopDispatchMe(hero)
    enemy.test()
# print hasattr(enemy,'hello4')
# print WinterObject.objects.all()
# print WinterObject.objects.filter(hello4__has=True)

# print events.links
#    events.emit('smile')
#    events.emit('cry',hero)
#    events.emit('cry',enemy)

print(events.whoListen())
# print events.links
# for l in  events.links:
# print l
