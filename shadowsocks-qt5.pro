#-------------------------------------------------
#
#          Project Shadowsocks-Qt5
#
#-------------------------------------------------

QT       += core gui widgets

TARGET   = ss-qt5
TEMPLATE = app
VERSION  = 0.3.0


SOURCES  += main.cpp\
            mainwindow.cpp \
            profiles.cpp \
            ss_process.cpp \
            ip4validator.cpp \
            portvalidator.cpp

HEADERS  += mainwindow.h \
            profiles.h \
            ss_process.h \
            ssprofile.h \
            ip4validator.h \
            portvalidator.h

FORMS    += mainwindow.ui

OTHER_FILES += README.md \
                gui-config.json \
                shadowsocks-qt5.desktop

binary_path = /usr/bin
desktop.path = /usr/share/applications
desktop.files = shadowsocks-qt5.desktop
ssicon.path = /usr/share/icons/hicolor/512x512/apps
ssicon.files = icon/shadowsocks-qt5.png

!equals($$(INSTALL_PREFIX), "") {
    unix: {
        binary_path = $$(INSTALL_PREFIX)/bin
        desktop.path = $$(INSTALL_PREFIX)/share/applications
        ssicon.path = $$(INSTALL_PREFIX)/share/icons/hicolor/512x512/apps
    }
    else: binary_path = $$(INSTALL_PREFIX)
}

target.path = $$binary_path

win32: {
    gui_conf.path = target.path
    gui_conf.files = gui-config.json
    INSTALLS += gui_conf
}

INSTALLS += target

!mac:unix: INSTALLS += desktop ssicon

RESOURCES += icons.qrc

win32: RC_FILE = ss-qt5.rc
mac: ICON = ss-qt5.icns
