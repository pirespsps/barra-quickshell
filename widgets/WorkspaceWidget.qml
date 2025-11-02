import QtQuick
import Quickshell.Widgets
import "../"

Rectangle{

Workspace{
    id: workspace
}

height: barra.height

Row{
    spacing: 2
    height: barra.height

    Repeater{
        model: workspace.workspaces
        delegate: Rectangle{
            width: 20
            height: barra.height 
            color: modelData == workspace.active? Colors.active : Colors.background
            Text{
                anchors.centerIn: parent
                text: modelData
                color: Colors.foreground
            }
        }
    }
}

}
