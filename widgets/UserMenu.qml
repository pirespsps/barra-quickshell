import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../"

PanelWindow {
    required property var parentMouseArea
    required property var parentHeight

    property var actions: [
        {
            text: "Desligar",
            icon: "../icons/shutdown.png",
            command: 'echo "pires" | sudo -S shutdown -h now'
        },

        {
            text: "Trocar Wallpaper",
            icon: "../icons/changewallpaper.png",
            command: "change-wallpaper.sh"
        },
    ]

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
        bottom: this.parentHeight
    }

    Rectangle{

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20

        Column{

            spacing:1
            topPadding: 20
            leftPadding: 5

            Repeater{
                id: repeater
                model: panel.actions
                delegate:UserMenuItem{
                    required property var index

                    width:panel.width - parent.leftPadding - 1
                    height: panel.height/8

                    command: panel.actions[index].command
                    icon: panel.actions[index].icon
                    text: panel.actions[index].text
                }

            }

        }

    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        height:parent.height
        width: parent.width
        hoverEnabled:true

        onEntered: {
            panel.margins.bottom = 0
            panel.visible = true
        } 

        onExited: {
            panel.margins.bottom = panel.parentHeight
            panel.visible = false
        }
    }

}