import QtQuick
import QtQuick.Layouts
import HeartBook

Item {
    id: root
    required property StackLayout stackLayoutRef

    anchors {
        left: parent.left
        right: parent.right
    }

    height: styles.appHeaderSectionHeight

    Rectangle {
        id: background
        anchors.fill: parent
        color: styles.rose2
        MouseArea {
            anchors.fill: parent
            onClicked: {
                forceActiveFocus()
                //console.log("Focus catched!")
            }
        }

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

            MouseArea {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: appHeaderIcon.left
                    right: headerTitle.right
                }
                onClicked: {
                    forceActiveFocus()
                    stackLayoutRef.currentIndex = 0

                }
            }

            Row {
                id: buttonsHeaderRow
                anchors {
                    //left: headerTitle.right
                    right: parent.right
                    top: parent.top
                    bottom: parent.verticalCenter
                }
                spacing: 10

                PureSquareButton {
                    id: loginButton
                    textContent: qsTr("Log in")
                    anchors {
                        verticalCenter: parent.verticalCenter
                    }

                    onClicked: {
                        // console.log("log in")
                        stackLayoutRef.currentIndex = 2
                    }
                    heightMultiplier: .8
                }
                PureSquareButton {
                    id: signupButton
                    textContent: qsTr("Sign up")
                    anchors {
                        verticalCenter: parent.verticalCenter
                    }
                    onClicked: {
                        // console.log("sign up")
                        stackLayoutRef.currentIndex = 3
                    }
                    heightMultiplier: .8
                }

            }
        }
    }
    AppStyle { id: styles }
}
