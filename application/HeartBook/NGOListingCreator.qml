import QtQuick
import com.HeartBook.MiddleMan
import HeartBook
import com.HeartBook.CorpoListingModel


Rectangle {
    id: root
    property bool hidden: true

    height: container.height * 1.2

    MouseArea {
        anchors.fill: parent
        onClicked: {
            forceActiveFocus()
        }
    }

    color: styles.greyLight

    Column {
        id: container
        property var ngoTags: []
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 25
        }
        spacing: 15
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("NGO name")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoNameInput.top
            }
            ColoredInputMulti {
                id: ngoNameInput

            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Experience")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoExperienceInput.top
            }
            ColoredInputMulti {
                id: ngoExperienceInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Social & business goals")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoGoalsInput.top
            }
            ColoredInputMulti {
                id: ngoGoalsInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Team (employees)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoTeamInput.top
            }
            ColoredInputMulti {
                id: ngoTeamInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Custom image")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoImageInput.top
            }
            ColoredInputMulti {
                id: ngoImageInput
                inputField.enabled: false
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Contact information")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoContactInput.top
            }
            ColoredInputMulti {
                id: ngoContactInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Tags (separate with enter)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: ngoTagsInput.top
            }
            ColoredInputSingle2 {
                id: ngoTagsInput

                inputField.Keys.onPressed: (event)=> {
                    if (event.key === Qt.Key_Space || event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                        container.ngoTags.push(inputField.text)
                        container.ngoTags = container.ngoTags
                        inputField.text = ""
                    }
                }
            }
        }
        Flow {
            anchors {
                left: parent.left
                right: parent.right
            }

            spacing: 10  // Set the spacing between elements

            Repeater {
                model: container.ngoTags
                // delegate: PureSquareButton {
                //     textContent: modelData
                //     contentSize: styles.h10
                // }

                delegate: Rectangle {
                    width: tagText.implicitWidth + 10
                    height: 15
                    radius: 3
                    color: styles.rose5
                    Text {
                        id: tagText
                        text: modelData
                        font.pixelSize: styles.h10
                        wrapMode: Text.WordWrap
                        color: styles.black
                        // Size based on content
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 5
                            horizontalCenter: parent.horizontalCenter
                            //verticalCenter: parent.verticalCenter
                        }
                        width: implicitWidth
                        // height: implicitHeight
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            container.ngoTags.splice(index, 1)
                            container.ngoTags = container.ngoTags
                        }

                    }
                }
            }
        }

        PureSquareButton {
            textContent: "Post new listing"
            contentSize: styles.h8
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                CorpoListingModel.addCorpoListing(
                            ngoNameInput.inputField.text,
                            ngoExperienceInput.inputField.text,
                            ngoGoalsInput.inputField.text,
                            ngoTeamInput.inputField.text,
                            container.ngoTags,
                            "qrc:/res/assets/icons/icon_company.svg",
                            ngoContactInput.inputField.text)
            }
        }
    }


    AppStyle { id: styles }
}
