import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    anchors.fill: parent
    property string pageTitle: "🏡 Home"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#0F766E" }
            GradientStop { position: 0.35; color: "#0E7490" }
            GradientStop { position: 0.7; color: "#1D4ED8" }
            GradientStop { position: 1.0; color: "#1E3A8A" }
        }
        z: 0
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.15)
        z: 1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        z: 10

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4

            Label {
                text: "📚 Study Planner"
                font.pixelSize: 26
                font.bold: true
                color: "#F9FAFB"
            }

            Label {
                text: "Welcome back! Let’s plan your next study session."
                font.pixelSize: 14
                color: "#E5E7EB"
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }

        GridLayout {
            Layout.fillWidth: true
            columns: 2
            columnSpacing: 14
            rowSpacing: 14

            Rectangle {
                Layout.preferredWidth: 160
                Layout.preferredHeight: 90
                radius: 16
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#22C55E" }
                    GradientStop { position: 1.0; color: "#16A34A" }
                }
                border.color: Qt.rgba(15, 118, 110, 0.6)
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 14
                    spacing: 4

                    Label {
                        text: "Today"
                        color: "#DCFCE7"
                        font.pixelSize: 12
                        opacity: 0.9
                    }
                    Label {
                        text: "3 Tasks"
                        color: "white"
                        font.pixelSize: 22
                        font.bold: true
                    }
                    Label {
                        text: "Due before midnight"
                        color: "#DCFCE7"
                        font.pixelSize: 11
                        opacity: 0.9
                    }
                }
            }

            Rectangle {
                Layout.preferredWidth: 160
                Layout.preferredHeight: 90
                radius: 16
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#3B82F6" }
                    GradientStop { position: 1.0; color: "#1D4ED8" }
                }
                border.color: Qt.rgba(37, 99, 235, 0.6)
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 14
                    spacing: 4

                    Label {
                        text: "This Week"
                        color: "#DBEAFE"
                        font.pixelSize: 12
                        opacity: 0.9
                    }
                    Label {
                        text: "5 Sessions"
                        color: "white"
                        font.pixelSize: 22
                        font.bold: true
                    }
                    Label {
                        text: "Planned study blocks"
                        color: "#DBEAFE"
                        font.pixelSize: 11
                        opacity: 0.9
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 90
            radius: 16
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#F97316" }
                GradientStop { position: 1.0; color: "#EA580C" }
            }
            border.color: Qt.rgba(248, 171, 96, 0.7)
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                ColumnLayout {
                    spacing: 4
                    Label {
                        text: "Next session"
                        color: "#FFFBEB"
                        font.pixelSize: 12
                    }
                    Label {
                        text: "Math – Algebra revision"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }
                    Label {
                        text: "Today 3:00 PM • 45 min"
                        color: "#FFEDD5"
                        font.pixelSize: 12
                    }
                }

                Item { Layout.fillWidth: true }

                Button {
                    text: "Start"
                    Layout.preferredWidth: 80
                    Material.background: "#F9FAFB"
                    Material.foreground: "#EA580C"
                    font.bold: true
                }
            }
        }

        Label {
            text: "Quick actions"
            font.pixelSize: 16
            font.bold: true
            color: "#E5E7EB"
            Layout.topMargin: 4
        }

        GridLayout {
            Layout.alignment: Qt.AlignHCenter
            columns: 2
            columnSpacing: 14
            rowSpacing: 10

            Button {
                text: "➕ New task"
                Layout.preferredWidth: 150
                Layout.preferredHeight: 46
                Material.background: "#22C55E"
                Material.foreground: "white"
                font.bold: true
            }

            Button {
                text: "📅 Plan session"
                Layout.preferredWidth: 150
                Layout.preferredHeight: 46
                Material.background: "#3B82F6"
                Material.foreground: "white"
                font.bold: true
            }

            Button {
                text: "📚 Subjects"
                Layout.preferredWidth: 150
                Layout.preferredHeight: 46
                Material.background: "#A855F7"
                Material.foreground: "white"
            }

            Button {
                text: "🤖 Ask AI"
                Layout.preferredWidth: 150
                Layout.preferredHeight: 46
                Material.background: "#0EA5E9"
                Material.foreground: "white"
            }
        }

        Item { Layout.fillHeight: true }
    }
}
