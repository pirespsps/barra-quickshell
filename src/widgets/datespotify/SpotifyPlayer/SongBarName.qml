import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import "../../../"

PanelWindow{
    required property bool isActive
    required property var barra
    required property var text

    id: root
    //visible: isActive
    width: 275
    height: parent.height
    color: "transparent"
    anchors{
        bottom: true
        left: true
    }

    margins.left: (parent.width + width) / 2
    //exclusionMode: ExclusionMode.Ignore

    Text{
        text: root.text
        color: Colors.foreground
        font.pixelSize: 14
        width: parent.width
        y: (parent.height - height) / 2
        elide: Text.ElideRight
    }
}