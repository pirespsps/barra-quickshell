import QtQuick
import Quickshell
import "../../"

Row{
    width: parent.width
    height: parent.height

    Image{
        source: activeVol.width > 0? 
        "/home/pires/.config/quickshell/barra-quickshell/assets/icons/volume.png"
        :"/home/pires/.config/quickshell/barra-quickshell/assets/icons/mute.png"
        height: 18
        width: 18
        mipmap: true
        y: (parent.height - height) / 2
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
            x: 0 //pegar do volume do spotify...
        }

        TapHandler{
            id: tapBar
            target: barraVol

            onTapped: {
                buttonVol.x = eventPoint.position.x

                if(!pressed){
                    //if checando se soltou 
                    //faz a request

                    //FAZER A REQUEST AQUI!!!!!!!
                }
            }

        }

        DragHandler{
            id:drag
            target: buttonVol
            yAxis.enabled: false

            xAxis.maximum: barraVol.width - beautifulVol.radius
            xAxis.minimum: 0
        }

    }

    function currentVolume(){
        return 100 * activeVol.width / barraVol.width
    }
}