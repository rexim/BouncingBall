import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("Bouncing Ball")

    color: "#181818"

    Rectangle {
        id: rect
        property double altitude: 100
        property double velocity: 1
        property double gravity: -1.5
        property double force: 0

        width: 50 + Math.max(0, 50 - altitude)
        height: Math.min(50, altitude)
        color: "#AA1818"
        x: parent.width / 2 - width / 2
        y: parent.height / 3 * 2 - altitude

        function update() {
            if (altitude <= 20) {
                force = 30
                velocity = 0
            } else {
                force = 0
            }

            velocity += gravity + force
            altitude += velocity
        }
    }

    Timer {
        running: true
        interval: 33
        repeat: true
        onTriggered: rect.update()
    }
}
