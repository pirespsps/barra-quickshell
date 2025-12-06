import Quickshell
import Quickshell.Io
import QtQuick

Scope{
    id: root
    property var current

    Process{
        id: wsProc
        command: ["spicetify-ws-client"]
        running: true
        stdinEnabled: true

        stdout:StdioCollector{
            onDataChanged: {
                console.log("data:", data)
            }
            onStreamFinished:{
                console.log("processo terminou")
            }
        }
    }

}