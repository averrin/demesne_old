from PyQt4.QtCore import *
import time


class RGBLed(object):
    """Abstraction layer for RGB led control by firmata"""
    def __init__(self, device, red_pin, green_pin, blue_pin, anode=False):
        self.device = device

        self.red_pin = self.device.get_pin('d:%d:p' % red_pin)
        self.green_pin = self.device.get_pin('d:%d:p' % green_pin)
        self.blue_pin = self.device.get_pin('d:%d:p' % blue_pin)

        self.anode = anode

        self._red = 0
        self._green = 0
        self._blue = 0

        self.qcolor = QColor(self._red, self._green, self._blue)

    def setQColor(self, qcolor):
        self.qcolor = qcolor

        self.red = qcolor.red()
        self.green = qcolor.green()
        self.blue = qcolor.blue()

    def setColor(self, red, green, blue):
        self.qcolor = QColor(red, green, blue)

        self.red = red
        self.green = green
        self.blue = blue

    @property
    def green(self):
        return self._green

    @green.setter
    def green(self, value):
        self._green = value
        if not self.anode:
            self.green_pin.write((value / 255.) if value else 0)
        else:
            self.green_pin.write((1 - (value / 255.)) if value else 1)

    @property
    def red(self):
        return self._red

    @red.setter
    def red(self, value):
        self._red = value
        if not self.anode:
            self.red_pin.write((value / 255.) if value else 0)
        else:
            self.red_pin.write((1 - (value / 255.)) if value else 1)

    @property
    def blue(self):
        return self._blue

    @blue.setter
    def blue(self, value):
        self._blue = value
        if not self.anode:
            self.blue_pin.write((value / 255.) if value else 0)
        else:
            self.blue_pin.write((1 - (value / 255.)) if value else 1)

    def blink(self):
        self.startBlinking(times=1)

    def startBlinking(self, delay=0.1, times=0, step=1):
        self.blinker = self.Blinker(self, delay, times)

    def stopBlinking(self):
        if hasattr(self, 'blinker'):
            self.blinker.stop = True
            self.blinker.wait()

    class Blinker(QThread):
        def __init__(self, led, delay=0, times=0, step=1):
            QThread.__init__(self, None)
            self.delay = delay
            self.times = times
            self.step = step
            self.stop = False
            self.led = led
            self.start()

        def run(self):
            n = 0
            start_color = self.led.qcolor
            while not self.stop and (n < self.times or self.times == 0):
                steps = [start_color]
                c = self.led.qcolor.getHsl()
                color = QColor()
                for l in reversed(xrange(0, c[2], self.step)):
                    time.sleep(0.01)
                    color.setHsl(c[0], c[1], l)
                    self.led.setQColor(color)
                    steps.insert(0, QColor(color))
                    if color.getRgb() == (0, 0, 0, 255):
                        break
                time.sleep(self.delay)
                for color in steps:
                    time.sleep(0.01)
                    self.led.setQColor(color)
                n += 1
