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

    width: 700
    height: mouse.hovered? 230 : 230 - this.parentHeight

    Rectangle{

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20
        topLeftRadius: 20

        // rectangle com git 
        Rectangle{
            anchors.centerIn: parent
            color: Colors.background
            opacity: 0.8
            radius: 10
            width: parent.width/1.03
            height: parent.height/1.05
            
            Column{
                topPadding: 5
                Row{
                    leftPadding:7
                    
                    Rectangle{
                        width: 32
			            height: 32
                        id: user_icon
                        y: parent.height - this.height
                        color:"transparent"
                        radius: 60
                        clip: true

                        //arrumar pra borda cortar...
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