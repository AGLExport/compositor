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
            width: 1920
            height: 1080

            Rectangle {
                id: centerArea
                color: "transparent"
                width: 1920
                height: 1080
                anchors.left: parent.left
                anchors.top: topArea.bottom
            }
            Rectangle {
                id: buttomArea
                color: "transparent"
                width: 1920
                height: 93
                anchors.left: parent.left
                anchors.bottom: parent.bottom

                MomiBar {
                    id:hoge
                }
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
