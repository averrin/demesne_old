# -*- coding: utf-8 -*-
from PyQt4.QtGui import *
from PyQt4.QtCore import *
import os
if os.name == 'nt':  # sys.platform == 'win32':
    from serial.tools.list_ports_windows import *
elif os.name == 'posix':
    from serial.tools.list_ports_posix import *
#~ elif os.name == 'java':
else:
    raise ImportError("Sorry: no implementation for your platform ('%s') available" % (os.name,))
from contrib.pyfirmata import Arduino
import subprocess


class FirmataTab(QWidget):
    def __init__(self, parent):
        QWidget.__init__(self, parent)
        self.parent = parent
        self.setLayout(QGridLayout())
        self.fs = QPushButton('Burn Firmata')
        self.fs.clicked.connect(self.firmataBurn)
        self.layout().addWidget(self.fs, 0, 0)

        # self.progress = QProgressBar()
        # self.progress.setMaximumWidth(200)
        # self.layout().addWidget(self.progress, 0, 1)

        self.ports = QComboBox()
        self.layout().addWidget(self.ports, 1, 0)
        self.refresh = QPushButton('Refresh')
        self.refresh.clicked.connect(self.refreshPorts)
        self.layout().addWidget(self.refresh, 1, 1)
        self.connect = QPushButton('Connect')
        self.connect.clicked.connect(self.firmataConnect)
        self.connect.setEnabled(False)
        self.layout().addWidget(self.connect, 1, 2)
        self.disconnect = QPushButton('Disconnect')
        self.disconnect.clicked.connect(self.firmataDisconnect)
        self.disconnect.setEnabled(False)
        self.layout().addWidget(self.disconnect, 1, 3)

        self.text = QTextBrowser()
        self.layout().addWidget(self.text, 2, 0, 4, 0)

        self.layout().setAlignment(Qt.AlignTop)

        self.refreshPorts()

    def refreshPorts(self):
        if not [p[0] for p in comports()]:
            self.text.setText(
                'No device detected. Plz insert board and click "Refresh".')
            self.connect.setEnabled(False)
            self.ports.clear()
            # self.parent.azura.voice.sayText(u'А где ардуинка?')
        else:
            self.ports.clear()
            self.ports.addItems([p[0] for p in comports()])
            self.text.setText('Some COM ports detected.')
            self.connect.setEnabled(True)

    def firmataConnect(self):
        self.device = Arduino(str(self.ports.currentText()))
        if self.device.get_firmata_version() is None:
            self.firmataDisconnect()
        else:
            self.text.setHtml('Connected<br>Firmata version: %s' %
                str(self.device.get_firmata_version()))
            self.connect.setEnabled(False)
            self.disconnect.setEnabled(True)

    def firmataDisconnect(self):
        self.device.exit()
        del self.device
        self.text.setText('No connection')
        self.connect.setEnabled(True)
        self.disconnect.setEnabled(False)

    def firmataBurn(self):
        os.chdir(os.path.join('sketches','StandardFirmata'))
        proc = subprocess.Popen(['make', 'upload'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        while True:
            line = proc.stderr.readline()
            if line != '':
                self.text.insertPlainText(line.rstrip().decode('cp1251') + '\n')
            else:
                break


class PinoutTab(QWidget):
    def __init__(self):
        QWidget.__init__(self)
        self.setLayout(QGridLayout())
        self.pinout = QLabel()
        self.pinout.setPixmap(QPixmap('contrib/arduino_pins.png'))
        self.layout().addWidget(self.pinout, 0, 0)
        self.at = QLabel()
        self.at.setPixmap(QPixmap('contrib/atmega.png'))
        self.layout().addWidget(self.at, 0, 1)


class SketchesTab(QWidget):
    def __init__(self):
        QWidget.__init__(self)
        self.setLayout(QHBoxLayout())
        self.list = QListWidget()
        self.layout().addWidget(self.list)
        self.layout().addWidget(QTextBrowser())
