import Quickshell
import Quickshell.Io
import QtQuick
import "./widgets" as Widgets

ShellRoot {

    Variants {

	model: Quickshell.screens


	Item {
	    id: root
	    required property var modelData
		property var isBarVisible: false

		PanelWindow{

			id: mouseListener
			screen: root.modelData
			height: 10
			color: "transparent"
			visible: true
			exclusiveZone:0
			
			anchors{
				bottom:true
				left: true
				right: true
			}

			MouseArea{

			id: mouseArea
			anchors.fill: parent
			height: parent.height
			hoverEnabled: true
			
			onEntered:root.isBarVisible = true

			onExited: hideTimer.start()

		}

		Timer {
		    id: hideTimer
    		interval: 200
    		onTriggered: root.isBarVisible = barraMouseArea.containsMouse
		}


	    PanelWindow {
		id: barra_wind
		visible: root.isBarVisible
		screen: root.modelData
		color: "transparent"
	 	height: 33
		exclusiveZone: 0

		anchors {
		    bottom: true
		    left: true
		    right: true
		} 

		MouseArea {
        id: barraMouseArea
        anchors.fill: parent
		height:parent.height
        hoverEnabled: true

		onExited: root.isBarVisible = false

		Shell{
			id: barra
			visible: parent.visible
			width: parent.width
			height: parent.height
		}

	 			}
			}
		}
	}
}
}