import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow
    visible: true
    width: 400
    height: 600
    title: swipeView.currentItem.item.title

    CityModel {
        id: cities
    }

    CityDrawer {
        id: drawer
        width: appWindow.width * 0.8
        height: appWindow.height
        Binding {
            target: swipeView
            property: "currentIndex"
            value: drawer.cityIndex
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: "\u2630"
                onClicked: drawer.open()
            }

            Label {
                text: appWindow.title
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                text: qsTr("?")
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent

        Repeater {
            model: cities
            Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                sourceComponent: Page1Form {
                    title: city
                }
            }
        }
    }

    footer: Pane {
        width: parent.width
        PageIndicator{
            count: swipeView.count
            currentIndex: swipeView.currentIndex
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
