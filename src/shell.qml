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


	    PanelWindow {
		id: barra_wind
		
		screen: root.modelData
		color: Colors.background
	 	implicitHeight: 35

		anchors {
		    bottom: true
		    left: true
		    right: true
		} 

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