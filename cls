[33mcommit d1c2e6ec32bad4d844e1ba725e1e000368ecb8dd[m
Author: shahin4u000 <kazi.shahinbd@gmail.com>
Date:   Mon Apr 10 12:00:53 2017 +0200

    Qt slide bar and spin bar connector

[1mdiff --git a/main.cpp b/main.cpp[m
[1mnew file mode 100644[m
[1mindex 0000000..aa2571b[m
[1m--- /dev/null[m
[1m+++ b/main.cpp[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32m#include <QApplication>[m
[32m+[m[32m#include <QHBoxLayout>[m
[32m+[m[32m#include <QSlider>[m
[32m+[m[32m#include <QSpinBox>[m
[32m+[m[32mint main(int argc, char *argv[])[m
[32m+[m[32m{[m
[32m+[m[32m    QApplication app(argc, argv);[m
[32m+[m[32m    QWidget *window = new QWidget;[m
[32m+[m[32m    window->setWindowTitle("Enter Your Age");[m
[32m+[m[32m    QSpinBox *spinBox = new QSpinBox;[m
[32m+[m[32m    QSlider *slider = new QSlider(Qt::Horizontal);[m
[32m+[m[32m    spinBox->setRange(0, 130);[m
[32m+[m[32m    slider->setRange(0, 130);[m
[32m+[m[32m    QObject::connect(spinBox, SIGNAL(valueChanged(int)),[m
[32m+[m[32m                     slider, SLOT(setValue(int)));[m
[32m+[m[32m    QObject::connect(slider, SIGNAL(valueChanged(int)),[m
[32m+[m[32m                     spinBox, SLOT(setValue(int)));[m
[32m+[m[32m    spinBox->setValue(35);[m
[32m+[m[32m    QHBoxLayout *layout = new QHBoxLayout;[m
[32m+[m[32m    layout->addWidget(spinBox);[m
[32m+[m[32m    layout->addWidget(slider);[m
[32m+[m[32m    window->setLayout(layout);[m
[32m+[m[32m    window->show();[m
[32m+[m[32m    return app.exec();[m
[32m+[m[32m}[m
[1mdiff --git a/mainwindow.cpp b/mainwindow.cpp[m
[1mnew file mode 100644[m
[1mindex 0000000..49d64fc[m
[1m--- /dev/null[m
[1m+++ b/mainwindow.cpp[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32m#include "mainwindow.h"[m
[32m+[m[32m#include "ui_mainwindow.h"[m
[32m+[m
[32m+[m[32mMainWindow::MainWindow(QWidget *parent) :[m
[32m+[m[32m    QMainWindow(parent),[m
[32m+[m[32m    ui(new Ui::MainWindow)[m
[32m+[m[32m{[m
[32m+[m[32m    ui->setupUi(this);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mMainWindow::~MainWindow()[m
[32m+[m[32m{[m
[32m+[m[32m    delete ui;[m
[32m+[m[32m}[m
[1mdiff --git a/mainwindow.h b/mainwindow.h[m
[1mnew file mode 100644[m
[1mindex 0000000..a3948a9[m
[1m--- /dev/null[m
[1m+++ b/mainwindow.h[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32m#ifndef MAINWINDOW_H[m
[32m+[m[32m#define MAINWINDOW_H[m
[32m+[m
[32m+[m[32m#include <QMainWindow>[m
[32m+[m
[32m+[m[32mnamespace Ui {[m
[32m+[m[32mclass MainWindow;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mclass MainWindow : public QMainWindow[m
[32m+[m[32m{[m
[32m+[m[32m    Q_OBJECT[m
[32m+[m
[32m+[m[32mpublic:[m
[32m+[m[32m    explicit MainWindow(QWidget *parent = 0);[m
[32m+[m[32m    ~MainWindow();[m
[32m+[m
[32m+[m[32mprivate:[m
[32m+[m[32m    Ui::MainWindow *ui;[m
[32m+[m[32m};[m
[32m+[m
[32m+[m[32m#endif // MAINWINDOW_H[m
[1mdiff --git a/mainwindow.ui b/mainwindow.ui[m
[1mnew file mode 100644[m
[1mindex 0000000..6050363[m
[1m--- /dev/null[m
[1m+++ b/mainwindow.ui[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32m<ui version="4.0">[m
[32m+[m[32m <class>MainWindow</class>[m
[32m+[m[32m <widget class="QMainWindow" name="MainWindow" >[m
[32m+[m[32m  <property name="geometry" >[m
[32m+[m[32m   <rect>[m
[32m+[m[32m    <x>0</x>[m
[32m+[m[32m    <y>0</y>[m
[32m+[m[32m    <width>400</width>[m
[32m+[m[32m    <height>300</height>[m
[32m+[m[32m   </rect>[m
[32m+[m[32m  </property>[m
[32m+[m[32m  <property name="windowTitle" >[m
[32m+[m[32m   <string>MainWindow</string>[m
[32m+[m[32m  </property>[m
[32m+[m[32m  <widget class="QMenuBar" name="menuBar" />[m
[32m+[m[32m  <widget class="QToolBar" name="mainToolBar" />[m
[32m+[m[32m  <widget class="QWidget" name="centralWidget" />[m
[32m+[m[32m  <widget class="QStatusBar" name="statusBar" />[m
[32m+[m[32m </widget>[m
[32m+[m[32m <layoutDefault spacing="6" margin="11" />[m
[32m+[m[32m <pixmapfunction></pixmapfunction>[m
[32m+[m[32m <resources/>[m
[32m+[m[32m <connections/>[m
[32m+[m[32m</ui>[m
[1mdiff --git a/qtGui.pro b/qtGui.pro[m
[1mnew file mode 100644[m
[1mindex 0000000..eb9fdba[m
[1m--- /dev/null[m
[1m+++ b/qtGui.pro[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32m#-------------------------------------------------[m
[32m+[m[32m#[m
[32m+[m[32m# Project created by QtCreator 2017-04-04T00:02:36[m
[32m+[m[32m#[m
[32m+[m[32m#-------------------------------------------------[m
[32m+[m
[32m+[m[32mQT       += core gui[m
[32m+[m
[32m+[m[32mgreaterThan(QT_MAJOR_VERSION, 4): QT += widgets[m
[32m+[m
[32m+[m[32mTARGET = qtGui[m
[32m+[m[32mTEMPLATE = app[m
[32m+[m
[32m+[m[32m# The following define makes your compiler emit warnings if you use[m
[32m+[m[32m# any feature of Qt which as been marked as deprecated (the exact warnings[m
[32m+[m[32m# depend on your compiler). Please consult the documentation of the[m
[32m+[m[32m# deprecated API in order to know how to port your code away from it.[m
[32m+[m[32mDEFINES += QT_DEPRECATED_WARNINGS[m
[32m+[m
[32m+[m[32m# You can also make your code fail to compile if you use deprecated APIs.[m
[32m+[m[32m# In order to do so, uncomment the following line.[m
[32m+[m[32m# You can also select to disable deprecated APIs only up to a certain version of Qt.[m
[32m+[m[32m#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0[m
[32m+[m
[32m+[m
[32m+[m[32mSOURCES += main.cpp\[m
[32m+[m[32m        mainwindow.cpp[m
[32m+[m
[32m+[m[32mHEADERS  += mainwindow.h[m
[32m+[m
[32m+[m[32mFORMS    += mainwindow.ui[m
[1mdiff --git a/qtGui.pro.user b/qtGui.pro.user[m
[1mnew file mode 100644[m
[1mindex 0000000..fa8b508[m
[1m--- /dev/null[m
[1m+++ b/qtGui.pro.user[m
[36m@@ -0,0 +1,806 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<!DOCTYPE QtCreatorProject>[m
[32m+[m[32m<!-- Written by QtCreator 4.2.0, 2017-04-10T11:51:45. -->[m
[32m+[m[32m<qtcreator>[m
[32m+[m[32m <data>[m
[32m+[m[32m  <variable>EnvironmentId</variable>[m
[32m+[m[32m  <value type="QByteArray">{b1906c13-1ec6-45e6-be18-b47a196c96fc}</value>[m
[32m+[m[32m </data>[m
[32m+[m[32m <data>[m
[32m+[m[32m  <variable>ProjectExplorer.Project.ActiveTarget</variable>[m
[32m+[m[32m  <value type="int">0</value>[m
[32m+[m[32m </data>[m
[32m+[m[32m <data>[m
[32m+[m[32m  <variable>ProjectExplorer.Project.EditorSettings</variable>[m
[32m+[m[32m  <valuemap type="QVariantMap">[m
[32m+[m[32m   <value type="bool" key="EditorConfiguration.AutoIndent">true</value>[m
[32m+[m[32m   <value type="bool" key="EditorConfiguration.AutoSpacesForTabs">false</value>[m
[32m+[m[32m   <value type="bool" key="EditorConfiguration.CamelCaseNavigation">true</value>[m
[32m+[m[32m   <valuemap type="QVariantMap" key="EditorConfiguration.CodeStyle.0">[m
[32m+[m[32m    <value type="QString" key="language">Cpp</value>[m
[32m+[m[32m    <valuemap type="QVariantMap" key="value">[m
[32m+[m[32m     <value type="QByteArray" key="CurrentPreferences">CppGlobal</value>[m
[32m+[m[32m    </valuemap>[m
[32m+[m[32m   </valuemap>[m
[32m+[m[32m   <valuemap type="QVariantMap" key="EditorConfiguration.CodeStyle.1">[m
[32m+[m[32m    <value type="QString" key="language">QmlJS</value>[m
[32m+[m[32m    <valuemap type="QVariantMap" key="value">[m
[32m+[m[32m     <value type="QByteArray" key="CurrentPreferences">QmlJSGlobal</value>[m
[32m+[m[32m    </valuemap>[m
[32m+[m[32m   </valuemap>[m
[32m+[m[32m   <value type="int" key="EditorConfiguration.CodeStyle.Count">2</value>[m
[32m+[m[32m   <value type="QByteArray" key="EditorConfiguration.Codec">UTF-8</value>[m
[32m+[m[32m   <value type="bool" key="EditorConfiguration.ConstrainTooltips">false</value>[m
[32m+[m[32m   <value type="int" key="EditorConfiguration.IndentSize">4</value>[m
[32m+[m[32m   <value type="bool" ke