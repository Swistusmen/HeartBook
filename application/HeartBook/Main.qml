import QtQuick
import QtQuick.Controls
import HeartBook

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("HeartBook")

    minimumWidth: styles.pageWidthContent
    minimumHeight: minimumWidth / 2


    Rectangle {
        id: background

        color: styles.white
        anchors.fill: parent

        MainHeader {
            id: mainHeader
        }
    }



    AppStyle { id: styles }
}
