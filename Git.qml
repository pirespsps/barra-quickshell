import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property var commits: []
	property var icon
    property var name 

    Process{
        id: userDataProc
        command: ["gh","api","users/pirespsps"]
        running: true

        stdout: StdioCollector{
            onStreamFinished:{
                var data = JSON.parse(this.text)
				root.name = data.login
                root.icon = data.avatar_url
            }
        }
    }

    Process {
	id: commitsProc
	command: ["github-wrapper-json"]
	//bin não está funcionando por algum motivo
	running: true

	stdout: StdioCollector {

	    onStreamFinished: {

		var data = JSON.parse(this.text)

        root.workspaces = data.map(workspace => workspace.id)

		}
    	}
	}
	
}