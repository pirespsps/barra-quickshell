import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {
    required property var parentMouseArea
    required property var parentHeight
    property bool isVisible: false

    property var actions: [
        {
            text: "Desligar",
            icon: "../../../assets/icons/shutdown.png",
            command: "sh -c shutdown.sh"
        },

        {
            text: "Reboot",
            icon: "../../../assets/icons/reboot.png",
            command: "sh -c reboot.sh"
        },

        {
            text: "Trocar Wallpaper",
            icon: "../../../assets/icons/changewallpaper.png",
            command: "sh -c change-wallpaper.sh"
        },

    ]

    id: panel
    visible: isVisible
    color: "transparent"
    exclusiveZone: 0

    anchors{
        left: true
        bottom: true
    }

    margins{
        bottom: mouse.hovered? 0 : this.parentHeight
    }

    width: 200
    height: mouse.hovered? 350 : 350 - this.parentHeight

    Rectangle{

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20

        Column{

            topPadding: 20

            Repeater{
                id: repeater
                model: panel.actions
                delegate:UserMenuItem{
                    required property var index

                    width:panel.width - 1
                    height: panel.height/8

                    command: panel.actions[index].command
                    icon: panel.actions[index].icon
                    text: panel.actions[index].text
                }

            }

        }

    }

    HoverHandler{
        id: mouse
        blocking: false
        target: panel

        onHoveredChanged:{
            if(mouse.hovered){
                panel.isVisible = true
            }else{
                panel.isVisible = false
            }
        }
    }

}