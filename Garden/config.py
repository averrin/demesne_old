#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from __future__ import print_function, unicode_literals
import json
import re


class Mapping(dict):
    def __unicode__(self):
        return dict.__unicode__(self)

    def __getattribute__(self, key):
        try:
            attr = dict.__getitem__(self, key)
        except KeyError:
            attr = dict.__getattribute__(self, key)
        return Mapping._convert(attr)

    def __getitem__(self, key):
        attr = dict.__getitem__(self, key)
        r = Mapping._convert(attr)
        if r != attr:
            dict.__setitem__(self, key, r)
        return r

    @classmethod
    def _convert(cls, attr):
        tf = {'TRUE': True, 'FALSE': False}
        if isinstance(attr, str) and attr.upper() in tf:
            return tf[str(attr).upper()]
        elif isinstance(attr, dict):
                m = Mapping()
                m.update(attr)
                attr = m
        elif attr in [b'True', b'False']:
            attr = eval(attr)

        # if type(attr) == unicode:
        #     attr = str(attr)
        return attr

    def __setattr__(self, key, value):
        # print(key, value)
        dict.__setitem__(self, key, value)
        # print('---', dict.__getitem__(self, key))


class Config(object):
    def __init__(self, cfg_file):
        cfg = cfg_file.read()
        cfg = re.sub('(\w+)[ ]*\:', "'\\1':", cfg)
        cfg = re.sub('\'', '\"', cfg)
        cfg = re.sub('^#.+\n', '\n', cfg, flags=re.M)
        # cfg = re.sub('\n', '', cfg)
        cfg = re.sub('([\"\]\}]+)([\t \n]+)([\"\[\{]+)', '\\1,\n\\2\\3', cfg)
        cfg = re.sub('(True|False|\d+)([\t \n]+)\"', '\\1,\\2"', cfg)
        cfg = re.sub('True', '"TRUE"', cfg)
        cfg = re.sub('False', '"FALSE"', cfg)
        cfg = re.sub('\]([\t ]*)\[', '],\\1[', cfg)
        # print(cfg)
        cfg = json.loads('{%s}' % cfg)
        self._dict = cfg

    def __getattr__(self, key):
        attr = self._dict[key]
        if isinstance(attr, dict):
                m = Mapping()
                m.update(attr)
                attr = m
                self._dict[key] = attr
        return attr

    def __getitem__(self, key):
        attr = self._dict[key]
        if isinstance(attr, dict):
                m = Mapping()
                m.update(attr)
                attr = m
        return attr

    def save(self, cfg_file):
        # for attr in self._dict:
        #     r = self._dict[attr]
        #     if isinstance(r, Mapping) and hasattr(r, 'parent'):
        #         try:
        #             del r['parent']
        #         except:
        #             pass
        # print(self._dict)
        dump = json.dumps(self._dict, sort_keys=True, indent=4)
        cfg_file.write(dump[1:][:-1])


def main():
    cfg = Config(open('../Apps/darni/config/main.cfg'))
    cfg.save(open('../Apps/darni/config/main.cfg', 'w'))

if __name__ == '__main__':
    main()
