import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../../"


Rectangle{

    required property var spicetify
    required property var action
    required property var image
    property var alternativeLogo
    property var isAlternative: false

    color: mouse.hovered? Colors.background : "transparent"
    height: 25
    width: 25
    radius: 8
    opacity: parent.opacity

    Image{
        id: imageWidget
        anchors.centerIn: parent
        source: parent.image
        height: parent.height - 6
        width: parent.width - 6
        mipmap: true
    }

    HoverHandler{
        id: mouse
        blocking: false
    }

    TapHandler {
        onTapped: {
            parent.spicetify.sendMessage(parent.action)

            if(parent.alternativeLogo != null){
                
                if(parent.isAlternative){
                    imageWidget.source = parent.image
                    isAlternative = false
                }else{
                    imageWidget.source = parent.alternativeLogo
                    isAlternative = true
                }

            }
        }
    }
}