import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {

    Git {
        id: git
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
    }

    margins {
        bottom: mouse.hovered ? 0 : parentHeight
    }

    width: 800
    height: mouse.hovered ? 220 : 220 - parentHeight

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20
        topLeftRadius: 20

        Rectangle {
            anchors.centerIn: parent
            width: parent.width / 1.03
            height: parent.height / 1.05
            color: "transparent"
            opacity: 0.8
            radius: 10

            Column {
                topPadding: 5

                //User info 
                Row {
                    leftPadding: 7

                    Rectangle {
                        id: user_icon
                        width: 32
                        height: 32
                        color: "transparent"
                        radius: 60
                        clip: true

                        Image {
                            anchors.fill: parent
                            source: git.icon
                            mipmap: true
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                        }
                    }

                    Text {
                        text: git.name
                        color: Colors.foreground
                        font.pixelSize: 18
                        leftPadding: 7
                    }
                }

                //Month info
                Row {
                    height: panel.height * 0.92
                    topPadding: parent.height / 2 - height / 2

                    Repeater {
                        id: repeater_month
                        model: git.commits

                        delegate: Column {
                            required property var index
                            id:month_col

                            Rectangle {
                                id: month
                                width: panel.width / 12.5
                                height: panel.height * 0.5
                                color: Colors.active

                                Repeater {
                                    id: repeater_day

                                    property int columns: 4
                                    property int rows: 8

                                    model: git.commits[index]

                                    delegate: Rectangle {
                                        required property int index

                                        //property int row: Math.floor(index / repeater_day.columns)
                                        //property int col: index - repeater_day.columns * Math.floor(index / repeater_day.columns)

                                        property int row: index - repeater_day.rows * Math.floor(index / repeater_day.rows)
                                        property int col: Math.floor(index/repeater_day.rows)

                                        width: month.width / repeater_day.columns
                                        height: month.height / repeater_day.rows

                                        x: col * width
                                        y: row * height

                                        color: git.commits[month_col.index][index] ? "#004d02" : Colors.background
                                        radius: 3
                                    }
                                }
                            }
                            Text{
                                text: git.numberToMonth(month_col.index)
                                color: Colors.foreground
                                font.pixelSize: 11
                                horizontalAlignment: Text.AlignCenter
                                leftPadding:month.width/2
                            }
                        }
                    }
                }
            }
            Text{
                text: "*Últimos 1000 commits desse ano"
                font.pixelSize: 9
                color: Colors.foreground
                opacity: 0.6
                leftPadding: parent.width - this.contentWidth
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
