import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import HeartBook
import com.HeartBook.MiddleMan
import com.HeartBook.CorpoListingModel
import Qt5Compat.GraphicalEffects

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
                    // left: parent.left
                    // right: parent.right
                }
                //height: root.height - mainHeader.height
                height: contentItem.height

                Item {
                    id: homePage
                    height: parent.height
                    width: parent.width
                    property bool categoryIsCorpo: false

                    SharpSquareButton {
                        id: homePageSwitchButton1
                        textContent: "NGOs listings"
                        active: !homePage.categoryIsCorpo
                        idleButtonColor: styles.rose2
                        anchors {
                            left: parent.left
                            top: parent.top
                            right: parent.horizontalCenter
                        }
                        fancyColors: false
                        onClicked: {
                            if (homePage.categoryIsCorpo) {
                                homePage.categoryIsCorpo = false
                                listingsStackLayout.currentIndex = 0
                            }
                        }
                    }
                    SharpSquareButton {
                        id: homePageSwitchButton2
                        textContent: "Corporation listings"
                        active: homePage.categoryIsCorpo
                        idleButtonColor: styles.rose2
                        anchors {
                            left: parent.horizontalCenter
                            top: parent.top
                            right: parent.right
                        }
                        fancyColors: false
                        onClicked: {
                            if (!homePage.categoryIsCorpo) {
                                homePage.categoryIsCorpo = true
                                listingsStackLayout.currentIndex = 1
                            }
                        }
                    }
                    StackLayout {
                        id: listingsStackLayout
                        anchors {
                            top: homePageSwitchButton1.bottom
                            left: parent.left
                            right: parent.right
                            //bottom: parent.bottom
                        }
                        height: contentItem.height

                        Item {
                            Rectangle {
                                id: ngoTopSec
                                color: styles.greyLight
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                    top: parent.top
                                }
                                height: 100
                                MouseArea { anchors.fill: parent; onClicked: forceActiveFocus() }

                                PureSquareButton {
                                    textContent: ngoListingCreator.hidden ? "Create a NGO listing"
                                        : "Cancel"
                                    anchors {
                                        left: parent.left
                                        verticalCenter: parent.verticalCenter
                                        leftMargin: 30
                                    }
                                    onClicked: {
                                        ngoListingCreator.hidden = !ngoListingCreator.hidden
                                        //console.log("feature is now: " + corpopListingCreator.hidden)
                                    }
                                }
                            }
                            Item {
                                id: ngoCreatorSection
                                anchors {
                                    top: ngoTopSec.bottom
                                    left: parent.left
                                    right: parent.right
                                }
                                z: 1

                                NGOListingCreator {
                                    id: ngoListingCreator
                                    anchors {
                                        left: parent.left
                                        right: parent.right
                                        top: parent.top
                                    }
                                    visible: hidden ? false : true
                                }
                            }
                            ListView {
                                id: ngoListView
                                anchors {
                                    top: ngoTopSec.bottom
                                    left: parent.left
                                    right: parent.right
                                    bottom: parent.bottom
                                    bottomMargin: 250
                                }
                                //Rectangle { anchors.fill: parent; color: styles.redDefault }
                                model: CorpoListingModel
                                spacing: 20
                                clip: true
                                delegate: Item {
                                    id: ngoListing

                                    required property string corpoName
                                    required property string corpoExperience
                                    required property string corpoGoals
                                    required property string corpoTeam
                                    required property var corpoTags
                                    required property url corpoImage
                                    required property string corpoContact
                                    height: 200
                                    width: styles.pageWidthContent

                                    Rectangle {
                                        anchors.fill: parent
                                        color: styles.rose6
                                        radius: styles.squareButtonRoundness
                                        Image {
                                            id: ngoPreviewImg
                                            anchors {
                                                top: parent.top
                                                bottom: parent.bottom
                                                left: parent.left
                                                margins: 15
                                            }
                                            width: 300
                                            source: ngoListing.corpoImage
                                            fillMode: Image.PreserveAspectCrop

                                            layer.enabled: true
                                            layer.effect: OpacityMask {
                                                maskSource: ShaderEffectSource {
                                                    sourceItem: Rectangle {
                                                        width: ngoPreviewImg.width
                                                        height: ngoPreviewImg.height
                                                        radius: styles.squareButtonRoundness
                                                    }
                                                }
                                            }
                                        }
                                        Text {
                                            id: ngoNamePreview
                                            anchors {
                                                top: parent.top
                                                left: ngoPreviewImg.right
                                                margins: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.bold: true
                                            font.pixelSize: styles.h6
                                            text: ngoListing.corpoName
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            id: ngoExperiencePreview
                                            anchors {
                                                top: ngoNamePreview.bottom
                                                left: ngoPreviewImg.right
                                                leftMargin: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.pixelSize: styles.h9
                                            text: "Experience: " + ngoListing.corpoExperience
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            id: ngoGoalsPreview
                                            anchors {
                                                top: ngoExperiencePreview.bottom
                                                left: ngoPreviewImg.right
                                                leftMargin: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.pixelSize: styles.h9
                                            text: "Our goals: " + ngoListing.corpoGoals
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            id: ngoTeamPreview
                                            anchors {
                                                top: ngoGoalsPreview.bottom
                                                left: ngoPreviewImg.right
                                                leftMargin: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.pixelSize: styles.h9
                                            text: "Our team: " + ngoListing.corpoTeam
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            id: ngoTagsPreview
                                            anchors {
                                                top: ngoTeamPreview.bottom
                                                left: ngoPreviewImg.right
                                                leftMargin: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.pixelSize: styles.h10
                                            text: "Tags: " + ngoListing.corpoTags
                                            elide: Text.ElideRight
                                        }
                                        Text {
                                            id: ngoContactPreview
                                            anchors {
                                                top: ngoTagsPreview.bottom
                                                left: ngoPreviewImg.right
                                                leftMargin: 15
                                                right: parent.right
                                            }
                                            color: styles.black
                                            font.pixelSize: styles.h10
                                            text: "Contact us: " + ngoListing.corpoContact
                                            elide: Text.ElideRight
                                        }
                                    }
                                }
                            }
                        }
                        Item {


                            Rectangle {
                                id: corpoTopSec
                                color: styles.greyLight
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                    top: parent.top
                                }
                                height: 100

                                PureSquareButton {
                                    textContent: "Create a Corporate listing"
                                    anchors {
                                        left: parent.left
                                        verticalCenter: parent.verticalCenter
                                        leftMargin: 30
                                    }
                                }
                            }
                        }
                    }
                }

                Item {
                    id: detailsPage
                    Rectangle { anchors.fill: parent; color: styles.redDefault }
                }
                Item {
                    id: loginPage

                    Rectangle {
                        color: styles.greyLight
                        anchors {
                            centerIn: parent
                        }
                        width: parent.width * .6
                        height: parent.height * .8
                        radius: styles.squareButtonRoundness

                    }

                    Text {
                        id: loginPageTitleText
                        anchors {
                            bottom: loginPageEmailInput.top
                            horizontalCenter: parent.horizontalCenter
                            bottomMargin: 50
                        }
                        font.pixelSize: styles.h5
                        color: styles.black
                        text: qsTr("Log in to HeartBook")
                    }

                    Text {
                        id: loginPageEmailText
                        anchors {
                            right: loginPageEmailInput.left
                            verticalCenter: loginPageEmailInput.verticalCenter
                            rightMargin: 20
                        }
                        font.pixelSize: styles.h7
                        text: qsTr("Email")
                        color: styles.black
                    }

                    ColoredInputSingle {
                        id: loginPageEmailInput
                        anchors {
                            left: parent.horizontalCenter
                            bottom: parent.verticalCenter
                        }
                        width: 200
                    }
                    Text {
                        id: loginPagePasswordText
                        anchors {
                            right: loginPagePasswordInput.left
                            verticalCenter: loginPagePasswordInput.verticalCenter
                            rightMargin: 20
                        }
                        font.pixelSize: styles.h7
                        text: qsTr("Password")
                        color: styles.black
                    }

                    ColoredInputSingle {
                        id: loginPagePasswordInput
                        anchors {
                            left: parent.horizontalCenter
                            top: parent.verticalCenter
                        }
                        width: 200
                    }

                    PureSquareButton {
                        id: loginPageSubmitButton
                        anchors {
                            top: loginPagePasswordInput.bottom
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 30
                        }
                        textContent: "Log in"

                        onClicked: {
                            MiddleMan.sendLoginRequest(loginPageEmailInput.inputField.text, loginPagePasswordInput.inputField.text)
                            stackLayout.currentIndex = 0
                        }
                    }


                }
                Item {
                    id: signupPage

                    Rectangle {
                        color: styles.greyLight
                        anchors {
                            centerIn: parent
                        }
                        width: parent.width * .6
                        height: parent.height * .8
                        radius: styles.squareButtonRoundness

                    }

                    Text {
                        id: signupPageTitleText
                        anchors {
                            bottom: signupPageEmailInput.top
                            horizontalCenter: parent.horizontalCenter
                            bottomMargin: 50
                        }
                        font.pixelSize: styles.h5
                        color: styles.black
                        text: qsTr("Sign up to HeartBook")
                    }

                    Text {
                        id: signupPageEmailText
                        anchors {
                            right: signupPageEmailInput.left
                            verticalCenter: signupPageEmailInput.verticalCenter
                            rightMargin: 20
                        }
                        font.pixelSize: styles.h7
                        text: qsTr("Email")
                        color: styles.black
                    }

                    ColoredInputSingle {
                        id: signupPageEmailInput
                        anchors {
                            left: parent.horizontalCenter
                            bottom: parent.verticalCenter
                        }
                        width: 200
                    }
                    Text {
                        id: signupPagePasswordText
                        anchors {
                            right: signupPagePasswordInput.left
                            verticalCenter: signupPagePasswordInput.verticalCenter
                            rightMargin: 20
                        }
                        font.pixelSize: styles.h7
                        text: qsTr("Password")
                        color: styles.black
                    }

                    ColoredInputSingle {
                        id: signupPagePasswordInput
                        anchors {
                            left: parent.horizontalCenter
                            top: parent.verticalCenter
                        }
                        width: 200
                    }

                    PureSquareButton {
                        id: signupPageSubmitButton
                        anchors {
                            top: signupPagePasswordInput.bottom
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 30
                        }
                        textContent: "Sign up now"

                        onClicked: {
                            MiddleMan.sendSignupRequest(signupPageEmailInput.inputField.text, signupPagePasswordInput.inputField.text)
                            stackLayout.currentIndex = 0
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
