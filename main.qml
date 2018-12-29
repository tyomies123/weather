import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: appWindow
    visible: true
    width: 600
    height: 800
    title: swipeView.currentItem.item.title

    CityModel {
        id: cities
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: "\u2630"
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
