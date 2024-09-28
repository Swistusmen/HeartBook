import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import HeartBook

Window {
    id: root
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

        ScrollablePage {
            id: scrollable
            //width: styles.pageWidthContent

            MainHeader {
                id: mainHeader
                stackLayoutRef: stackLayout
            }

            StackLayout {
                id: stackLayout
                width: styles.pageWidthContent
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                height: root.height - mainHeader.height

                Item {
                    id: homePage
                    height: parent.height
                    width: parent.width
                    property bool categoryIsCompany: true

                    SharpSquareButton {
                        textContent: "Companies listings"
                        active: homePage.categoryIsCompany
                        anchors {
                            left: parent.left
                            top: parent.top
                            right: parent.horizontalCenter
                        }
                        fancyColors: false
                        onClicked: {
                            if (!homePage.categoryIsCompany) {
                                homePage.categoryIsCompany = true
                            }
                        }
                    }
                    SharpSquareButton {
                        textContent: "Charities listings"
                        active: !homePage.categoryIsCompany
                        anchors {
                            left: parent.horizontalCenter
                            top: parent.top
                            right: parent.right
                        }
                        fancyColors: false
                        onClicked: {
                            if (homePage.categoryIsCompany) {
                                homePage.categoryIsCompany = false
                            }
                        }
                    }
                }
            }
        }

        // Item {
        //     id: pageContainer
        //     width: styles.pageWidthContent
        //     anchors {
        //         top: mainHeader.bottom
        //         bottom: parent.bottom
        //         horizontalCenter: parent.horizontalCenter
        //     }
        //     Rectangle { anchors.fill: parent; color: styles.blueDarker }

        // }
    }



    AppStyle { id: styles }
}
