#!/usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime, time

starttime = datetime.now()

import sys, os
sys.path.append('Garden')
sys.path.append('../Garden')
sys.path.append('../../Garden')
from winterstone.extraQt import WinterLine
from winterstone.snowflake import *
from winterstone.extraQt import WinterEditor, WinterDirTree

from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.extraQt import WinterSideBar
from winterstone.baseQt import WinterQtApp, API, WinterAction, SBAction, WinterAPI

__author__ = 'averrin'
from core import *


class UI(WinterQtApp):
    """
        Main class
    """

    def __init__(self, app):
        """
            Create your own mymainwidget inherits QWidget and set it through self.setMainWidget. For future access use self.mainWidget property
        """
        WinterQtApp.__init__(self, app)

    def _afterMWInit(self):
        """
            Fired after MainWindow initialisation
        """

        pass

    def _afterAppInit(self):
        """
            Fired after WinterApp initialisation
        """
        scene=QGraphicsScene()
        self.scene=scene
        self.scene.setBackgroundBrush(QBrush('#eee'))

        scene.mousePressEvent=self.click
        scene.dragMoveEvent=self.dragMoveEvent
        scene.dropEvent=self.dropEvent
#        scene.mouseMoveEvent=self.mouseMoveEvent
#        scene.mouseReleaseEvent=self.mouseReleaseEvent

        widget = QGraphicsView()
        widget.setScene(scene)
        widget.setBackgroundBrush(QBrush('#eee'))
        widget.setViewportUpdateMode(QGraphicsView.SmartViewportUpdate)

        self.setMainWidget(widget)

        self.map=Map(self)

        widget.drawBackground(QPainter(),widget.sceneRect())

        widget.setLayout(QGridLayout())
        widget.layout().setAlignment(Qt.AlignTop | Qt.AlignRight)
        widget.layout().setContentsMargins(11,20,80,11)

        self.dc=QCheckBox('&Draw path')
        self.dc.setChecked(True)
        widget.layout().addWidget(self.dc,0,0)
        self.edit=QCheckBox('&Edit')
        widget.layout().addWidget(self.edit,1,0)
        self.cb=QPushButton('Clear')
        widget.layout().addWidget(self.cb,2,0)
        self.cb.clicked.connect(self.reDraw)
        widget.layout().addWidget(QLabel('''L-click -- select wisp<br>
        R-click -- set waypoint'''),3,0)

        self.ed=QPushButton('Edges')
        widget.layout().addWidget(self.ed,5,0)
        self.ed.clicked.connect(self.drawEdges)

        self.sb=QPushButton('Save')
        widget.layout().addWidget(self.sb,0,1)
        self.sb.clicked.connect(self.map.save)

        self.lb=QPushButton('Load')
        widget.layout().addWidget(self.lb,1,1)
        self.lb.clicked.connect(self.loadBarriers)

        self.rb=QPushButton('Reset')
        widget.layout().addWidget(self.rb,2,1)
        self.rb.clicked.connect(self.resetBarriers)

        self.reDraw()

        self.createAction(QIcon(),'Exit',lambda:QMainWindow.close(self),keyseq='Esc')
        # self.createAction(QIcon(),'Edit',self.tEdit,keyseq='E')
        # self.createAction(QIcon(),'Path',self.tPath,keyseq='D')
        self.createAction(QIcon(),'Clear',self.resetBarriers,keyseq='C')
        self.createAction(QIcon(),'Save',self.map.save,keyseq='Ctrl+S')
        self.createAction(QIcon(),'Load',self.loadBarriers,keyseq='Ctrl+L')


    def resetBarriers(self):
        self.scene.clear()
        self.map=Map(self)
        self.reDraw()

    def loadBarriers(self):
        if self.map.load():
            self.scene.clear()
            self.reDraw()

    def dropEvent(self, event):
        self.map.recalcBarriers()


    def dragMoveEvent(self, ev):
        item=ev.mimeData().item
        if isinstance(item,Barrier) or isinstance(item,Wisp):
            item.setPos(ev.scenePos() - ev.mimeData().pos)


    def reDraw(self):
        for item in self.scene.items():
            if hasattr(item,'group') and isinstance(item.group(),Wisp):
                item=item.group()
            if not isinstance(item,Wisp):
                self.scene.removeItem(item)

        for poly in self.map.barriers:
            poly.setBrush(QBrush(QColor('yellow')))
            self.scene.addItem(poly)


    def click(self,ev):
        item=self.scene.itemAt(ev.scenePos())
        modifiers=QApplication.keyboardModifiers()

        if hasattr(item,'group') and isinstance(item.group(),Wisp):
            item=item.group()
        
        if hasattr(item,'draggable') and item.draggable:
            if ev.button() == Qt.LeftButton:
                if not modifiers == Qt.ControlModifier:
                    self.scene.clearSelection()
                editor=self.edit.isChecked()
                if editor:
                    drag = QDrag(ev.widget())
                    mime = QMimeData()
                    mime.pos = ev.pos()
                    mime.z = item.zValue()
                    mime.item = item
                    drag.setMimeData(mime)
                    drag.setHotSpot(ev.pos().toPoint())
                    drag.start()
                else:
                    item.onLClick(modifiers,ev.scenePos())
        else:
            if ev.button() == Qt.RightButton:
                if hasattr(item,'onRClick'):
                    item.onRClick(modifiers,ev.scenePos())
