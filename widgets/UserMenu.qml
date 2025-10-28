import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../"

//troca pra popupWindow 

PanelWindow {
    required property var parentMouseArea

    id: panel

    width: 300
    height: 400
    visible: false
    color: "transparent"
    exclusiveZone: 0

    anchors{
        left: true
        bottom: true
    }
    margins{
        bottom: parent.height
    }

    Rectangle{

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20

    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        height:parent.height
        width: parent.width
        hoverEnabled:true

        onEntered: {
            root.isBarVisible = true 
        }

        onExited: {
            if (!panel.parentMouseArea.containsMouse)
                root.isBarVisible = false
                panel.visible = false
            }
    }

}  