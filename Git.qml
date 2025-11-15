import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    //placeholder
    property var commits: [
	[true,true,true,true,true,false,true,true,true,true,false,false,false,true,false,false,false,false,false,false,true,false,true,true,false,true,true,true,true,true,true],
	[true,true,true,false,false,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true],
	[false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,false,false,false,true,false,true,false,false,true,true,false,true,false,true,false],
	[true,false,false,false,false,false,false,false,true,true,true,false,true,true,false,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true],
    [true,true,true,true,true,false,true,true,true,true,false,false,false,true,false,false,false,false,false,false,true,false,true,true,false,true,true,true,true,true,true],
	[true,true,true,false,false,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true],
	[false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,false,false,false,true,false,true,false,false,true,true,false,true,false,true,false],
	[true,false,false,false,false,false,false,false,true,true,true,false,true,true,false,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true],
	[true,false,false,false,false,false,false,false,true,true,true,false,true,true,false,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true],
	[true,false,false,false,false,false,false,false,true,true,true,false,true,true,false,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true],

]
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

    //fazer depois, design primeiro!
    //Process {
	//id: commitsProc
	//command: ["github-wrapper-json"]
	//running: false
//
	//stdout: StdioCollector {
//
	//    onStreamFinished: {
//
	//	var data = JSON.parse(this.text)
	//	}
    //	}
	//}

    Timer{
        id: commitsTimer 
        interval: 61000
	    running: false
	    repeat: false
	    onTriggered: commitsProc.running = true
    }

}