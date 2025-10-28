import QtQuick
import "./widgets" as Widgets

Rectangle {
	
		    id: barra
			anchors.centerIn: parent
		    
			width: parent.width
		    height: parent.height
		    color: Colors.background
			opacity:0.8

			Widgets.UserWidget{
				id: user_widget
				x: 0
				y: barra.height / 2 - this.height / 2
			}

			Widgets.WorkspaceWidget{
				id: workspace_widget
				x: user_widget.width + 5
			}

			Widgets.TimeWidget{
				id: time_widget
				x: barra.width / 2
				y: barra.height / 2 - this.height / 2 
			}

		    Widgets.DateWidget{
			    id: date_widget
			    x: barra.width - this.width 
			    y: barra.height / 2 - this.height / 2
			}

			Widgets.ClimeWidget{
				id: clime_widget
			    x: barra.width - this.width - date_widget.width 
			    y: barra.height / 2 - this.height / 2
			}
  	 }