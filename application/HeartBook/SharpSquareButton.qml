import QtQuick
import HeartBook

Rectangle {
    id: root
    required property bool active//: homePage.categoryIsCompany
    required property string textContent
    property int contentSize: styles.h7
    property color textColor: styles.white
    property color idleButtonColor: styles.rose4
    property color hoveredButtonColor: styles.rose5
    property color clickedButtonColor: styles.rose6
    property color disabledButtonColor: styles.grey
    property bool fancyColors: true

    signal clicked()

    color: fancyColors ? (active ? (ma1.containsPress ? clickedButtonColor : (ma1.containsMouse ? hoveredButtonColor : idleButtonColor))
        : disabledButtonColor) : (active ? idleButtonColor : disabledButtonColor)
    implicitHeight: 75

    Text {
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: root.contentSize
        color: styles.white
        text: qsTr(root.textContent)
    }

    MouseArea {
        id: ma1
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
    }

    AppStyle { id: styles }
}
