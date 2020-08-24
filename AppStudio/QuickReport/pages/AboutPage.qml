/* Copyright 2019 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0

import "../controls/"

Rectangle {
    id:_root
    width: parent.width
    height: parent.height
    color: app.pageBackgroundColor

    signal next(string message)
    signal previous(string message)

    property int hitFeatureId
    property variant attrValue
    property string poweredby:qsTr("Powered by")

    visible: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: mapPage_headerBar
            Layout.alignment: Qt.AlignTop
            color: app.headerBackgroundColor
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 50 * app.scaleFactor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mouse.accepted = false
                }
            }

            Text {
                id: mapPage_titleText
                text: qsTr("About")
                textFormat: Text.StyledText
                anchors.centerIn: parent
                font.pixelSize: app.titleFontSize
                font.family: app.customTitleFont.name
                color: app.headerTextColor
                maximumLineCount: 1
                elide: Text.ElideRight
            }

            Icon {
                imageSource: "../images/ic_clear_white_48dp.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                onIconClicked: {
                    hide()
                }
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignTop
            Layout.fillHeight: true
            color: app.pageBackgroundColor
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height - mapPage_headerBar.height
            Layout.topMargin: app.units(16)
            Layout.bottomMargin: app.isIPhoneX ? 20 * AppFramework.displayScaleFactor : 0

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mouse.accepted = false
                }
            }

            Flickable {
                anchors.fill: parent
                contentHeight: columnContainer.height
                clip: true

                ColumnLayout {
                    id: columnContainer
                    width: Math.min(parent.width, 600*app.scaleFactor)
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: app.units(16)

                    Image {
                        Layout.preferredHeight: 50 * AppFramework.displayScaleFactor
                        Layout.preferredWidth: 50 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        fillMode: Image.PreserveAspectFit
                        source: getAppIcon()
                        visible: source > ""
                    }

                    Text {
                        text: app.info.title
                        color: app.textColor
                        font.pixelSize: app.titleFontSize
                        font.family: app.customTitleFont.name
                        font.bold: true
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Text {
                        text: app.info.description
                        visible: app.info.description > ""
                        textFormat: Text.StyledText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: app.textFontSize
                        font.family: app.customTextFont.name
                        onLinkActivated: {
                            app.openWebView(0, { pageId: _root, url: link });
                        }
                    }

                    Text{
                        text: qsTr("Access and Use Constraints") + ":"
                        visible: app.info.licenseInfo > ""
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font {
                            bold: true
                            pixelSize: app.titleFontSize
                            weight: Font.Bold
                            family: app.customTitleFont.name
                        }
                    }

                    Text {
                        text: app.info.licenseInfo
                        visible: app.info.licenseInfo > ""
                        textFormat: Text.StyledText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: app.textFontSize
                        font.family: app.customTextFont.name
                        onLinkActivated: {
                            app.openWebView(0, { pageId: _root, url: link });
                        }
                    }

                    Text {
                        text: qsTr("Credits") + ":"
                        visible: app.info.accessInformation > ""
                        textFormat: Text.RichText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font {
                            bold: true
                            weight: Font.Bold
                            pixelSize: app.titleFontSize
                            family: app.customTitleFont.name
                        }
                    }

                    Text {
                        text: app.info.accessInformation
                        visible: app.info.accessInformation > ""
                        textFormat: Text.StyledText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: app.textFontSize
                        font.family: app.customTextFont.name
                        onLinkActivated: {
                            app.openWebView(0, { pageId: _root, url: link });
                        }
                    }

                    Text {
                        text: qsTr("About the App") + ":"
                        textFormat: Text.RichText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font {
                            bold: true
                            weight: Font.Bold
                            pixelSize: app.titleFontSize
                            family: app.customTitleFont.name
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 48 * scaleFactor

                        RowLayout {
                            id: powerByRow

                            anchors.fill: parent

                            spacing: 0

                            Item {
                                Layout.preferredWidth: 8 * scaleFactor
                                Layout.fillHeight: true
                            }

                            IconImage {
                                Layout.preferredWidth: 48 * scaleFactor
                                Layout.fillHeight: true

                                MouseArea {
                                    anchors.fill: parent

                                    onClicked: {
                                        openAppStudioUrl();
                                    }
                                }
                            }

                            Item {
                                Layout.preferredWidth: 16 * scaleFactor
                                Layout.fillHeight: true
                            }

                            Label {
                                Layout.fillHeight: true

                                text: poweredby
                                clip: true
                                font.pixelSize: app.textFontSize
                                font.family: app.customTextFont.name


                                linkColor: app.headerBackgroundColor
                                color: app.black_87


                                font.weight: Font.Normal
                                horizontalAlignment: Label.AlignLeft
                                verticalAlignment: Label.AlignVCenter
                            }

                            Item {
                                Layout.preferredWidth: 4 * scaleFactor
                                Layout.fillHeight: true
                            }

                            Label {
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                text: "AppStudio for ArcGIS"

                                font.pixelSize: app.textFontSize
                                font.family: app.customTextFont.name



                                elide: Label.ElideRight
                                clip: true
                                
                                color: app.black_87

                                linkColor: app.headerBackgroundColor


                                font.bold: true

                                horizontalAlignment: Label.AlignLeft
                                verticalAlignment: Label.AlignVCenter

                                MouseArea {
                                    anchors.fill: parent

                                    onClicked: {
                                        openAppStudioUrl();
                                    }
                                }
                            }

                            Item {
                                Layout.preferredWidth: 16 * scaleFactor
                                Layout.fillHeight: true
                            }
                        }
                    }



                    Text {
                        text: qsTr("Version") + ":"
                        visible: app.info.version > ""
                        textFormat: Text.RichText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font {
                            bold: true
                            weight: Font.Bold
                            pixelSize: app.titleFontSize
                            family: app.customTitleFont.name
                        }
                    }

                    Text {
                        text: app.info.version
                        visible: app.info.version > ""
                        textFormat: Text.StyledText
                        color: app.textColor
                        wrapMode: Text.Wrap
                        linkColor: app.headerBackgroundColor
                        Layout.preferredWidth: parent.width - 20 * AppFramework.displayScaleFactor
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: app.textFontSize
                        font.family: app.customTextFont.name
                        onLinkActivated: {
                            app.openWebView(0, { pageId: _root, url: link });
                        }
                    }
                }
            }
        }
    }

    DropShadow {
        source: mapPage_headerBar
        //anchors.fill: source
        width: source.width
        height: source.height
        cached: false
        radius: 5.0
        samples: 16
        color: "#80000000"
        smooth: true
        visible: source.visible
    }

    function getAppIcon() {
        var resources = app.info.value("resources", {});
        var appIconPath = "", appIconFilePath = "";

        if (!resources) {
            resources = {};
        }

        if (resources.appIcon) {
            appIconPath = resources.appIcon;
        }

        //console.log("appIcon absolute path ", appIconPath, app.folder.filePath(appIconPath));

        var f = AppFramework.fileInfo(appIconPath)
        console.log(f.filePath, f.url, f.exists)

        if(f.exists) {
            appIconFilePath = "file:///" +app.folder.filePath(appIconPath);
        }

        return appIconFilePath;
    }

    function openAppStudioUrl() {
        app.openWebView(0, { pageId: _root, url: "https://appstudio.arcgis.com/" });
    }

    function open(){
        _root.visible = true
        bottomUp.start();
    }

    function hide(){
        topDown.start();
    }

    NumberAnimation {
        id: bottomUp
        target: _root
        property: "y"
        duration: 200
        from:_root.height
        to:0
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id: topDown
        target: _root
        property: "y"
        duration: 200
        from:0
        to:_root.height
        easing.type: Easing.InOutQuad
        onStopped: {
            _root.visible = false
        }
    }
}
