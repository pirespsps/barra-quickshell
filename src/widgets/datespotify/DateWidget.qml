import QtQuick
import Quickshell
import "../../"
import "./SpotifyPlayer" as Player

Rectangle{

	Date{
		id: data
	}

	x: barra.width - this.width 
	y: barra.height / 2 - this.height / 2

	radius: 2
	width: 88
	height: barra.height 
	color: "transparent"

	Text{
		anchors.centerIn: parent
		text: data.text
		color: Colors.foreground
		font.pixelSize: 12
	}

	Player.SpotifyMenu{
		id: spotifyMenu
	}

	Player.SongBarName{
		id:songbar
		text: spotifyMenu.spicetify.songString
		isActive: spotifyMenu.isSongBar
		barra: barra
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
            spotifyMenu.isVisible = !spotifyMenu.isVisible
        }
    }
}
