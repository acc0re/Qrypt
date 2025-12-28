import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow {
    width: 380
    height: 520
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    visible: true
    title: "Qrypt"
    Material.theme: Material.Light
    Material.accent: Material.Blue

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        Label {
            text: "Qrypt"
            font.pixelSize: 22
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Frame {
            Layout.fillWidth: true
            padding: 20

            ColumnLayout {
                spacing: 16

                Label {
                    text: "Length: " + Math.round(lengthSlider.value)
                    font.pixelSize: 14
                }

                Slider {
                    id: lengthSlider
                    from: 6
                    to: 32
                    value: 16
                    stepSize: 1
                    Layout.fillWidth: true
                }

                GridLayout {
                    columns: 2
                    columnSpacing: 12
                    rowSpacing: 8

                    CheckBox { id: upper; text: "Uppercase letters"; checked: true }
                    CheckBox { id: lower; text: "Lowercase letters"; checked: true }
                    CheckBox { id: numbers; text: "Numbers"; checked: true }
                    CheckBox { id: symbols; text: "Special characters"; checked: true }
                }

                Button {
                    text: "Generate"
                    Layout.fillWidth: true
                    onClicked: {
                        passwordField.text =
                            passwordGenerator.generate(
                                Math.round(lengthSlider.value),
                                upper.checked,
                                lower.checked,
                                numbers.checked,
                                symbols.checked
                            )
                    }
                }
            }
        }

        Frame {
            Layout.fillWidth: true
            padding: 16

            RowLayout {
                spacing: 12
                Layout.fillWidth: true

                TextField {
                    id: passwordField
                    Layout.fillWidth: true
                    Layout.preferredWidth: 220
                    readOnly: true
                    placeholderText: "Password"
                    font.family: "monospace"
                    font.pixelSize: 12
                    wrapMode: Text.Wrap
                    selectByMouse: true
                }

                Button {
                    text: "⧉"

                    ToolTip.visible: hovered
                    ToolTip.text: "Copy to clipboard"
                    onClicked: {
                        if (passwordField.text.length > 0)
                            Qt.application.clipboard.setText(passwordField.text)
                    }
                }
            }
        }

        Label {
            text: "© 2025 Alexander Chabowski"
            font.pixelSize: 12
            Layout.alignment: Qt.AlignRight
        }

        Item { Layout.fillHeight: true }
    }
}
