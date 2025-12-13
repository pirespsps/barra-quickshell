import Quickshell
import Quickshell.Io
import QtQuick
import QtWebSockets


Scope{
    id: root
    property var current: ({})

    WebSocket{
        id: socket 
        url: "ws://localhost:8080/ws"
        active: true

        onStatusChanged: {
            if (socket.status == WebSocket.Error) {
                console.log("Error: " + socket.errorString)
            } else if (socket.status == WebSocket.Open) {
                socket.sendTextMessage(JSON.stringify({sender: "qsbar", message: ""}))
                root.sendMessage("current")                
                console.log("Connected")
            } else if (socket.status == WebSocket.Closed) {
                console.log("\nSocket closed")
            }
        }
        
        onTextMessageReceived: function(json) {

            root.current = JSON.parse(JSON.parse(json).message)

            root.current = JSON.parse(json)

            console.log("true json: ", JSON.parse(json))
        }
    }

    function sendMessage(action){
        socket.sendTextMessage(JSON.stringify({
            sender: "qsbar",
            message: action
        }))
    }

}