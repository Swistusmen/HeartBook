import QtQuick
import com.HeartBook.MiddleMan
import HeartBook


Rectangle {
    id: root
    property bool hidden: true

    height: container.height

    MouseArea {
        anchors.fill: parent
        onClicked: {
            forceActiveFocus()
        }
    }

    color: styles.greyLight

    Column {
        id: container
        anchors {
            left: parent.left
            right: parent.right
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
                text: qsTr("Tags (separate with enter)")
                verticalAlignment: Text.AlignVCenter
                anchors.top: corpoTagsInput.top
            }
            ColoredInputMulti {
                id: corpoTagsInput
                inputField.onTextChanged: console.log()
            }
        }
    }


    AppStyle { id: styles }
}
