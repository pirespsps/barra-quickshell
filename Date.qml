import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string text

    Process {
	id: dateProc
	command: ["date",'+%B %d']
	running: true

	stdout: StdioCollector {

	    onStreamFinished: {

		root.text = this.text[0].toUpperCase() + this.text.slice(1)

		}
    	}
	}

    Timer {
	interval: 900000
	running: true
	repeat: true
	onTriggered: dateProc.running = true
    }
	
}