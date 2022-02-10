import QtQuick 2.15

Rectangle {
    id: editRectangle

    property alias myText: myTextEdit.text
    property var setPriority
    property bool focusTextEdit: false
    property bool password: false

    color: "white"
    width: 250
    height: 40
    border.color: "black"
    border.width: myTextEdit.focus ? 3 : 2

    TextInput {
        id: myTextEdit
        focus: editRectangle.focusTextEdit
        width: 240
        height: 34
        x:5; y:3
        font.pixelSize: 25
        Keys.forwardTo: setPriority()

        activeFocusOnPress: true
        onFocusChanged: editRectangle.focusTextEdit = focus

        property int maximumLength: 12
        property string previousText: text

        onTextChanged: {
            if (text.length > maximumLength) {
                var cursor = cursorPosition;
                text = previousText;
                if (cursor > text.length) {
                    cursorPosition = text.length;
                } else {
                    cursorPosition = cursor-1;
                }
            }
            previousText = text
        }
        wrapMode: TextEdit.Wrap

        echoMode: password ? TextInput.Password : TextInput.Normal

    }
}
