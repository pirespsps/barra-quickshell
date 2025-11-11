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
        onExited: {commitsTimer.start()}
    }

    Process {
	id: commitsProc
	command: ["github-wrapper-json"]
	//bin não está funcionando por algum motivo
	running: false

	stdout: StdioCollector {

	    onStreamFinished: {

		var data = JSON.parse(this.text)

		}
    	}
	}

    Timer{
        id: commitsTimer 
        interval: 61000
	    running: false
	    repeat: false
	    onTriggered: commitsProc.running = true
    }

}