# -*- coding: utf-8 -*-
import json
from PyQt4.QtGui import *
from PyQt4.QtCore import *

try:
    import dbus
except:
    pass
from winterstone.base import WinterApp, WinterAPI, WinterObject
from winterstone.winterBug import *
from winterstone.extraQt import *
from winterstone.extraQt import WinterSideBar
#from snowflake import *
import functools
import logging

logging.basicConfig(format='[%(asctime)s] %(levelname)s:\t\t%(message)s', filename='winter.log', level=logging.DEBUG,
    datefmt='%d.%m %H:%M:%S')
logging.info('======')

try:
    from PyKDE4.kdeui import *

    KDE_SUPPORT = True
except ImportError:
    KDE_SUPPORT = False
    print('WARNING: KDE_SUPPORT disabled')

class API(WinterAPI):
    def echo(self, *args, **kwargs):
        self.ex('echo')(*args, **kwargs)

    def info(self, *args, **kwargs):
        if hasattr(self, 'debugger'):
            self.debugger.info(*args, **kwargs)
        else:
            self.echo(*args, **kwargs)
        logging.info(*args)

    def debug(self, *args, **kwargs):
        if hasattr(self, 'debugger'):
            self.debugger.debug(*args, **kwargs)
        else:
            self.echo(*args, **kwargs)
        logging.debug(*args)

    def error(self, *args, **kwargs):
        if hasattr(self, 'debugger'):
            self.debugger.error(*args, **kwargs)
        else:
            self.echo(*args, **kwargs)
        logging.error(*args)

    def showMessage(self, *args, **kwargs):
        if hasattr(self, 'statusBar'):
            self.statusBar.showMessage(*args, **kwargs)
        else:
            self.echo(*args, **kwargs)

#    def setTitle(self, *args, **kwargs):
#        self.ex('title', *args, **kwargs)

class WinterAction(QAction, WinterObject):
    def __init__(self, *args, **kwargs):
        QAction.__init__(self, *args)
        WinterObject.__init__(self)
        self.title = self.text()
        self.api = API()
        if 'icon' in kwargs:
            icon = kwargs['icon']
            self.setIcon(QIcon.fromTheme(icon, QIcon(self.api.icons[icon])))


class SBAction(WinterAction):
    def __init__(self, sideBarDock, *args):
        self.sideBarDock = sideBarDock
        WinterAction.__init__(self, *args)

    def showWidget(self):
        if self.sideBarDock.isHidden():
            self.sideBarDock.show()
        elif self.sideBarDock.stack.currentWidget() == self.widget:
            self.sideBarDock.hide()
        self.sideBarDock.stack.setCurrentWidget(self.widget)
        self.widget.setFocus()
        if hasattr(self.widget, 'onShow'):
            self.widget.onShow()

    def forceShowWidget(self):
        self.sideBarDock.show()
        self.sideBarDock.stack.setCurrentWidget(self.widget)
        self.widget.setFocus()
        if hasattr(self.widget, 'onShow'):
            self.widget.onShow()


class WinterFlag(QLabel):
    def setIcon(self, icon, tooltip=''):
        icon = QPixmap(icon).scaled(20, 20)
        self.setPixmap(icon)
        self.setToolTip(tooltip)

    def mouseReleaseEvent(self, ev):
        self.emit(SIGNAL('clicked()'))


