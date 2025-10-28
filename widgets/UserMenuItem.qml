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
    color: mouse.hovered? Colors.active : Colors.background
    opacity: 0.9

    Row{
        spacing: 10
        x: parent.x
		height: parent.height
		width: parent.width
        leftPadding: 5

        Image{
            width: parent.width/8.5
            height: parent.height/1.8
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

    HoverHandler{
        id: mouse
        blocking: false
    }

    TapHandler {
    onTapped: {
        process.running = true
    }
}

    Process{
        id: process
        running: false
        command: item.command.split(" ")
    }

}