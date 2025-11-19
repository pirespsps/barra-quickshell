import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root

    property var commits: (function() {
    var arr = [];
        for (var i = 0; i < 12; i++) {
            var month = Array(30).fill(false);
            arr.push(month);
        }
        return arr;
    })()
	property var icon
    property var name
    property var months: ["Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"]

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
	running: false

	stdout: StdioCollector {

	    onStreamFinished: {

		var data = JSON.parse(this.text)
		
        for(var key in data){
            root.commits[parseInt(key)-1] = data[key];
        }

        for(var i = 0; i<12; i++){
            if(root.commits[i] === null){
                root.commits[i] = Array(30).fill(false);
            }
        }

        root.commits = root.commits.slice()
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

    function numberToMonth(n){
        return months[n];
    }

}