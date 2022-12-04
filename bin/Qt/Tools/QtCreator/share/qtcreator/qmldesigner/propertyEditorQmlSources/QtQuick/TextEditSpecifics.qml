// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0 WITH Qt-GPL-exception-1.0

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    CharacterSection {
        richTextEditorAvailable: true
        showVerticalAlignment: true
    }

    TextInputSection {}

    TextExtrasSection {
        showWrapMode: true
        showFormatProperty: true
    }

    FontExtrasSection {
        showStyle: false
    }

    PaddingSection {}
}
