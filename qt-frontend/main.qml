import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 700
    title: qsTr("Mobi_StudyPlanner")

    Material.theme: Material.Light
    Material.primary: Material.Blue
    Material.accent: Material.Orange

    // Main gradient background
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#1E3A8A" }
            GradientStop { position: 1.0; color: "#0F172A" }
        }
        z: 0
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.3)
        z: 1
    }

    // MAIN CONTENT - VISIBLE ONLY ON START
    ColumnLayout {
        id: mainContent
        anchors.fill: parent
        anchors.margins: 30
        spacing: 25
        z: 3

        // Show only when on main page
        visible: !stackView.currentItem || stackView.currentItem === initialPage

        Label {
            Layout.alignment: Qt.AlignCenter
            text: "📚 Study Planner"
            font.pixelSize: 32
            font.bold: true
            color: "white"
        }

        // AI Assistant Card
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 280
            Layout.preferredHeight: 80
            radius: 15
            color: Qt.rgba(0.1, 0.5, 1, 0.2)
            border.color: "#2196F3"
            border.width: 2

            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                Label {
                    text: "🤖 AI Assistant"
                    font.pixelSize: 20
                    font.bold: true
                    color: "white"
                }
                Item { Layout.fillWidth: true }
                Label {
                    text: "New!"
                    font.pixelSize: 12
                    color: "#4CAF50"
                    background: Rectangle {
                        width: 30; height: 20
                        radius: 10
                        color: Qt.rgba(0.76, 0.95, 0.76, 0.8)
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("AIAssistantPage.qml"))
                }
            }
        }

        // Main Navigation Grid
        GridLayout {
            Layout.alignment: Qt.AlignCenter
            columns: 2
            columnSpacing: 20
            rowSpacing: 15

            Button {
                text: "🏡 Home"
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                font.pixelSize: 16
                Material.background: "#BBDEFB"
                Material.foreground: "#1976D2"
                onClicked: stackView.replace(stackView.currentItem, Qt.resolvedUrl("Main.qml"))
            }

            Button {
                text: "🪧 Tasks"
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                font.pixelSize: 16
                Material.background: "#BBDEFB"
                Material.foreground: "#1976D2"
                onClicked: stackView.replace(stackView.currentItem, Qt.resolvedUrl("Task.qml"))
            }

            Button {
                text: "🎞️ Schedule"
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                font.pixelSize: 16
                Material.background: "#BBDEFB"
                Material.foreground: "#1976D2"
                onClicked: stackView.replace(stackView.currentItem, Qt.resolvedUrl("SchedulePage.qml"))
            }

            Button {
                text: "📑 Subjects"
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                font.pixelSize: 16
                Material.background: "#BBDEFB"
                Material.foreground: "#1976D2"
                onClicked: stackView.replace(stackView.currentItem, Qt.resolvedUrl("Subject.qml"))
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter
            spacing: 15
            Button {
                text: "⚙️ Settings"
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
                font.pixelSize: 16
                Material.foreground: "#FF9800"
                Material.background: "#FFF3E0"
                onClicked: stackView.replace(stackView.currentItem, Qt.resolvedUrl("Settings.qml"))
            }
        }
    }

    header: ToolBar {
        z: 100
        Material.theme: Material.Dark
        background: Rectangle { color: "#111325"; opacity: 0.95 }

        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: "☰"
                onClicked: drawer.open()
                Material.foreground: "white"
            }
            Label {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                text: stackView.currentItem && stackView.currentItem.hasOwnProperty("pageTitle")
                      ? stackView.currentItem.pageTitle : "Study Planner"
                color: "white"
                font.pixelSize: 18
                font.bold: true
            }
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.7
        height: window.height
        z: 200

        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            Label {
                text: "Navigation"
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }

            Button {
                text: "🏠 Main Menu"
                width: parent.width
                Material.background: "#3B82F6"
                Material.foreground: "white"
                onClicked: {
                    mainContent.visible = true
                    stackView.clear()
                    drawer.close()
                }
            }

            Button {
                text: "🤖 AI Assistant"
                width: parent.width
                Material.background: "#2196F3"
                Material.foreground: "white"
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("AIAssistantPage.qml"))
                    drawer.close()
                }
            }

            Button {
                text: "🏡 Home"
                width: parent.width
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("Main.qml"))
                    drawer.close()
                }
            }

            Button {
                text: "🪧 Tasks"
                width: parent.width
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("Task.qml"))
                    drawer.close()
                }
            }

            Button {
                text: "🎞️ Schedule"
                width: parent.width
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("SchedulePage.qml"))
                    drawer.close()
                }
            }

            Button {
                text: "📑 Subjects"
                width: parent.width
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("Subject.qml"))
                    drawer.close()
                }
            }

            Button {
                text: "⚙️ Settings"
                width: parent.width
                onClicked: {
                    stackView.replace(stackView.currentItem, Qt.resolvedUrl("Settings.qml"))
                    drawer.close()
                }
            }
        }

        background: Rectangle {
            color: "#111325"
            opacity: 0.98
        }
    }

    property Item initialPage: null

    StackView {
        id: stackView
        anchors.fill: parent
        anchors.topMargin: window.header.height
        z: 4
        initialItem: Item {
            Component.onCompleted: initialPage = this
        }
    }
}
