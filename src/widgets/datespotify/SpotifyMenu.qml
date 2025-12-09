import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {

    Spicetify {
        id: spicetify
    }

    required property var parentMouseArea
    required property var parentHeight

    property bool isVisible: false

    id: panel
    visible: isVisible
    color: "transparent"
    exclusiveZone: 0

    anchors {
        bottom: true
        right: true
    }

    margins {
        bottom: mouse.hovered ? 0 : parentHeight
    }

    width: 500
    height: mouse.hovered ? 250 : 250 - parentHeight

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topLeftRadius: 20

        Rectangle{
            width: parent.width/1.8
            height: parent.height
            color: "transparent"
            topLeftRadius: 20

            Column{
                anchors.centerIn: parent
                topPadding: 5
                width: parent.width
                height: parent.height

                Image{
                    source: spicetify.current.image
                    width: parent.width * 0.7
                    height: parent.height * 0.73
                    mipmap: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: 1
                }

                Text{
                    text: spicetify.current.name
                    color: Colors.foreground
                    width: parent.width * 0.95
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    elide: Text.ElideRight
                    font.pointSize: 10
                }

                Text{
                    text: spicetify.current.band
                    color: Colors.foreground
                    width: parent.width * 0.95
                    anchors.horizontalCenter: parent.horizontalCenter
                    elide: Text.ElideRight
                    font.pointSize: 8
                    horizontalAlignment: Text.AlignHCenter
                    opacity: 0.7
                }

                Row{

                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    spacing: 15
                    topPadding: 4
                    leftPadding: width/3 - 5
                    
                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/previous.png"
                        action: "previous"
                        spicetify: spicetify
                    }

                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/pause.png"
                        action: "play"
                        spicetify: spicetify
                    }

                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/next.png"
                        action: "next"
                        spicetify: spicetify
                    }
                    
                    //previous
                    //play
                    //next
                }
                
            }

        }

    }

    HoverHandler {
        id: mouse
        blocking: false
        target: panel

        onHoveredChanged: {
            panel.isVisible = mouse.hovered
        }
    }
}
