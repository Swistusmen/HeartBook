import QtQuick
import QtQuick.Controls
import HeartBook

Item {
    //required property StackView stackViewRef

    anchors {
        left: parent.left
        right: parent.right
    }

    height: styles.appHeaderSectionHeight

    Rectangle {
        id: background
        anchors.fill: parent
        color: styles.rose2

        Item {
            id: headerContent
            width: styles.pageWidthContent
            anchors {
                top: parent.top
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }

            ColoredIcon {
                id: appHeaderIcon
                imageColor: styles.white
                imageSource: "qrc:/res/assets/icons/icon_heart_give.svg"
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height * .6
            }

            Text {
                id: headerTitle
                text: qsTr("HeartBook")
                color: styles.white
                font.pixelSize: styles.h5
                anchors {
                    left: appHeaderIcon.right
                    verticalCenter: parent.verticalCenter
                }
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            Row {
                id: buttonsHeaderRow
                anchors {
                    left: headerTitle.right
                    right: parent.right
                    top: parent.top
                    bottom: parent.verticalCenter
                }

                PureSquareButton {
                    id: loginButton
                    textContent: qsTr("Log in")
                    onClicked: console.log("log in")
                    heightMultiplier: .8
                }
                Rectangle {
                    width: 600
                    height: 100
                    color: styles.white
                    Row {
                        anchors.fill: parent
                        Rectangle { width: 75; height: 75; color: styles.rose1 }
                        Rectangle { width: 75; height: 75; color: styles.rose2 }
                        Rectangle { width: 75; height: 75; color: styles.rose3 }
                        Rectangle { width: 75; height: 75; color: styles.rose4 }
                        Rectangle { width: 75; height: 75; color: styles.rose5 }
                        Rectangle { width: 75; height: 75; color: styles.rose6 }
                    }
                }
            }
        }

    }
    AppStyle { id: styles }
}
