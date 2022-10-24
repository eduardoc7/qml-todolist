import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TodoList Super Mega Foda")

    ToDoList {
        anchors.centerIn: parent
    }
}
