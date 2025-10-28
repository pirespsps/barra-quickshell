import QtQuick
import Quickshell
import "../"

Rectangle{

	SystemClock {
 		id: clock
  		precision: SystemClock.Hour
	}

	x: barra.width - this.width 
	y: barra.height / 2 - this.height / 2

	radius: 2
	width: 80
	height: barra.height 
	color: Colors.background

	Text{
		anchors.centerIn: parent
		text: Qt.formatDate(clock.date, "MMMM dd",)
		color: Colors.foreground
		font.pixelSize: 12
	}

	MouseArea{
        id:clickable_area
        anchors.fill: parent
        height:parent.height
        width: parent.width
        hoverEnabled:true

        onEntered: parent.color = Colors.active
        onExited: parent.color = Colors.background

        onPressed: {
            //...
        }
    }
}