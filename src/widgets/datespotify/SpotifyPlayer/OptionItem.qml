import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../../"


Rectangle{

    required property var text
    required property var onAction
    required property var yRec
    property var isPressed: false //atualizar

    id: root
    color: Colors.active
    width: parent.x * 1.75
    height: 25
    y: yRec

    Text{
        text: root.text
        color: "white"
        y: this.height / 2
        x:5
    }

    RoundButton{
        id: button
        text: root.isPressed? "\u25cf" : ""

        contentItem: Text {
            text: button.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 25
            bottomPadding: 3
            color: Colors.active
        }
        
        radius: 10
        height: parent.height - 3
        width: parent.height - 3
        y: (parent.height - height) / 2
        x: 200

        onClicked:{
            root.isPressed = !root.isPressed
            root.onAction(root.isPressed)
        }
    }

    
}