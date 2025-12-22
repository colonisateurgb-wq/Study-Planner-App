import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    visible:400
    height:500
    title:"Profile Settings"

    Column{
        spacing:15
        anchors.centerIn:parent

        Text{
            text:"Profile Settings"
            font.pointSize:22
            font.bold:true
        }

        TextField{
            placeholderText:"Full Name"
            width:300
        }
        TextField{
            placeholderText:"Email"
            width:300
        }
        TextField{
            placeholderText:"Username"
            width:300
        }
        ComboBox{
            width:300
            model:["Light Mode","Dark Mode"]       
        }
        Button{
            width:300
            onClicked:{
                console.log("Profile changes saved")
            }
        }
    }
}