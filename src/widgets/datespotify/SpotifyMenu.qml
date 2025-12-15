import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {

    Spicetify {
        id: spicetify
    }

    property bool isVisible: false
    property var bar

    id: panel
    visible: isVisible
    color: "transparent"
    exclusiveZone: 0

    anchors {
        bottom: true
        right: true
    }

    width: 500
    height: 250

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 1
        topLeftRadius: 20

        Rectangle{
            width: parent.width/1.8
            height: parent.height
            color: Colors.active
            radius: 20
            border.color: Colors.background
            border.width: 3

            Column{
                id: leftSide
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
                    spacing: 25
                    topPadding: 4
                    leftPadding: parent.width/3.5
                    
                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/previous.png"
                        action: "previous"
                        spicetify: spicetify
                    }

                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/pause.png"
                        action: "play"
                        spicetify: spicetify
                        alternativeLogo: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/play.png"
                    }

                    PlayerButton{
                        image: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/next.png"
                        action: "next"
                        spicetify: spicetify
                    }
                }
                
            }

            Rectangle{
                width: panel.width - leftSide.width
                height: parent.height
                x: leftSide.width
                color: "transparent"

                Rectangle{
                    id: nowPlaying
                    color: Colors.active
                    width: parent.x * 1.75
                    height: 25
                    y: 10

                    Text{
                        text: "Now playing"
                        color: "white"
                        y: this.height / 2
                        x:5
                    }
                }

                Rectangle{
                    id: barSong
                    color: Colors.active
                    width: parent.x * 1.75
                    height: 25
                    y: nowPlaying.height + nowPlaying.y + 5
                }

                VolumeButton{
                    id: volume
                    spicetify: spicetify
                    y: parent.height - 25
                    x: 5
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