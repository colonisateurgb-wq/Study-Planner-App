subject                                                                                          import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property string pageTitle: "📑 Subjects"

    // Professional Subjects gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#7C3AED" }
            GradientStop { position: 0.4; color: "#5B21B6" }
            GradientStop { position: 0.8; color: "#3730A3" }
            GradientStop { position: 1.0; color: "#312E81" }
        }
        z: 0
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.25)
        z: 1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 25
        z: 10

        // Header
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: "  👤My Subjects";
                font.pixelSize: 24;
                font.bold: true;
                color: "#F8FAFC"
            }
            Item { Layout.fillWidth: true }
            Button {
                text: "➕ Add Subject";
                Material.background: "#8B5CF6";
                Material.foreground: "white";
                font.bold: true
            }
        }

        // Subjects List
        ScrollView {
            Layout.fillWidth: true
            Layout.preferredHeight: 200

            Column {
                width: parent.width
                spacing: 12

                Repeater {
                    model: [
                        {name: "Software Eng", progress: "45%", pastQuestions: 5},
                        {name: "Probability & Statistics", progress: "32%", pastQuestions: 3},
                        {name: "Python Programming", progress: "92%", pastQuestions: 6},
                        {name: "Java Programming", progress: "85%", pastQuestions: 4}
                    ]

                    delegate: Rectangle {
                        width: parent.width
                        height: 85
                        radius: 14

                        // ✅ LINE 73 FIXED - Proper gradient Rectangle
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#A78BFA" }
                            GradientStop { position: 1.0; color: "#8B5CF6" }
                        }

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 16

                            RowLayout {
                                Label {
                                    text: "📚 " + modelData.name;
                                    font.pixelSize: 18;
                                    font.bold: true;
                                    color: "white"
                                }
                                Item { Layout.fillWidth: true }
                                Label {
                                    text: modelData.progress;
                                    color: "#10B981";
                                    font.pixelSize: 14;
                                    font.weight: Font.Medium
                                }
                            }

                            Label {
                                text: "Past Questions: " + modelData.pastQuestions;
                                color: "#E2E8F0";
                                font.pixelSize: 13
                            }

                            Button {
                                text: "View Past Questions"
                                Layout.alignment: Qt.AlignRight
                                Material.background: "transparent"
                                Material.foreground: "white"
                                flat: true
                                font.pixelSize: 12
                            }
                        }
                    }
                }
            }
        }

        // PAST QUESTIONS SECTION
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            radius: 12

            // ✅ LINE 73 FIXED - Simple gradient
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "#F59E0B" }
                GradientStop { position: 1.0; color: "#D97706" }
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20

                Label {
                    text: "📜 Past Questions Archive"
                    font.pixelSize: 18
                    font.bold: true
                    color: "white"
                }

                Item { Layout.fillWidth: true }

                Label {
                    text: "42 Files"
                    font.pixelSize: 14
                    color: "white"
                    font.weight: Font.Medium
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: pastQuestionsDialog.open()
            }
        }

        // Quick Access Buttons
        GridLayout {
            columns: 2
            Layout.alignment: Qt.AlignHCenter
            columnSpacing: 15
            rowSpacing: 12

            Button {
                text: "📥 Download All"
                Layout.preferredWidth: 140
                Material.background: "#10B981"
                Material.foreground: "white"
            }

            Button {
                text: "📝 Practice Quiz"
                Layout.preferredWidth: 140
                Material.background: "#3B82F6"
                Material.foreground: "white"
            }
        }
    }

    // ✅ LINE 126 FIXED - Simple Dialog
    Dialog {
        id: pastQuestionsDialog
        title: "Past Questions Archive"
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal: true

        ColumnLayout {
            anchors.fill: parent
            spacing: 16

            Label {
                text: "Select Subject Past Papers"
                font.pixelSize: 18
                font.bold: true
                color: "#1E293B"
            }

            GridLayout {
                columns: 2
                rowSpacing: 10
                columnSpacing: 15
                Layout.fillWidth: true

                Repeater {
                    model: ["Math 2024", "Physics 2023", "Chem Q1", "English Midterm"]
                    Button {
                        text: modelData
                        Layout.preferredWidth: 120
                        Material.background: Qt.rgba(0.9, 0.9, 0.9, 0.9)
                        Material.foreground: "#1E293B"
                        onClicked: console.log("Opening: " + modelData)
                    }
                }
            }
        }
    }
}