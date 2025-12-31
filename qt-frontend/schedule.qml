schedule.qml                                                                                                                                                                                 import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    anchors.fill: parent
    property string pageTitle: "📅 Schedule"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#0F172A" }
            GradientStop { position: 0.35; color: "#0E7490" }
            GradientStop { position: 0.75; color: "#4F46E5" }
            GradientStop { position: 1.0; color: "#1E293B" }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 18

        Label {
            text: "This Week"
            color: "white"
            font.pixelSize: 26
            font.bold: true
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Rectangle {
                Layout.fillWidth: true
                height: 70
                radius: 18
                color: "#0B1120"
                opacity: 0.9
                border.color: "#22C55E"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 14
                    spacing: 4

                    Label {
                        text: "Today"
                        color: "#A5B4FC"
                        font.pixelSize: 14
                        font.bold: true
                    }

                    Label {
                        text: "3 classes • 2 study blocks"
                        color: "#E5E7EB"
                        font.pixelSize: 13
                    }
                }
            }

            Rectangle {
                width: 60
                height: 70
                radius: 18
                color: "#0B1120"
                opacity: 0.9
                border.color: "#38BDF8"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 2

                    Label {
                        text: "Wed"
                        color: "#F9FAFB"
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Label {
                        text: "31"
                        color: "#38BDF8"
                        font.pixelSize: 18
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter
                        width: 8
                        height: 8
                        radius: 4
                        color: "#22C55E"
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 220
            radius: 22
            color: "#0F172A"
            opacity: 0.85

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 10

                RowLayout {
                    Layout.fillWidth: true

                    Label {
                        text: "Weekly Timetable"
                        color: "#E5E7EB"
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Item { Layout.fillWidth: true }

                    Button {
                        text: "Add slot"
                        font.pixelSize: 12
                        Material.foreground: "white"
                        padding: 6

                        background: Rectangle {
                            radius: 999
                            color: "#22C55E"
                        }
                    }
                }

                GridView {
                    id: grid
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cellWidth: 90
                    cellHeight: 64
                    model: 8
                    clip: true

                    delegate: Rectangle {
                        width: grid.cellWidth - 8
                        height: grid.cellHeight - 8
                        radius: 14
                        color: index % 2 === 0 ? "#0F766E" : "#4F46E5"
                        border.color: "#111827"
                        border.width: 1
                        opacity: 0.85

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 2

                            Label {
                                text: index % 2 === 0 ? "Python Revision" : "CA Revision"
                                color: "white"
                                font.pixelSize: 13
                                elide: Text.ElideRight
                            }

                            Label {
                                text: index % 2 === 0 ? "16:00 - 17:30" : "09:00 - 11:00"
                                color: "#E5E7EB"
                                font.pixelSize: 11
                            }

                            Label {
                                text: index % 2 === 0 ? "Desk • Quiet" : "Campus • Room 204"
                                color: "#9CA3AF"
                                font.pixelSize: 10
                                elide: Text.ElideRight
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            radius: 20
            color: "#0F172A"
            opacity: 0.9
            height: 90

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 16

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4

                    Label {
                        text: "Next focus block"
                        color: "#A5B4FC"
                        font.pixelSize: 13
                    }

                    Label {
                        text: "Deep work • 19:00 - 21:00"
                        color: "#F9FAFB"
                        font.pixelSize: 15
                        font.bold: true
                    }

                    Label {
                        text: "2 hours of distraction-free study"
                        color: "#9CA3AF"
                        font.pixelSize: 12
                    }
                }

                Button {
                    text: "Start"
                    Layout.preferredWidth: 90
                    Layout.alignment: Qt.AlignVCenter
                    font.pixelSize: 14
                    Material.foreground: "white"

                    background: Rectangle {
                        radius: 999
                        color: "#22C55E"
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }
    }
}