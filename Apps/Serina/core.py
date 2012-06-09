from PyQt4.QtGui import *
from PyQt4.QtCore import *
from winterstone.baseQt import SBAction, load, save
from winterstone.winterBug import try_this
from winterstone.snowflake import CWD, loadIcons
from winterstone.base import WinterObject

from augment import *
from winterstone.baseQt import API
import time, os
Slot=pyqtSlot

class SObject(WinterObject, QGraphicsItem):
    def onLClick(self,modifiers,pos):
        self.setSelected(True)

    def onRClick(self,modifiers,pos):
        pass

    def onCommand(self,modifiers,pos):
        pass

class Map(object):
    def __init__(self,parent):
        self.parent=parent
#        if not os.path.isfile(savefile):
        self.points=[[QPointF(0,0),QPointF(0,-100),QPointF(100,-100),QPointF(100,0),QPointF(200,0),QPointF(200,-150),QPointF(-50,-150)],
            [QPointF(0,200),QPointF(0,100),QPointF(100,100),QPointF(100,150)]]

        sq=[(0,200),(0,150),(100,150),(100,200)]

        for i in xrange(4):
            q=sq[:]
            r=[]
            for p in q:
                p=QPointF(p[0],p[1])
                p.setX(p.x()+i)
                p.setY(p.y()+i)
                r.append(p)
            self.points.append(r)
        a=Wisp(self.parent,'red',QPointF(50,-80))
        b=Wisp(self.parent,'blue',QPointF(-200,-200))
        self.wisps=[a,
                    b,
                    Wisp(self.parent,'violet',QPointF(120,220)),
                    Wisp(self.parent,'black',QPointF(20,20))]


        self.createBarriers()
        self.recalcBarriers()


    def createBarriers(self):
        self.barriers=[]
        for poly in self.points:
            blur=QGraphicsBlurEffect()
            blur.setBlurRadius(3)
            b=Barrier(self,QPolygonF(poly))
            # b.setGraphicsEffect(blur)
            self.barriers.append(b)

    def load(self):
        map=load()
        print map
        if map:
            self.points=map['barriers']
            self.wisps=[]
            for wisp in map['wisps']:
                self.wisps.append(Wisp(self.parent,wisp[0],wisp[1]))
            self.createBarriers()
        else:
            return False


    def save(self):
        map={}
        bars=[]
        wisps=[]
        for i,bar in enumerate(self.barriers):
            bars.append([])
            for n in xrange(bar.polygon().count()):
                bars[i].append(bar.polygon().value(n))
        map['barriers']=bars
        for wisp in self.wisps:
            wisps.append([wisp.color,wisp.pos()])
        map['wisps']=wisps
        if save(map):
            return True
        else:
            return False


    def recalcBarriers(self):
        self.edges=[]
        self.ubarriers=[]
        for p in self.barriers:
            self.ubarriers.append(Barrier(self,p.polygon()))
        u=self.uniteBarriers()
        while u:
            u=self.uniteBarriers()

        for i,poly in enumerate(self.ubarriers):
            self.edges.append([])
            poly=poly.polygon()
            for n in xrange(poly.count()):
                if n!=poly.count()-1:
                    self.edges[i].append(QLineF(poly.value(n),poly.value(n+1)))
                else:
                    self.edges[i].append(QLineF(poly.last(),poly.first()))

    def uniteBarriers(self):
        for item in self.ubarriers:
            poly=item.polygon()
            for p in self.ubarriers:
                if p.polygon()!=poly and not poly.intersected(p.polygon()).isEmpty():
                    item.setPolygon(poly.united(p.polygon()))
                    self.ubarriers.remove(p)
                    return True
        return False


