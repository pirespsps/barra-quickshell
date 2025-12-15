import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property var workspaces: [1]
    property var active 
    property var activeName

    property var activeRegex: /^workspace>>[0-9]/
    property var windowNameRegex: /activewindow>>.*/
    property var createWorkspaceRegex: /^createworkspace>>[0-9]/
    property var removeWorkspaceRegex: /^destroyworkspace>>[0-9]/

    Socket{
        id: socket
        path: `/run/user/1000/hypr/${Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE")}/.socket2.sock`
        connected: true

        parser: SplitParser{

            onRead: data => {

                if(data.match(root.windowNameRegex) != null){
                    root.activeName = data.replace(/activewindow>>?[^,]+,/,"")
                }else if(data.match(root.createWorkspaceRegex) != null){
                    root.workspaces.push(data.match(/[0-9]/)[0])
                    root.workspaces = root.workspaces.filter((v,i) => v != 0)
                    
                }else if(data.match(root.activeRegex) != null){
                    root.active = data.match(/[0-9]/)[0]
                
                }else if(data.match(root.removeWorkspaceRegex) != null){
                    let remove = data.match(/[0-9]/)[0]
                    root.workspaces = root.workspaces.filter((v,i) => v != remove)
                }
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