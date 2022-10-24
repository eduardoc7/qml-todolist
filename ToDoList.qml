import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import ToDo 1.0

ColumnLayout {
    Frame {
        Layout.fillWidth: true

        ListView {
            implicitWidth: 250
            implicitHeight: 250
            clip: true
            anchors.fill: parent

            model: ToDoModel {
                list: toDoList
            }

            // um template para cada item no model
            // como deverá aparecer na tela
            delegate: RowLayout {
                width: parent.width
                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }
                TextField {
                    text: model.title
                    onEditingFinished: model.title = text
                    Layout.fillWidth: true
                }
            }
        }
    }

    RowLayout {
        Button {
            text: qsTr("Adicionar novo item")
            onClicked: toDoList.appendItem()
            Layout.fillWidth: true
        }
        Button {
            text: qsTr("Remover os items finalizados")
            onClicked: toDoList.removeCompletedItems()
            Layout.fillWidth: true
        }
    }
}
