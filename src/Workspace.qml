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

    property var activeRegex
    property var windowNameRegex: /activewindow>>.*/
    property var createWorkspaceRegex: /createworkspace>>[0-9]+/
    property var removeWorkspaceRegex: /destroyworkspace>>[0-9]/

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
        //path: root.runtimeDir + "/hypr/" + root.signature + ".socket.sock" 
        path: `/run/user/1000/hypr/${Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE")}/.socket2.sock`
        connected: true

        parser: SplitParser{

            onRead: data => {

                if(data.match(root.windowNameRegex) != null){
                    root.activeName = data.replace(/[activewindow>>][\s\S]+,/,"")
                }else if(data.match(root.createWorkspaceRegex) != null){
                    //mudar como imprime....
                    root.workspaces = root.workspaces.push(data.match(/[0-9]/)[0])

                }else if(data.match(root.activeRegex) != null){
                    //workspace ativo
                
                }else if(data.match(root.removeWorkspaceRegex) != null){
                    let remove = data.match(/[0-9]/)[0]

                    root.workspaces = root.workspaces.filter((v,i) => i != remove)

                }

                console.log("Data: ", data)
            }

        }

        onError: error => {
            console.log("Error in connection: ",error)
        }

        Component.onCompleted: {
            console.log("\n\nconnection: ",socket.path, "\nconnected: ",socket.connected,"\n")
        }
        
    }

}