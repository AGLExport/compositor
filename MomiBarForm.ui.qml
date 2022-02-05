import QtQuick 2.4
import QtQuick.Controls

Item {
    width: 1920
    height: 93

    Image {
        id: homeScreen_footer_image
        y: 70
        width: 1920
        height: 93
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        opacity: 1
        source: "qrc:/images/12_Footer.png"

        Item {
            id: homeScreenMap
            x:450
            y: 0
            width: parent.height
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.bottomMargin: 5

            Button {
                id: map_sw
                x: 0
                y: 0
                width: parent.height
                height: width
                opacity: 0

                //function homescreen_map_sw() {
                //}
                //onClicked: { homescreen_map_sw() }
            }
        }
    }
}
