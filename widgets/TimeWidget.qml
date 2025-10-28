import QtQuick
import "../"

Item{
	id: timeWidget

	Time {
		id: horario
	}

	Rectangle {
		anchors.centerIn: parent

		radius: 2
		width: 50
		height: barra.height
		color: "transparent"

		Text {
		    anchors.centerIn: parent
		    text: horario.time
		    color: Colors.foreground
		    font.pixelSize: 15
		}

		MouseArea{
        id:clickable_area
        anchors.fill: parent
        height:parent.height
        width: parent.width
        hoverEnabled:true

        onEntered: parent.color = Colors.active
        onExited: parent.color = "transparent"

        onPressed: {
            //...
        }
    }

	}
}