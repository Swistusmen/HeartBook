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
        property var corpoTags: []
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
                text: qsTr("Corporation name")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoNameInput.top
            }
            ColoredInputMulti {
                id: corpoNameInput

            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Experience")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoExperienceInput.top
            }
            ColoredInputMulti {
                id: corpoExperienceInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Social & business goals")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoGoalsInput.top
            }
            ColoredInputMulti {
                id: corpoGoalsInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Team (employees)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoTeamInput.top
            }
            ColoredInputMulti {
                id: corpoTeamInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Custom image (not supported yet)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoImageInput.top
            }
            ColoredInputMulti {
                id: corpoImageInput
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
                anchors.top: corpoContactInput.top
            }
            ColoredInputMulti {
                id: corpoContactInput
            }
        }
        Row {
            spacing: 10
            Text {
                color: styles.black
                font.pixelSize: styles.h9
                text: qsTr("Tags (separate with enter)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoTagsInput.top
            }
            ColoredInputSingle2 {
                id: corpoTagsInput

                inputField.Keys.onPressed: (event)=> {
                    if (event.key === Qt.Key_Space || event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                        container.corpoTags.push(inputField.text)
                        container.corpoTags = container.corpoTags
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
                model: container.corpoTags
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
                            container.corpoTags.splice(index, 1)
                            container.corpoTags = container.corpoTags
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
                            corpoNameInput.inputField.text,
                            corpoExperienceInput.inputField.text,
                            corpoGoalsInput.inputField.text,
                            corpoTeamInput.inputField.text,
                            container.corpoTags,
                            "qrc:/res/assets/icons/icon_company.svg",
                            corpoContactInput.inputField.text)
            }
        }
    }


    AppStyle { id: styles }
}
