import QtQuick
import Quickshell.Widgets
import "../"

Rectangle{

    Clime{
        id: clime
    }

	x: barra.width - this.width 
	y: barra.height / 2 - this.height / 2

	radius: 2
	width: 80
	height: barra.height
	//color: Colors.background
	color: "transparent"

    Row{
		anchors.centerIn: parent
		spacing: 1
		height: parent.height

        Image{
            source: clime.icon
			mipmap: true
			y: parent.height/2 - this.height/2
			width: 29
			height: 29
            }

	    Text{
			width:45
			y: parent.height/2 - this.height/2
    		text: clime.temp + "ºC"
	    	color: Colors.foreground
		    font.pixelSize: 12
			}
                
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