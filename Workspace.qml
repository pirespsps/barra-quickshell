import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property var workspaces: []
    property var active 
    property var activeName

    Process{
        id: activeProc
        command: ["hyprctl","activeworkspace","-j"]
        running: true

        stdout: StdioCollector{
            onStreamFinished:{
                var data = JSON.parse(this.text)
                root.active = data.id
                root.activeName = data.lastwindowtitle
            }
        }
    }

    Process {
	id: workspaceProc
	command: ["hyprctl","workspaces","-j"]
	running: true

	stdout: StdioCollector {

	    onStreamFinished: {

		var data = JSON.parse(this.text)

        root.workspaces = data.map(workspace => workspace.id)

		}
    	}
	}

    Timer{
        id: timer_repeat
        interval: 1500
        running:true
        repeat: true
        onTriggered:{
            workspaceProc.running = true
            activeProc.running = true
        }
    }
	
}