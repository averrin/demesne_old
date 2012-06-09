#!/usr/bin/env python
import sys
import os
import argparse
import shutil


if os.name == 'nt':  # sys.platform == 'win32':
    from serial.tools.list_ports_windows import *
elif os.name == 'posix':
    from serial.tools.list_ports_posix import *
#~ elif os.name == 'java':
else:
    raise ImportError("Sorry: no implementation for your platform ('%s') available" % (os.name,))


import re


def parseBoards(tag):
    boards = file('%s\\arduino\\hardware\\arduino\\boards.txt' %
        sys.path[0], 'r').read()
    mcu = re.search('%s\.build\.mcu=(.+)' % tag, boards).group(1)
    f_cpu = re.search('%s\.build\.f_cpu=(.+)' % tag, boards).group(1)
    return mcu, f_cpu


def writeMake(target_path, port, board, libs=''):
    mcu, f_cpu = parseBoards(board)

    makefile = """
ARDUINO_DIR = %s\\arduino

BOARD_TAG    = %s
MCU          = %s
F_CPU        = %s
ARDUINO_PORT = %s
ARD_PORT     = %s
AVRDUDE_ARD_PROGRAMMER = arduino
AVRDUDE_ARD_BAUDRATE = 57600

ARDUINO_LIBS = %s

include Arduino.mk
""" % (sys.path[0], board, mcu, f_cpu, port, port, libs)

    f = file('%s\\Makefile' % target_path, 'w')
    f.write(makefile)
    shutil.copy('%s\\Arduino.mk' % sys.path[0], '%s\\Arduino.mk' % target_path)


def main():
    parser = argparse.ArgumentParser(
        description='Burn arduino sketch from cli')
    parser.add_argument('sketch')
    parser.add_argument('--libs', '-l', nargs='+', default='')
    try:
        parser.add_argument('--port', '-p', nargs=1,
            default=[p[0] for p in comports()][0])
    except IndexError:
        raise Exception('No COM ports detected.')
    parser.add_argument('--board', '-b', nargs=1, default='atmega328')
    args = parser.parse_args(sys.argv[1:])
    target_path, target_file = os.path.split(os.path.abspath(args.sketch))

    writeMake(target_path,
        args.port[0] if type(args.port) == list else args.port,
        args.board[0] if type(args.board) == list else args.board,
        ' '.join(args.libs))
    burn(target_path)


def burn(target_path):
    os.chdir(target_path)
    os.system('make upload')

if __name__ == '__main__':
    main()
