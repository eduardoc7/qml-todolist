import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

/**
@TODO: um select com prioridade: Baixa, Média e Alta
**/
Window {
    id: rootMain
    visible: true
    width: 700
    height: 500
    title: qsTr("TodoList Super Mega Foda")

    // esse objeto foi criado no ToDoList.qml
    ToDoList {
        anchors.centerIn: parent
    }
}
