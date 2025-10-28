import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string time

    Process {
	id: dateProc
	command: ["date", "+%H:%M"]
	running: true

	stdout: StdioCollector {
	    onStreamFinished: root.time = this.text
	}
    }

    Timer {
	interval: 60000
	running: true
	repeat: true
	onTriggered: dateProc.running = true
    }
}