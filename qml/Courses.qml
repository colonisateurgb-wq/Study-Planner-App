import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    visible:true
    width:400
    height:600
    title:"My Courses"

    Column{
        anchors.fill:parent
        spacing:10
        padding:20

        Text{
            text:"My Courses"
            font.pointsize:22
            font.bold:true
        }
        ListView {
            width:parent.width
            height:450
            model:[
                "Introduction to Software Engineering", "Probability and Statistics", "Computer Organization and Architechture", "Java Programming I", "Python Programming I", "Technical Writing for Computer Engineers"
            ]

            delegate: Rectangle{
                width:parent.width
                height:50
                radius:8
                color:"blue"
                border.color:"blue"
                border.width:1
            
            Text{
                text:modelDataanchors.centerIn:parent
                font.pointSize:16
            }
          }
        }
        Button {
            text:"Add New Course"
            width:"parent.width"
            onClicked:{
                console.log("Add new course button clicked")
            }
        }   
    }
}