import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import ToDo 1.0

ColumnLayout {
    property int count: toDoList.countDoneItems()

    function hasChecked( model, checked ) {
        model.done = checked;
        count = toDoList.countDoneItems()
    }

    Frame {
        id: frameId
        Layout.fillWidth: true

        ListView {
            id: listView
            implicitWidth: 400
            implicitHeight: 400
            clip: true
            anchors.fill: parent

            model: ToDoModel {
                // Q_PROPERTY definida no todomodel.h
                list: toDoList
            }

            // um template para cada item no model
            // como deverá aparecer na tela
            delegate: RowLayout {
                width: parent.width
                CheckBox {
                    checked: model.done
                    onClicked: hasChecked(model, checked)
                }
                TextField {
                    text: model.title
                    onEditingFinished: model.title = text
                    Layout.fillWidth: true
                }
                Button {
                    Layout.maximumWidth: 62
                    text: qsTr("Excluir")
                }
            }
        }
    }

    RowLayout {
        TextField {
            id: titleText
            Layout.fillWidth: true
            placeholderText: "Nova tarefa..."
        }
        Button {
            text: qsTr("Adicionar")
            Keys.onEnterPressed: {
                clicked()
            }
            onClicked: function test() {
                toDoList.appendItem(qsTr(titleText.text))
                titleText.text = ""
            }
            Layout.fillWidth: true
        }
    }

    RowLayout {
        Layout.alignment: Qt.AlignCenter
        Layout.margins: 10
        Label {
            text: "Concluídos: " + count
        }
    }
}
