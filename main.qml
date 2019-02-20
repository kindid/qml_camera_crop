// (C) kuiash.com 2019

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.LocalStorage 2.12
import QtMultimedia 5.8

Window {
    visible: true
    width: 800
    height: 500
    title: qsTr("qml_camera_crop")
    Camera {
        id: camera
        captureMode: Camera.CaptureStillImage
        imageCapture {
            onImageCaptured: {
                capture_preview.source = preview
            }
        }
    }
    VideoOutput {
        x: 0
        y: 0
        width: 400
        height: 400
        fillMode: VideoOutput.PreserveAspectCrop
        source: camera
        MouseArea {
            anchors.fill: parent
            onClicked: {
                camera.imageCapture.capture();
            }
        }
    }
    Image {
        id: capture_preview
        x: 400
        y: 0
        width: 400
        height: 400
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/images/noise.png"
        onSourceChanged: {
            grabToImage(function(result) {
                    var rep = image_stats.getState(result.image)
                    // this is just to give you peace of mind!
                    print(rep)
                    report.text = rep
                },
                Qt.size(width, height)) // I guess if you want better resolution do that here
        }
    }
    Text {
        id: report
        x: 0
        y: 400
        width: parent.width
        height: 100
        text: "..."
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
