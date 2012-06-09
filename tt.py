import sys
import os


sys.path.append('Garden')
sys.path.append('../Garden')
sys.path.append('../../Garden')

from PyQt4.QtGui import *
from PyQt4.QtCore import *


class UI(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        self.scene = QGraphicsScene()
        widget = QGraphicsView()
        widget.setScene(self.scene)
        self.setCentralWidget(widget)

        self.resize(800, 600)

    def test(self):
        self.scene.addLineItem(QG)


def main():
    qtapp = QApplication(sys.argv)
    ui = UI()
    ui.show()
    qtapp.exec_()


if __name__ == '__main__':
    main()
