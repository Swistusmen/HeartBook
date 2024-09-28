import QtQuick
import HeartBook
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    id: root

    //required property string placeHolderText
    property color bgColor: styles.white
    property color placeHolderTextColor: styles.greyDarker
    property color inputTextColor: styles.black
    property int contentSize: styles.h8
    property int textSize: styles.h9
    property TextEdit inputField: input
    property bool isNumeric: false

    property string inputValue: input.text

    implicitWidth: 450
    //width: 100
    //width: outerBackground.width
    height: input.height * 1.2
    Rectangle {
        anchors.fill: input
        color: root.bgColor
    }


    TextEdit {
        id: input
        text: ""
        //placeholderText: root.placeHolderText
        //placeholderTextColor: root.placeHolderTextColor
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            //verticalCenter: parent.verticalCenter
            // top: parent.top
            // bottom: parent.bottom
            // centerIn: parent
            // leftMargin: styles.squareButtonRoundness
            // rightMargin: styles.squareButtonRoundness
        }
        //background: Rectangle { color: root.bgColor }
        color: root.inputTextColor
        font.pixelSize: root.textSize
        wrapMode: TextEdit.WordWrap

        // validator: IntValidator {
        //     bottom: 1
        //     top: 9999
        // }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: ShaderEffectSource {
                sourceItem: Rectangle {
                    width: input.width
                    height: input.height
                    radius: styles.squareButtonRoundness
                }
            }
        }

        Keys.onPressed: (event)=> {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Tab) {
                input.focus = false;  // Unfocus on Escape, Enter, Tab
            }
        }
        onActiveFocusChanged: {
            if (parent.activeFocus === false) {
                //console.log("Input value: " + input.text)
            }
        }
    }

    AppStyle { id: styles }
}
