import QtQuick
import "../../"

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

		GitMenu{
        id: menu_git
        parentMouseArea: clickable_area
        parentHeight: parent.height
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
            menu_git.isVisible = !menu_git.isVisible
        }
    }

	}
}