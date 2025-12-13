import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property var workspaces: []
    property var active 
    property var activeName
    property var signature
    property var runtimeDir
//
//    Process{
//        id: activeProc
//        command: ["hyprctl","activeworkspace","-j"]
//        running: true
//
//        stdout: StdioCollector{
//            onStreamFinished:{
//                var data = JSON.parse(this.text)
//                root.active = data.id
//                root.activeName = data.lastwindowtitle
//            }
//        }
//    }
//
//    Process {
//	id: workspaceProc
//	command: ["hyprctl","workspaces","-j"]
//	running: true
//
//	stdout: StdioCollector {
//
//	    onStreamFinished: {
//
//		var data = JSON.parse(this.text)
//
//        root.workspaces = data.map(workspace => workspace.id)
//
//		}
//    	}
//	}
//
//    Timer{
//        id: timer_repeat
//        interval: 1500
//        running:true
//        repeat: true
//        onTriggered:{
//            workspaceProc.running = true
//            activeProc.running = true
//        }
//    }
//

    Process{
        id: runtimeDirProc
        running: true
        
        command: ["sh","-c","echo $XDG_RUNTIME_DIR"]

        stdout: StdioCollector{
            onStreamFinished:{
                root.runtimeDir = this.text
            }
        }
    }

    Process{
        id: signatureProc
        running: true
        
        command: ["sh","-c","echo $HYPRLAND_INSTANCE_SIGNATURE"]

        stdout: StdioCollector{
            onStreamFinished:{
                root.signature = this.text
            }
        }
    }

    Socket{
        id: socket
        path: {
            //timeout ou alguma coisa pra pegar as propriedades certo...
            root.runtimeDir + "/hypr/" + root.signature + ".socket.sock"
        }
        Component.onCompleted: {
            console.log("\n\nconnection: ",socket.path, "\nconnected: ",socket.connected,"\n")
        }
    }

}
