import Quickshell
import QtQuick
import Quickshell.Io
import "../"

Rectangle{
    id: item
    required property string command
    required property string icon
    required property string text

    width:parent.width
    height: parent.height/8
    color: Colors.background
    opacity: 0.9

    Row{
        spacing: 10
        x: parent.x
		height: parent.height

        Image{
            width: 30
            height: 30
            y: parent.height / 2 - this.height/2
            source: item.icon
            mipmap: true
        }

        Text{
            text: item.text
            color: Colors.foreground
            y: parent.height / 2 - this.height/2
            font.pixelSize: 12
            width:50
        }

    }

    MouseArea{

        anchors.fill: item
        height:item.height
        width: item.width
        hoverEnabled:true

        onEntered: item.color = Colors.active

        onExited: item.color = Colors.background

        onPressed: process.running = true
    }

    Process{
        id: process
        running: false
        command: item.command.split(" ")
    }

}