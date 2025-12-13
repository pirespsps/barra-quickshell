import QtQuick
import Quickshell
import "../../"

Row{

    required property var spicetify
    property var pathMute: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/mute.png"
    property var pathVol: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/volume.png"
    property var previousVol: 50

    id: root
    width: parent.width
    height: parent.height

    Image{
        id: volumeImg
        source: activeVol.width > 0? root.pathVol : root.pathMute
        height: 18
        width: 18
        mipmap: true
        y: (parent.height - height) / 2

        TapHandler{
            id: muteHandler
            target: volumeImg
            onSingleTapped: {

                if(volumeImg.source == pathVol){
                    volumeImg.source = pathMute
                    root.previousVol = currentVolume()
                    spicetify.sendMessage("volume -0")
                    buttonVol.x = 0
                }else{
                    volumeImg.source = pathVol
                    buttonVol.x = root.previousVol/100 * barraVol.width
                    spicetify.sendMessage("volume -" + root.previousVol)
                }
            }
        }
    }

    Rectangle{
        anchors.centerIn: parent
        id: barraVol
        width: 230
        height: 15
        color: "transparent"

        Rectangle{
            id: beautifulVol
            width: barraVol.width
            height: 5
            radius: 10
            color:Colors.active
            x: 0
            y: (parent.height - height) / 2
        }

        Rectangle{
            id: activeVol
            height: beautifulVol.height
            width: buttonVol.x 
            color: "white"
            y: (parent.height - height) / 2
        }

        Rectangle{
            id: buttonVol
            radius:4
            width: 5
            height:20
            y: (barraVol.height - height) /2
            x: spicetify.current.volume * barraVol.width
        }

        TapHandler{
            id: tapBar
            target: barraVol

            onSingleTapped: {
                buttonVol.x = eventPoint.position.x

                if(!pressed){
                    spicetify.sendMessage("volume -" + currentVolume())
                }
            }

        }

        DragHandler{
            id:drag
            target: buttonVol
            yAxis.enabled: false

            xAxis.maximum: barraVol.width - beautifulVol.radius
            xAxis.minimum: 0
            //arrumar pra fazer a request do volume quando soltar...
        }

    }

    function currentVolume(){
        return (activeVol.width / barraVol.width) * 100
    }
}