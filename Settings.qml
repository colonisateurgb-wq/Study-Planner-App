import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property string pageTitle: "⚙ Settings"

    
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#F59E0B" }
            GradientStop { position: 0.3; color: "#D97706" }
            GradientStop { position: 0.7; color: "#92400E" }
            GradientStop { position: 1.0; color: "#7C2D12" }
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

        
        Label {
            text: "Account Settings"
            font.pixelSize: 26
            font.bold: true
            color: "#F8FAFC"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            radius: 16

            // ✅ LINE 47 FIXED - Simple Gradient
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FCD34D" }
                GradientStop { position: 1.0; color: "#F59E0B" }
            }

            border.color: "#FBBF24"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24

                RowLayout {
                    Label {
                        text: "👤 John Doe"
                        font.pixelSize: 22
                        font.bold: true
                        color: "#1F2937"
                    }
                    Item { Layout.fillWidth: true }
                    Button {
                        text: "Edit Profile"
                        Material.background: "#F59E0B"
                        Material.foreground: "white"
                        flat: true
                        font.bold: true
                    }
                }

                Label {
                    text: "john.doe@Ictuniversity.edu.cm"
                    font.pixelSize: 16
                    color: "#6B7280"
                }

                Label {
                    text: "Yaoundé, Cameroon"
                    font.pixelSize: 19
                    color: "#9CA3AF"
                }
            }
        }

        Label {
            text: "App Settings"
            font.pixelSize: 20
            font.bold: true
            color: "#F8FAFC"
            Layout.topMargin: 20
        }

        // Dark Mode Toggle
        Rectangle {
            Layout.fillWidth: true
            height: 65
            radius: 12
            color: Qt.rgba(1,1,1,0.15)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20

                Label {
                    text: "🌙 Dark Mode"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#F8FAFC"
                }
                Item { Layout.fillWidth: true }
                Switch {
                    Material.accent: "#F59E0B"
                }
            }
        }

        // Notifications Toggle
        Rectangle {
            Layout.fillWidth: true
            height: 65
            radius: 12
            color: Qt.rgba(1,1,1,0.15)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20

                Label {
                    text: "🔔 Task Notifications"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#F8FAFC"
                }
                Item { Layout.fillWidth: true }
                Switch {
                    Material.accent: "#10B981"
                }
            }
        }

        // Study Reminders
        Rectangle {
            Layout.fillWidth: true
            height: 65
            radius: 12
            color: Qt.rgba(1,1,1,0.15)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20

                Label {
                    text: "⏰ Study Reminders"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#F8FAFC"
                }
                Item { Layout.fillWidth: true }
                Switch {
                    Material.accent: "#3B82F6"
                }
            }
        }

        Item { Layout.fillHeight: true }

        // DANGER ZONE - LOGOUT
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            radius: 12

            // ✅ LINE 188 area - Simple gradient
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#EF4444" }
                GradientStop { position: 1.0; color: "#DC2626" }
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20

                Label {
                    text: "🚪 Logout"
                    font.pixelSize: 18
                    font.bold: true
                    color: "white"
                }
                Item { Layout.fillWidth: true }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: logoutDialog.open()
            }
        }
    }

    // ✅ LINE 188 FIXED - Proper Dialog
    Dialog {
        id: logoutDialog
        title: "Sign Out?"
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal: true

        ColumnLayout {
            anchors.fill: parent
            spacing: 16

            Label {
                text: "Are you sure you want to log out?"
                font.pixelSize: 16
                color: "#1E2937"
            }
        }

        onAccepted: {
            console.log("Logging out...")
            // Navigate to LoginPage.qml later
        }
    }
}
