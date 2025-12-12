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
        height: 5
        radius:10
        color: Colors.active

        Rectangle{
            id: activeVol
            height: barraVol.height
            width: drag.xAxis.activeValue
            color: "white"
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
            id: tap
            target: buttonVol
            //arrumar a barrinha
        }

        //checar quando largar pra fazer a request....

        DragHandler{
            id:drag
            target: buttonVol
            yAxis.enabled: false

            xAxis.maximum: barraVol.width - barraVol.radius
            xAxis.minimum: 0
        }

        //fazer outro tapHandler pra mover o drag com um só click
        
    }

    function currentVolume(){
        return 100 * activeVol.width / barraVol.width
    }
}