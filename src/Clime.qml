import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string icon
    property string temp

    Process {
	id: climeProc
	command: ["weather-json"]
	running: false

	stdout: StdioCollector {

	    onStreamFinished: {

		var data = JSON.parse(this.text)

		root.icon = "https:" + data.icon
		root.temp = data.temp

		}
    	}
	}

	Timer {
	id: timer_init
    interval: 1000
    running: true
    repeat: false
    onTriggered: climeProc.running = true
	}

    Timer {
	interval: 900000
	running: true
	repeat: true
	onTriggered: climeProc.running = true
    }
	
}