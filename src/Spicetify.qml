import Quickshell
import Quickshell.Io
import QtQuick


Scope{
    id: root
    property var current


    SocketServer {
        active: true
        path: "/tmp/spicetify.sock"
        handler: Socket {
            id: socket
    
            onConnectedChanged: {
                console.log(connected ? "new connection!" : "connection dropped!")
                
                if(connected){ //fazer as ações dinâmicas depois..
                    socket.write(JSON.stringify({
                    sender: "qsbar",
                    message: "current"
                    }))
                }
            }

            parser: SplitParser {
                //não está funcionando, checar se é no go ou aqui..
                onRead: message => console.log(`read message from socket: ${message}`)
            }
        }
    }
}