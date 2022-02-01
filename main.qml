import QtQuick
import QtWayland.Compositor
import QtWayland.Compositor.IviApplication
import QtQuick.Window

WaylandCompositor {
    id: rootCompositor
    WaylandOutput {
        sizeFollowsWindow: true
        window: Window {
            id: win
            visible: true
            color: "transparent"
            width: 1280
            height: 720

            Rectangle {
                id: topArea
                color: "transparent"
                width: 1280
                height: 100
                anchors.left: parent.left
                anchors.top: parent.top
            }
            Rectangle {
                id: centerArea
                color: "transparent"
                width: 1280
                height: 720 - 200
                anchors.left: parent.left
                anchors.top: topArea.bottom
            }
            Rectangle {
                id: buttomArea
                //color: "transparent"
                width: 1280
                height: 100
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
        }
    }
    //! [wayland output]
    Component {
        id: chromeComponent
        ShellSurfaceItem {
            anchors.fill: parent
            onSurfaceDestroyed: destroy()
            //! [resizing]
            onWidthChanged: handleResized()
            onHeightChanged: handleResized()
            function handleResized() {
                shellSurface.sendConfigure(Qt.size(width, height));
            }
            //! [resizing]
        }
    }
    //! [connecting]
    IviApplication {
        onIviSurfaceCreated: {
            var surfaceArea = centerArea;
            var item = chromeComponent.createObject(surfaceArea, { "shellSurface": iviSurface } );
            item.handleResized();
        }
    }
    //! [connecting]
}