class Barrier(QGraphicsPolygonItem,SObject):
    def __init__(self,map,poly):
        if not poly.isClosed():
            poly.append(poly.first())
        QGraphicsPolygonItem.__init__(self,poly)
        SObject.__init__(self)
        self.map=map
        self.draggable=True

    def setPos(self,pos):
        poly=self.polygon()
        delta=QLineF(poly.first(),pos)
        r=self.boundingRect()
        p=[]
        for n in xrange(poly.count()):
            point=poly.value(n)
            np=QPointF(point.x()+delta.dx()-r.width()/2,point.y()+delta.dy()+r.height()/2)
            p.append(np)
        self.setPolygon(QPolygonF(p))
        self.map.recalcBarriers()


class Path(list, WinterObject):
    def __init__(self,map):
        list.__init__(self)
        WinterObject.__init__(self)
        self.map=map

    def calc(self,start,end):
        self.last_corner=False
        self.append(start)
        p3=self.findWaypoint(end,start)
        self.append(p3)
        p4=''
        n=0
        while p3 and end != p3 and n<20 and p3!=p4:
            p4=p3
            if p3!=self[-1]:
                self.append(p3)

            p3=self.findWaypoint(end,p3)
            n+=1

        if p3 and n<20:
            self.append(p3)
            self.findWaypoint(end,p3)
        self.last_corner=False


        s=self.smooth()
        while not s:
            s=self.smooth()

        if self[-1]!=end:
            API().error('Pathfinding failed!')


    def findWaypoint(self,p1,p2):
        path=QLineF(p2,p1)
        n, edge, ips=self.inter(self.map.edges,path)

        if n:
            corners=[QPointF(edge.x1(),edge.y1()),QPointF(edge.x2(),edge.y2())]
            if self.last_corner in corners:
                corners.remove(self.last_corner)
            
            p3=corners[0]
            if len(corners)!=1:
                ip=ips[0]
                if QLineF(ip,corners[1]).length()<QLineF(ip,corners[0]).length():
                    p3=corners[1]
                self.last_corner=p3

            path=QLineF(p3,p2)
            normal=path.normalVector()
            normal.setLength(20)
            tt,t2,t3=self.inter(self.map.edges, QLineF(QPointF(normal.x2(),normal.y2()),p2))
            a0=normal.angle()
            if tt:
                normal=QLineF(p3,QPointF(normal.x1()-normal.dx(),normal.y1()-normal.dy()))
#            while self.map.rect in self.map.scene.items(QPointF(normal.x2(),normal.y2())) or tt: #!!!!!!!!!!!!!!!!!!
            while tt:
                a=normal.angle()+10
                normal.setAngle(a)
                tt,t2,t3=self.inter(self.map.edges, QLineF(QPointF(normal.x2(),normal.y2()),p2))
                if not int(a-a0):
                    print 'bad corner'
                    p1=False
                    break
            if p1:
                p3=QPointF(normal.x2(),normal.y2())
                p1=p3
        return p1

    def inter(self,edges,path):
        ips=[]
        ie=[]
        for poly in edges:
            for edge in poly:
                p=QPointF()
                i=path.intersect(edge,p)
                if i==QLineF.BoundedIntersection:
#                    item=QGraphicsPixmapItem(QPixmap(self.map.api.icons['emblems/orange']))
#                    self.map.scene.addItem(item)
#                    item.setPos(p.x()-10,p.y()-10)
                    ips.append(p)
                    ie.append(edge)
        if ips:
            r=0
            ml=QLineF(path.p1(),ips[r]).length()
            for i,p in enumerate(ips):
                if QLineF(path.p1(),p).length()<ml:
                    ml=QLineF(path.p1(),p).length()
                    r=i
            edge=ie[r]
            return True,edge,ips
        else:
            return False,False,False

    def smooth(self):
        path=self[:]
        stop=False
        for i,waypoint in enumerate(path):
            if stop:
                break
            if i!=len(path)-1:
                for n in xrange(i+1,len(path)-1):
                    a,b,c=self.inter(self.map.edges,QLineF(waypoint,path[n]))
                    if not a:
                        for t in xrange(i+1,n):
                            if path[t]in self:
                                self.remove(path[t])
                            stop=True

        if stop:
            return False
        else:
            return True

