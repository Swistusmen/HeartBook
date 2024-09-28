import QtQuick
import Qt5Compat.GraphicalEffects
import HeartBook

Item {
    id: root

    required property color imageColor
    required property url imageSource

    implicitWidth: img.implicitWidth
    implicitHeight: 50

    Image {
        id: img
        height: parent.height
        source: root.imageSource

        fillMode: Image.PreserveAspectFit
        anchors {
            fill: parent
        }
    }

    ColorOverlay {
        anchors.fill: img
        source: img
        color: root.imageColor
    }
}
