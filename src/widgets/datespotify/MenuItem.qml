import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"


Rectangle{

    required property var text
    required property var onAction
    required property var yRec
    required property var spicetify

    color: Colors.active
    width: parent.x * 1.75
    height: 25
    y: yRec

    Text{
        text: "Now playing"
        color: "white"
        y: this.height / 2
        x:5
    }
}