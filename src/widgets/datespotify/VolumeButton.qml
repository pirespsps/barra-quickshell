import QtQuick
import Quickshell
import "../../"

Row{
    width: parent.width
    height: parent.height

    //Image{
    //    anchors.centerIn: parent
    //    source: "/home/pires/.config/quickshell/barra-quickshell/assets/icons/volume.png"
    //    height: 15
    //    width: 15
    //    mipmap: true
    //}

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
            width: handler.xAxis.activeValue
            color: "white"
        }

        Rectangle{
            id: buttonVol
            radius:4
            width: 5
            height:20
            y: (barraVol.height - height) /2
            x: 0
        }

        DragHandler{
            id:handler
            target: buttonVol
            yAxis.enabled: false
            xAxis.maximum: barraVol.width - barraVol.radius
            xAxis.minimum: 0

        }
        
    }
}