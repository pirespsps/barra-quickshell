import Quickshell
import Quickshell.Io
import QtQuick
import QtWebSockets


Scope{
    id: root
    property var current: ({})
    property var songString

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

            root.songString = "\u266c " + root.current.name + " - " + root.current.band

            //control variable (changed: true) and then, change to false in spotify menu (after send notification)
            //bota isso    
            //function addEventListener(type: "onplaypause", callback: (event?: Event & { data: PlayerState }) => void): void;
        }
    }

    function sendMessage(action){
        socket.sendTextMessage(JSON.stringify({
            sender: "qsbar",
            message: action
        }))
    }

}