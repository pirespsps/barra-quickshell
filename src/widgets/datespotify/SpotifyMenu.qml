import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../"

PanelWindow {

    Spicetify {
        id: spicetify
    }

    required property var parentMouseArea
    required property var parentHeight

    property bool isVisible: false

    id: panel
    visible: isVisible
    color: "transparent"
    exclusiveZone: 0

    anchors {
        bottom: true
        right: true
    }

    margins {
        bottom: mouse.hovered ? 0 : parentHeight
    }

    width: 500
    height: mouse.hovered ? 200 : 200 - parentHeight

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: Colors.background
        opacity: 0.8
        topRightRadius: 20
        topLeftRadius: 20

        Rectangle{
            width: parent/2
            height: parent.height
            color: Colors.active
        }

    }

    HoverHandler {
        id: mouse
        blocking: false
        target: panel

        onHoveredChanged: {
            panel.isVisible = mouse.hovered
        }
    }
}