#
                for item in self.scene.selectedItems():
                    if hasattr(item,'onCommand'):
                        item.onCommand(modifiers,ev.scenePos())
#
            elif ev.button() == Qt.LeftButton:
                if not modifiers == Qt.ControlModifier:
                    self.scene.clearSelection()

                item=self.scene.itemAt(ev.scenePos())
                if hasattr(item,'onLClick'):
                    item.onLClick(modifiers,ev.scenePos())
            elif ev.button() == Qt.MidButton:
                self.scene.clearSelection()



    def drawEdges(self):
        for edges in self.map.edges:
            for edge in edges:
                l=self.scene.addLine(edge,QPen(QColor('red')))
                l.setZValue(90)




    def drawPath(self,path):
        for i,waypoint in enumerate(path):
            if i!=len(path)-1 and isinstance(path[i+1],QPointF):
                self.scene.addLine(QLineF(waypoint,path[i+1]),QPen(QColor('#ccc')))
            self.scene.addEllipse(QRectF(QPointF(waypoint.x()-2,waypoint.y()-2),QPointF(waypoint.x()+2,waypoint.y()+2)),QPen(QColor('#ffcccc')),QBrush(QColor('#ffcccc')))
#            self.markPoint(waypoint,'blue')

    def calcAngles(self):
        self.map.recalcBarriers()
        for edges in self.map.edges:
            for i,edge in enumerate(edges):
                try:
                    print edge.angle(edges[i+1])
                except IndexError:
                    pass

    def markPoint(self,point,color):
        item=QGraphicsPixmapItem(QPixmap(self.api.icons['emblems/%s'%color]))
        self.scene.addItem(item)
        item.setPos(point.x()-10,point.y()-10)
        return item


def resolve(map1, map2, key):
    return 'overwrite'


def main():
    qtapp = QApplication(sys.argv)
    qtTranslator = QTranslator()
    if qtTranslator.load(CWD + "lang/%s.qm" % QLocale.system().name()):
        qtapp.installTranslator(qtTranslator)
        print QLocale.system().name(), qtapp.tr('Translate loaded')
    ui = UI(qtapp)

    if ui.config.options.ui.maximized:
        ui.showMaximized()
    else:
        ui.show()
    api = ui.api

    endtime = datetime.now()
    delta = endtime - starttime
    ui.api.info('Initialization time: %s' % delta)

    print 'Started'
    qtapp.exec_()


if __name__ == '__main__':
    main()