class Waypoint(QPointF):
    def __init__(self,*args):
        if isinstance(args[0],QPointF):
            QPointF.__init__(args[0].x(),args[0].y())
        else:
            QPointF.__init__(*args)

class Wisp(QGraphicsItemGroup,QObject,SObject):
    def __init__(self,parent,color,coord='',invis=False):
        QObject.__init__(self)
        SObject.__init__(self)
        QGraphicsItemGroup.__init__(self)
        self.setFlag(QGraphicsItem.ItemIsSelectable)
        self.parent=parent
        self.color=color

        self.scene=parent.scene
        self.body=QGraphicsPixmapItem(QPixmap(self.parent.api.icons['emblems/%s'%color]))
        self.body.setOffset(-10,-10)
        blur=QGraphicsBlurEffect()
        blur.setBlurRadius(3)
        self.body.setGraphicsEffect(blur)
        self.name=QGraphicsTextItem(color)
        # self.name.setOffset(-20,-20)

        self.addToGroup(self.body)
        self.addToGroup(self.name)

        if coord:
            self.move(coord)
            if not invis:
                self.parent.scene.addItem(self)

        for item in self.childItems():
            item.onLClick=self.onLClick

        self.selection=False
        self.draggable=True

    def onCommand(self,modifiers,pos):
        path=Path(self.parent.map)
        path.calc(self.pos(),pos)
        if self.parent.dc.isChecked():
            self.parent.drawPath(path)
        self.walk(path)


    @Slot(QPointF)
    def move(self,pos):
        self.setPos(pos)

    def drawPoint(self):
        if self.icon not in self.parent.scene.items():
            self.parent.scene.addItem(self.icon)
        self.icon.setPos(self.x()-10,self.y()-10)

    def walk(self,path):
        self.setZValue(1000)
        if hasattr(self,'m'):
            self.m.stop=True
            self.m.wait()
        self.m=self.Mover(self,path)
        self.connect(self.m, SIGNAL('moved(QPointF)'), self.move)
        self.m.start()



    def paint(self,painter,option,widget):
        # print self.color, int(option.state), option.state == QStyle.State_MouseOver
        if self.selection in self.scene.items():
            self.scene.removeItem(self.selection)
        if int(option.state)-1==int(QStyle.State_Selected):
            option.state=QStyle.State_None

            r=self.boundingRect()
            r.translate(self.pos())
            self.selection=QGraphicsItemGroup()
            sl=[QLineF(r.topLeft(),r.topRight()),QLineF(r.topLeft(),r.bottomLeft()),
            QLineF(r.bottomRight(),r.bottomLeft()),QLineF(r.bottomRight(),r.topRight())]
            for l in sl:
                l.setLength(20)
                l=QGraphicsLineItem(l)
                l.setPen(QPen(QColor(self.color)))            
                self.selection.addToGroup(l)


            # self.selection=QGraphicsRectItem(r)
            # self.selection.setPen(QPen(QColor(self.color)))
            self.addToGroup(self.selection)
            
        QGraphicsItemGroup.paint(self,painter,option,widget)



    class Mover(QThread):
        def __init__(self,obj,endpoint):
            self.object=obj
            self.endpoint=endpoint
            QThread.__init__(self)
            self.stop=False

        def run(self):
            if isinstance(self.endpoint,list):
                eps=self.endpoint
            else:
                eps=[self.endpoint]

            for end in eps:
                start=self.object.pos()
                l=QLineF(start,end).length()
                for c in xrange(0,int(l),3):
                    if self.stop:
                        break
                    time.sleep(0.025)
                    t=c/l
                    x = start.x() + (end.x() - start.x()) * t
                    y = start.y() + (end.y() - start.y()) * t
                    p=QPointF(x,y)

                    self.emit(SIGNAL('moved(QPointF)'),p)



class Core(QObject):
    """
        Store all your app logic here
    """

    def _afterInit(self):
        """
            when application totally init
        """
        self.api = API()
        self.main()
        # self.api.info('Core loaded.')


    def main(self):
        """
            dummy for main core method.
        """
        pass