class SettingsManager(QMainWindow):
    class myDelegate(QItemDelegate):
        def __init__(self, parent):
            QItemDelegate.__init__(self, parent)
            self.parent = parent
            #oops, im sorry
            self.methods = {'QLineEdit': {'set': 'setText(value)', 'get': 'text()'},
                            'QSpinBox': {'set': 'setValue(int(value))', 'get': 'text()'},
                            'QComboBox': {'set': 'setCurrentIndex(list(item.variants).index(value))',
                                          'get': 'currentText()'},
                            'KColorCombo': {'set': 'setColor(QColor(value))', 'get': 'color().name()'},
                            'QFontComboBox': {'set': 'setFont(QFont(value))', 'get': 'currentText()'},
                            'KFontComboBox': {'set': 'setFont(QFont(value))', 'get': 'currentText()'},
                            'KKeySequenceWidget': {'set': 'setKeySequence(QKeySequence(value))', 'get': 'keySequence()'}
                ,
                            }

        def paint(self, painter, option, index):
            value = index.model().data(index, Qt.EditRole).toString()
            item = self.parent.items[index.row()]
            if not item.name.endswith('_color'):
                QItemDelegate.paint(self, painter, option, index)
            else:
                painter.save()
                painter.setPen(QPen(Qt.NoPen))
                painter.setBrush(QBrush(QColor(value)))
                painter.drawRect(option.rect)
                painter.setPen(QPen(Qt.black))
                if QColor(value).black() > 127:
                    painter.setPen(QPen(Qt.white))
                value = index.data(Qt.DisplayRole)
                if value.isValid():
                    text = value.toString()
                    rect = option.rect
                    rect.setLeft(3)
                    font = self.parent.font()
                    font.setFixedPitch(True)
                    font.setPointSize(self.parent.font().pointSize())
                    fm = QFontMetrics(font)
                    rect.setTop(rect.y() + (rect.height() - fm.height()) / 2)
                    painter.drawText(rect, Qt.AlignLeft, text)

                painter.restore()


        def createEditor(self, parent, option, index):
            value = index.model().data(index, Qt.EditRole).toString()
            item = self.parent.items[index.row()]

            try:
                value = int(value)
            except:
                pass
            if type(value).__name__ == 'int':
                editor = QSpinBox(parent)
                editor.setMaximum(9999)
            elif item.name.endswith('_color') and KDE_SUPPORT:
                editor = KColorCombo(parent)
            elif item.name.endswith('font') and KDE_SUPPORT:
                editor = KFontComboBox(parent)
            elif item.name.endswith('font') and KDE_SUPPORT:
                editor = QFontComboBox(parent)
            elif item.name.endswith('_shortcut') and KDE_SUPPORT:
                editor = KKeySequenceWidget(parent)
            elif type(value).__name__ != 'Mapping':
                if hasattr(item, 'variants'):
                    editor = QComboBox(parent)
                    editor.addItems(item.variants)
                else:
                    editor = QLineEdit(parent)
            return editor

        def setEditorData(self, editor, index):
            value = index.model().data(index, Qt.EditRole).toString()
            item = self.parent.items[index.row()]
            wtype = type(editor).__name__
            exec('editor.%s' % self.methods[wtype]['set'])

        #            try:
        #                editor.setText(value)
        #            except AttributeError:
        #                try:
        #                    editor.setValue(int(value))
        #                except AttributeError:
        #                    if item.name.endswith('_color') and KDE_SUPPORT:
        #                        editor.setColor(QColor(value))
        #                    else:
        #                        editor.setCurrentIndex(list(item.variants).index(value))

        def setModelData(self, editor, model, index):
            wtype = type(editor).__name__
            exec('value = editor.%s' % self.methods[wtype]['get'])
            #            try:
            #                value = editor.text()
            #            except AttributeError:
            #                try:
            #                    value = editor.color().name()
            #                except AttributeError:
            #                    value = editor.currentText()
            model.setData(index, value, Qt.EditRole)

        def updateEditorGeometry(self, editor, option, index):
            editor.setGeometry(option.rect)


    class settingsTable(QTableWidget):
        def fill(self, conf, conf_file, parent):
            self.parent = parent
            self.parent.configs.append(self)
            self.conf = conf
            self.conf_dict = conf
            self.conf_file = conf_file
            sizePolicy = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
            sizePolicy.setHorizontalStretch(0)
            sizePolicy.setVerticalStretch(0)
            sizePolicy.setHeightForWidth(self.sizePolicy().hasHeightForWidth())
            self.setSizePolicy(sizePolicy)
            self.setMaximumSize(QSize(16777215, 16777215))
            self.setAutoFillBackground(True)
            self.setColumnCount(2)
            self.setRowCount(0)
            item = QTableWidgetItem()
            self.setHorizontalHeaderItem(0, item)
            item = QTableWidgetItem()
            self.setHorizontalHeaderItem(1, item)
            self.horizontalHeader().setDefaultSectionSize(200)
            self.horizontalHeader().setStretchLastSection(True)
            self.verticalHeader().setStretchLastSection(False)

            self.itemChanged.connect(self.changeOption)

            self.delegate = self.parent.myDelegate(self)
            self.setItemDelegateForColumn(0, self.delegate)
            row = 0
            self.items = []
            array = self.conf_dict
            self.setIconSize(QSize(30,30))
            for var in array:
                if not var.endswith('_desc') and not var.endswith('_hidden') and var != 'activated' and not var.endswith('_variants') and type(
                    array[var]).__name__ != 'Mapping' and not ('%s_hidden'%var in array and array['%s_hidden'%var]):
                    self.insertRow(row)
                    self.setVerticalHeaderItem(row, QTableWidgetItem(var))
                    vitem = QTableWidgetItem(str(array[var]))
                    vitem.name = var
                    self.items.append(vitem)
                    if array[var] in [True, False]:
                        vitem.setFlags(Qt.ItemFlags(Qt.ItemIsSelectable | Qt.ItemIsUserCheckable | Qt.ItemIsEnabled))
                        check = Qt.Checked if array[var] else Qt.Unchecked
                        vitem.setCheckState(check)
                    self.setItem(row, 0, vitem)
                    if '%s_desc' % var in array:
                        desc = array['%s_desc' % var].decode('utf8')
                    else:
                        desc = ''
                    if '%s_variants' % var in array:
                        vitem.variants = array['%s_variants' % var]
                    if var.endswith('_icon'):
                        vitem.setIcon(QIcon(API().icons[array[var]]))
                    ditem = QTableWidgetItem(desc)
                    ditem.name = 'ditem'
                    ditem.setFlags(Qt.ItemFlags(Qt.ItemIsSelectable | Qt.ItemIsUserCheckable | Qt.ItemIsEnabled))
                    self.setItem(row, 1, ditem)
                    row += 1

        def changeOption(self, item):
            if item.checkState() == 2 or (not item.checkState() and item.text() in ['False', 'True']):
                text = 'True' if item.checkState() else 'False'
                item.setText(text)
            value = item.text().__str__().encode('cp1251')
            if item.name in self.conf_dict:
                if value in ['True', 'False']:
                    self.conf_dict[item.name] = eval(value)
                else:
                    try:
                        value = int(value)
                    except ValueError:
                        if value.startswith('[') and value.endswith(']') and type(eval(value)).__name__ == 'list':
                            value = eval(value)
                        if item.name.endswith('_icon'):
                            self.blockSignals(True)
                            item.setIcon(QIcon(API().icons[value]))
                            self.blockSignals(False)
                    self.conf_dict[item.name] = value
                self.parent.statusBar.showMessage('%s change to %s' % (item.name, item.text()))

        def save(self):
            f = file(self.conf_file, 'w')
            while True:
                try:
                    self.conf = self.conf.parent
                except AttributeError:
                    break
            self.conf.save(f)


    def addPage(self, widget, label, parent='', icon=''):
        self.stack.addWidget(widget)
        if not parent:
            item = QTreeWidgetItem([label])
            self.tree.addTopLevelItem(item)
        else:
            item = QTreeWidgetItem(parent, [label])
            parent.addChild(item)

        if icon:
            if type(icon).__name__ != 'QIcon':
                item.setIcon(0, QIcon.fromTheme(icon, QIcon(self.app.api.icons[icon])))
            else:
                item.setIcon(0, icon)
        item.page = widget
        widget.item = item
        item.setExpanded(True)
        return widget

    def ic(self, item, column):
        self.stack.setCurrentWidget(item.page)

    def __init__(self, app, *args, **kwargs):
        QMainWindow.__init__(self)
        self.resize(900, 600)
        self.setWindowTitle('Settings Manager')

        self.centralwidget = QWidget(self)
        self.tabWidget = QTabWidget()

        self.stack = QStackedWidget()

        hb = QHBoxLayout(self.centralwidget)
        self.tree = QTreeWidget(self.centralwidget)
        self.tree.setHeaderLabel('Settings')
        hb.addWidget(self.tree)
        self.verticalLayout = QVBoxLayout(self.centralwidget)
        hb.addLayout(self.verticalLayout)
        self.verticalLayout.addWidget(self.stack)
        hb.setStretch(1, 5)
        self.centralwidget.setLayout(hb)

        self.horizontalLayout = QHBoxLayout()
        spacerItem = QSpacerItem(40, 20, QSizePolicy.Expanding, QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.cancelButton = QPushButton('Cancel', self.centralwidget)
        self.horizontalLayout.addWidget(self.cancelButton)
        self.restartButton = QPushButton('Apply and Restart', self.centralwidget)
        self.horizontalLayout.addWidget(self.restartButton)
        self.applyButton = QPushButton('Apply', self.centralwidget)
        self.horizontalLayout.addWidget(self.applyButton)

        self.verticalLayout.addLayout(self.horizontalLayout)
        self.setCentralWidget(self.centralwidget)
        self.statusBar = QStatusBar(self)
        self.setStatusBar(self.statusBar)

        self.app = app
        self.app.sm = self
        self.configs = []

        self.setWindowIcon(QIcon.fromTheme('configure', QIcon(self.app.api.icons['configure'])))

        self.tableWidget = self.settingsTable()
        self.tableWidget.fill(self.app.config.options, CWD + 'config/main.cfg', self)
        self.sttab = self.addPage(self.tableWidget, 'General', icon='configure')
        for var in self.app.config.options:
            val = self.app.config.options[var]
            if type(val).__name__ == 'Mapping':
                if not self.app.schema[var].hide:
                    st = self.settingsTable(self.tableWidget)
                    st.fill(val, CWD + 'config/main.cfg', self)
                    self.ui = self.addPage(st, self.app.schema[var].title, icon=QIcon(self.app.schema[var].icon),
                        parent=self.sttab.item)
        self.stack.setCurrentWidget(self.sttab)

        if self.app.config.options.debug:
            self.dbgTable = self.settingsTable(self.stack)
            self.dbgTable.fill(self.app.debugger.config.options, CWD + 'config/debug.cfg', self)
            self.dbgtab = self.addPage(self.dbgTable, 'Debug', icon='warning')

        if self.app.config.options.plugins:
            self.tabPlugins = QWidget()
            self.verticalLayout = QVBoxLayout(self.tabPlugins)
            self.listWidget = QListWidget(self.tabPlugins)
            self.verticalLayout.addWidget(self.listWidget)
            self.plainTextEdit = QPlainTextEdit(self.tabPlugins)
            self.verticalLayout.addWidget(self.plainTextEdit)
            self.addPage(self.tabPlugins, 'Plugins', icon='plugins')
            self.loadPlugins()
            self.listWidget.itemClicked.connect(self.echoInfo)
            self.listWidget.itemChanged.connect(self.togglePlugin)

            for plugin in self.app.pm.plugins:
                if plugin.active:
                    st = self.settingsTable(self.tabPlugins)
                    st.fill(plugin.config.options, '%splugins/%s/plugin.cfg' % (CWD, plugin.name), self)
                    plugin.icon = QIcon(os.path.abspath(plugin.config.info.icon))
                    plugin.st = st
                    self.addPage(st, plugin.name, self.tabPlugins.item, icon=plugin.icon)

        self.restartButton.clicked.connect(self.restart)
        self.cancelButton.clicked.connect(self.close)
        self.applyButton.clicked.connect(self.applyOptions)

        self.tree.itemClicked.connect(self.ic)




    #TODO: make it right
    def reloadPluginSettings(self):
        for plugin in self.app.pm.plugins:
            if plugin.active:
                item = plugin.st.item
                self.stack.removeWidget(plugin.st)
                st = self.settingsTable(self.stack)
                plugin.st = st
                item.page = st
                st.fill(plugin.config, '%splugins/%s/plugin.cfg' % (CWD, plugin.name), self)
                self.stack.addWidget(st)
            else:
                self.tree.removeItemWidget(plugin.st.item, 0)

    def loadPlugins(self):
        for plugin in self.app.pm.plugins:
            item = QListWidgetItem(plugin.name)
            item.plugin = plugin
            item.setFlags(Qt.ItemIsUserCheckable | Qt.ItemIsEnabled)

            check = Qt.Checked if plugin.active else Qt.Unchecked

            item.setCheckState(check)
            self.listWidget.addItem(item)

    def applyOptions(self):
        for cfg in self.configs:
            cfg.save()
        if self.app.config.options.plugins:
            self.savePlugins()
        self.close()

    def restart(self):
        self.applyOptions()
        python = sys.executable
        os.execl(python, python, *sys.argv)

    def echoInfo(self, item):
        info = self.getInfo(item.plugin)
        self.plainTextEdit.setPlainText(QString(info))

    def togglePlugin(self, item):
        state = item.checkState()
        if state:
            self.app.pm.activate(item.plugin)
        else:
            self.app.pm.deactivate(item.plugin)

        check = Qt.Checked if item.plugin.active else Qt.Unchecked
        item.setCheckState(check)
        if check == Qt.Checked:
            self.statusBar.showMessage('%s activated' % item.plugin.name)
        else:
            self.statusBar.showMessage('%s deactivated' % item.plugin.name)
            #        self.reloadPluginSettings()

    def savePlugins(self):
        names = []
        if self.app.config.options.plugins:
            for plugin in self.app.pm.plugins:
                names.append(plugin.name)
        self.app.p_config.plugins.active = names
        cfgfile = file(CWD + 'config/plugins.cfg', 'w')
        self.app.p_config.save(cfgfile)

    def getInfo(self, pi):
        return '''Name: %s
Description: %s
Author: %s
Version: %s
State: %s
        ''' % (pi.name, pi.config.info.description, pi.config.info.author, pi.config.info.version, pi.state)


class WinterScript(object):
    def __init__(self, app):
        self.app = app
        self.api = API()
        self.objects = {'api': self.api, 'script': self}
        if not self.app.config.options.script_safe:
            self.objects['app']=self.app
        self.aliases={'set':'__setattr__'}

    def executeFile(self, filename,raw=False):
        f = file(filename, 'r')
        for line in f:
            if line.strip() and not line.startswith('#'):
                line=line.lstrip().rstrip()
                if not raw:
                    self.executeLine(line)
                else:
                    self.executeRaw(line)

    def executeRaw(self, line):
        words = line.split(' ')
        self.executeLine('{"command":"%s","args":%s}' % (words[0], str(words[1:])))


    def executeLine(self, line):
        if self.app.config.options.script_engine:
            line = json.loads(line.replace("'", '"'), 'utf8')
            try:
                name, method = line['command'].split('.')
            except ValueError:
                name = None
                method = line['command']
            if name is None:
                object = self.objects['app']
            else:
                object = self.objects[name]

            for i, arg in enumerate(line['args']):
                try:
                    line['args'][i]=arg.strip()
                except:
                    pass
                try:
                    line['args'][i] = int(arg)
                except ValueError:
                    pass

            if method in self.aliases:
                method=self.aliases[method]

            try:
                method = object.__getattribute__(method)
                try:
                    if not 'keys' in line:
                        method(*line['args'])
                    else:
                        self.app.createAction('', line['command'], lambda: method(*line['args']), keyseq=line['keys'])
                except Exception, e:
                    self.api.error(e)
            except AttributeError, e:
                self.api.error(e)


    def addObject(self, name, object):
        self.objects[name] = object


class WinterQtApp(QMainWindow, WinterApp, QObject):
    __apiclass__ = API

    def __init__(self, app):
        QMainWindow.__init__(self)
        try:
            for font in os.listdir(CWD + 'fonts'):
                try:
                    QFontDatabase.addApplicationFont(CWD + 'fonts/' + font)
                except Exception, e:
                    print e
        except OSError:
            pass

        if os.path.isfile(CWD + 'config/style.qss'):
            self.setStyleSheet(file(CWD + 'config/style.qss', 'r').read())

        self.centralwidget = QWidget(self)
        self.horizontalLayout_2 = QHBoxLayout(self.centralwidget)

        self.setCentralWidget(self.centralwidget)
        self.statusBar = QStatusBar(self)
        self.setStatusBar(self.statusBar)

        self.toolBar = QToolBar(self)
        self.toolBar.setObjectName('toolBar')

        self._afterMWInit()
        WinterApp.__init__(self)

        self.api.toolBar = self.toolBar
        self.api.statusBar = self.statusBar
        self.api.dialog = self.dialog
        self.api.notify = self.notify

        self.sideBar = WinterSideBar(self)
        self.statusBar.addPermanentWidget(QWidget().setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding))

        self._afterAppInit()
        if self.config.options.debug:
            self.debugger = WinterQtDebug(self)
            self.api.debugger = self.debugger
            self.createAction('warning', self.tr('Debugger'), 'toggleDebug',
                keyseq=QKeySequence(self.debugger.config.options.debug_shortcut), toolbar=True)
            self.flag = WinterFlag()
            self.flag.setIcon(self.api.icons['green'],
                self.tr('Toggle debug panel: %1').arg(self.debugger.config.options.debug_shortcut))
            self.connect(self.flag, SIGNAL('clicked()'), self.toggleDebug)
            self.statusBar.addPermanentWidget(self.flag)
            self.api.setFlag = self.flag.setIcon

        screen = QDesktopWidget().screenGeometry()
        QMainWindow.setGeometry(self, 0, 0, screen.width(), screen.height())

        self.setWindowTitle(self.config.info['title'])
        self.setWindowIcon(QIcon(self.api.icons['app']))

        for we in WinterEditor.objects.all():
            we._afterAppInit()

        # self.statusBar.showMessage('Done. Switch modes: F4')



        if self.config.options.plugins:
            self.pm.activateAll()
            self.api.info(self.tr('Plugins initialised'))

        self.sm = SettingsManager(self)
        self.createAction('configure', self.tr('Settings'), self.sm.show, keyseq=QKeySequence('Ctrl+P'), toolbar=True)
        self.smflag = WinterFlag()
        self.smflag.setIcon(self.api.icons['configure'], self.tr('Options: Ctrl+P'))
        self.connect(self.smflag, SIGNAL('clicked()'), self.sm.show)
        self.statusBar.addPermanentWidget(self.smflag)
        self.api.info('Application initialised')

        self.createAction('about', self.tr('About'), 'about', keyseq=QKeySequence.HelpContents, toolbar=True)

        self.addToolBar(Qt.TopToolBarArea, self.toolBar)
        if not self.config.options.ui.tb_show:
            self.toolBar.hide()

        self.qs = QSettings('Winterstone', self.config.info.title)
        #        self.restoreGeometry(self.qs.value("geometry").toByteArray())
        #todo: fix
        #        self.restoreState(self.qs.value("windowState").toByteArray())

        self.signalMapper = QSignalMapper(self)

        self.toolBar.setIconSize(
            QSize(self.config.options.ui.tbicon_size, self.config.options.ui.tbicon_size))
        self.toolBar.setMovable(self.config.options.ui.tb_movable)
        self.resize(self.config.options.ui.width, self.config.options.ui.height)
        self.api.sm = self.sm

        self.config.add(self)

        scriptfiles = ['init.ws', 'hotkeys.ws']

        for fname in scriptfiles:
            path = self.api.CWD + 'scripts/' + fname
            if os.path.isfile(path):
                self.script.executeFile(path)

    def on_tb_show(self, value):
        if value:
            self.toolBar.show()
        else:
            self.toolBar.hide()

    def on_tbicon_size(self, value):
        self.toolBar.setIconSize(QSize(value, value))

    def on_tb_movable(self, value):
        self.toolBar.setMovable(value)

    def on_sbicon_size(self, value):
        self.sideBar.setIconSize(QSize(value, value))

    def on_sb_movable(self, value):
        self.sideBar.setMovable(value)

    def on_height(self, value):
        self.resize(self.config.options.ui.width, value)

    def on_width(self, value):
        self.resize(value, self.config.options.ui.height)

    def setMainWidget(self, widget):
        self.mainWidget = widget
        self.mainWidget.api = self.api
        self.api.mainWidget = self.mainWidget
        self.horizontalLayout_2.addWidget(self.mainWidget)
        self.horizontalLayout_2.setStretch(0, 3)

    def createSBAction(self, icon, name, widget, keyseq='', toolbar=False):
        if type(icon).__name__ != 'QIcon':
            icon = QIcon.fromTheme(icon, QIcon(self.api.icons[icon]))
        action = SBAction(self.sideBar.dock, icon, name, self)
        action.widget = widget
        self.sideBar.stack.addWidget(widget)
        action.triggered.connect(functools.partial(action.showWidget))
        if keyseq:
            action.setShortcut(keyseq)
        if toolbar:
            self.sideBar.addAction(action)
        self.addAction(action)
        return action

    def showSideBar(self, widget):
        print widget


    def createAction(self, icon, name, method, module='main', keyseq='', toolbar=False):
        if type(icon).__name__ != 'QIcon' and icon:
            icon = QIcon.fromTheme(icon, QIcon(self.api.icons[icon]))
        elif not icon:
            icon = QIcon()
        action = WinterAction(icon, name, self)
        if keyseq:
            action.setShortcut(keyseq)
        if type(method).__name__ == 'str':
            method = self.getMethod(method, module)
        self.connect(action, SIGNAL('triggered()'), method)
        if toolbar:
            self.toolBar.addAction(action)
        self.addAction(action)
        return action

    def about(self):
        self.dialog('about', 'About %s (%s)' % (self.config.info.title, self.config.info.version),
            getFileContent(CWD + 'ABOUT'))

    def input(self, title='Input dialog', text='Please input'):
        inputline = ''
        inputline = QInputDialog.getText(self, title, text)
        self['debug']('input value: %s' % inputline[0])
        return inputline[0]

    def dialog(self, type='info', title='Dialog', text='oops!!'):
        if type == 'info':
            QMessageBox.information(self, title, text)
        elif type == 'warning':
            QMessageBox.warning(self, title, text)
        elif type == 'critical':
            QMessageBox.critical(self, title, text)
        elif type == 'about':
            QMessageBox.about(self, title, text)

    def toggleDebug(self):
        if self.debugger.isHidden():
            self.debugger.show()
        else:
            self.debugger.hide()

    def _afterMWInit(self):
        pass

    def _afterAppInit(self):
        pass

    def info(self, *args, **kwargs):
        self.api.info(*args, **kwargs)

    def error(self, *args, **kwargs):
        self.api.error(*args, **kwargs)

    def debug(self, *args, **kwargs):
        self.api.debug(*args, **kwargs)

    def echo(self, *args, **kwargs):
        self.dialog(title='Echo', text=args[0])

    #    @try_this(API())
    def getMethod(self, key, module='main'):
        return WinterApp.getMethod(self, key, module)

    def closeEvent(self, event):
        self.qs.setValue("geometry", self.saveGeometry())
        self.qs.setValue("windowState", self.saveState())
        event.accept()

    def notify(self, title, body):
        if self.config.options.notification:
            knotify = dbus.SessionBus().get_object("org.kde.knotify", "/Notify")
            knotify.event('warning', 'inkmoth', [], title, body, [], [], 0, 0, dbus_interface="org.kde.KNotify")


    def setTitle(self, msg):
        self.setWindowTitle('%s [%s]' % (self.config.info.title, msg))

    def exit(self):
        exit()

    def beforeCore(self):
        self.script = WinterScript(self)
        self.api.script=self.script

