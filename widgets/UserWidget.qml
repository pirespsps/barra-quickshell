import QtQuick
import Quickshell
import Quickshell.Widgets
import "../"

Rectangle{


    id: user_widget

    width: 40
    height: parent.height
    color: Colors.background

    Image{
        anchors.centerIn: parent
        width: 25
        height: 25
        source: "../icons/cat.png"
        mipmap: true
    }

    UserMenu{
        id: menu_user
        parentMouseArea: clickable_area
    }

    MouseArea{
        id:clickable_area
        anchors.fill: parent
        height:parent.height
        width: parent.width
        hoverEnabled:true

        onEntered: parent.color = Colors.active

        onExited: parent.color = Colors.background

        onPressed: {
            menu_user.visible = !menu_user.visible
        }
    }

}
