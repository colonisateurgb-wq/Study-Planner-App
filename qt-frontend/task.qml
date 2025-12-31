Task                                                                                                                                                                                       import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property string pageTitle: "🪧 Tasks"

    // PROFESSIONAL TASKS GRADIENT BACKGROUND
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#0F172A" }
            GradientStop { position: 0.3; color: "#1E293B" }
            GradientStop { position: 0.7; color: "#1E40AF" }
            GradientStop { position: 1.0; color: "#1E3A8A" }
        }
        z: 0
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.2)
        z: 1
    }

    // Dynamic Task Model
    property var tasksModel: [
        {name: "Math Homework", time: "Today 3PM", done: false},
        {name: "Physics Notes", time: "Tomorrow 2PM", done: false}
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        z: 10

        RowLayout {
            Label {
                text: "My Tasks (" + tasksModel.length + ")";
                font.pixelSize: 24;
                font.bold: true;
                color: "#F8FAFC"
            }
            Item { Layout.fillWidth: true }
            Button {
                text: "➕ Add";
                Material.background: "#3B82F6"
                Material.foreground: "white"
                font.bold: true
                onClicked: addTaskDialog.open()
            }
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical.policy: ScrollBar.AsNeeded

            ListView {
                model: tasksModel
                delegate: Rectangle {
                    width: parent.width - 20
                    height: 72
                    radius: 12
                    color: Qt.rgba(0.95, 0.95, 0.95, 0.15)

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 16

                        // ✅ LINE 82-83 FIXED
                        CheckBox {
                            checked: modelData.done
                            Material.accent: "#10B981"
                            Material.foreground: "white"
                            onToggled: {
                                var taskIndex = index  // ListView provides index
                                tasksModel[taskIndex] = {
                                    name: tasksModel[taskIndex].name,
                                    time: tasksModel[taskIndex].time,
                                    done: checked
                                }
                            }
                        }

                        Label {
                            text: modelData.name;
                            color: modelData.done ? "#94A3B8" : "#F8FAFC";
                            font.pixelSize: 16
                            font.bold: modelData.done ? false : true
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                        }

                        Label {
                            text: modelData.time;
                            color: "#F59E0B";
                            font.pixelSize: 13
                            font.weight: Font.Medium
                        }
                    }
                }
            }
        }
    }

    // ADD TASK DIALOG (unchanged)
    Dialog {
        id: addTaskDialog
        title: "Add New Task"
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal: true

        ColumnLayout {
            anchors.fill: parent
            spacing: 16

            Label { text: "Task Name"; color: "#F8FAFC"; font.pixelSize: 16; font.weight: Font.Medium }
            TextField { id: taskNameField; placeholderText: "Enter task name..."; Material.accent: "#3B82F6" }
            Label { text: "Due Date"; color: "#F8FAFC"; font.pixelSize: 16; font.weight: Font.Medium }
            TextField { id: taskTimeField; placeholderText: "e.g. Today 3PM"; Material.accent: "#3B82F6" }
        }

        onAccepted: {
            tasksModel.push({
                name: taskNameField.text || "New Task",
                time: taskTimeField.text || "No due date",
                done: false
            })
            taskNameField.text = ""; taskTimeField.text = ""
        }
    }
}