import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {
    property bool isVisible: false

    property var actions: [
        {
            text: "Desligar",
            icon: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/shutdown.png",
            command: "sh -c shutdown.sh"
        },

        {
            text: "Reboot",
            icon: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/reboot.png",
            command: "sh -c reboot.sh"
        },

        {
            text: "Trocar Wallpaper",
            icon: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/changewallpaper.png",
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

    width: 200
    height: 350

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