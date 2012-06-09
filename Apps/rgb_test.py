#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

from PyQt4.QtGui import *
from PyQt4.QtCore import *

import serial

# Setup the Serial Object
ser = serial.Serial()
# Set the Serial Port to use
ser.setPort("COM7")
# Set the Baudrate (Arduino Sketch is expecting 57600 for smooth transitions in the GUI)
ser.baudrate = 57600
# Open the Serial Connection
ser.open()


def main():
    qtapp = QApplication(sys.argv)
    w = QMainWindow()
    cd = QColorDialog()
    w.show()

    cd.currentColorChanged.connect(sendColor)
    cd.colorSelected.connect(exit)

    cd.open()
    # print(cb)
    qtapp.exec_()


def sendColor(color):
    ser.write("r" + chr(int(color.red())))
    ser.write("g" + chr(int(color.green())))
    ser.write("b" + chr(int(color.blue())))

if __name__ == '__main__':
    main()
