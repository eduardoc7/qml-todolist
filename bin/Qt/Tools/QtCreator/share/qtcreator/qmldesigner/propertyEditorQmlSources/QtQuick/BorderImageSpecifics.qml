// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0 WITH Qt-GPL-exception-1.0

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioControls 1.0 as StudioControls
import StudioTheme 1.0 as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        caption: qsTr("Border Image")

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel { text: qsTr("Source") }

            SecondColumnLayout {
                UrlChooser {
                    backendValue: backendValues.source
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Source size")
                blockedByTemplate: !backendValues.sourceSize.isAvailable
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.sourceSize_width
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                    enabled: backendValue.isAvailable
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    //: The width of the object
                    text: qsTr("W", "width")
                    enabled: backendValues.sourceSize_width.isAvailable
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.sourceSize_height
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                    enabled: backendValue.isAvailable
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    //: The height of the object
                    text: qsTr("H", "height")
                    enabled: backendValues.sourceSize_height.isAvailable
                }
/*
                TODO QDS-4836
                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                LinkIndicator2D {}
*/
                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Tile mode H")
                blockedByTemplate: !backendValues.horizontalTileMode.isAvailable
            }

            SecondColumnLayout {
                ComboBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                    backendValue: backendValues.horizontalTileMode
                    model: ["Stretch", "Repeat", "Round"]
                    scope: "BorderImage"
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Tile mode V")
                blockedByTemplate: !backendValues.verticalTileMode.isAvailable
            }

            SecondColumnLayout {
                ComboBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                    model: ["Stretch", "Repeat", "Round"]
                    backendValue: backendValues.verticalTileMode
                    scope: "BorderImage"
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Border left") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.border_left
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Border right") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.border_right
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Border top") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.border_top
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Border bottom") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.border_bottom
                    minimumValue: -2000
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Mirror")
                tooltip: qsTr("Specifies whether the image should be horizontally inverted.")
                blockedByTemplate: !backendValues.mirror.isAvailable
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.mirror.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                  + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.mirror
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Smooth")
                tooltip: qsTr("Specifies whether the image is smoothly filtered when scaled or transformed.")
                blockedByTemplate: !backendValues.smooth.isAvailable
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.smooth.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.smooth
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Cache")
                tooltip: qsTr("Specifies whether the image should be cached.")
                blockedByTemplate: !backendValues.cache.isAvailable
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.cache.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.cache
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Asynchronous")
                tooltip: qsTr("Specifies that images on the local filesystem should be loaded asynchronously in a separate thread.")
                blockedByTemplate: !backendValues.asynchronous.isAvailable
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.asynchronous.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.asynchronous
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }
        }
    }
}
