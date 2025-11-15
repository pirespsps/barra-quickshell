import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

// fazer herança de menu genéricos!

PanelWindow {

    Git{
        id: git
    }

    required property var parentMouseArea
    required property var parentHeight
    property bool isVisible: false

    id: panel
    visible: isVisible
    color: "transparent"
    exclusiveZone: 0

    anchors{
        bottom: true
    }

    margins{
        bottom: mouse.hovered? 0 : this.parentHeight
    }

    width: 800
    height: mouse.hovered? 240 : 240 - this.parentHeight

    Rectangle{

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20
        topLeftRadius: 20
        x: parent.width/2 - this.width/2

        Rectangle{
            anchors.centerIn: parent
            color: "transparent"
            opacity: 0.8
            radius: 10
            width: parent.width/1.03
            height: parent.height/1.05

            Column{
                topPadding: 5
                Row{ //icon e user
                    leftPadding:7
                    
                    Rectangle{
                        width: 32
			            height: 32
                        id: user_icon
                        y: parent.height - this.height
                        color:"transparent"
                        radius: 60
                        clip: true

                        Image{
                            anchors.fill:parent
                            anchors.centerIn: parent
                            source: git.icon
			                mipmap: true
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                        }

                    }
                    Text {
		                text: git.name
		                color: Colors.foreground
			            y: parent.height - this.height - user_icon/2
		                font.pixelSize: 18
                        leftPadding:7
		            }
                }
                Row{

                    height: panel.height * 0.95
                    topPadding: parent.height/2 - this.height/2

                    Repeater{
                        id: repeater_month
                        model: git.commits
                        delegate: Rectangle{
                            
                            required property var index
                            
                            id: month
                            width: panel.width/12.5; height: panel.height * 0.5
                            color: Colors.active
                            Repeater{
                                
                                property var columns: 4
                                property var rows: 8
                                
                                id: repeater_day
                                model: git.commits[index]
                                delegate: Rectangle{

                                    required property var index
                                    property var row: Math.floor(index/repeater_day.columns)
                                    property var col: index - repeater_day.columns * Math.floor(index/repeater_day.columns)

                                    width: month.width/repeater_day.columns
                                    height: month.height/repeater_day.rows 
                                    
                                    y: row * height
                                    x: col * width

                                    color: git.commits[month.index][index]? "#004d02" : Colors.background
                                    radius:5
                                }
                            }
                        }
                    }
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