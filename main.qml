import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import edu.owe 1.0

ApplicationWindow {
    id: appWindow
    visible: true
    width: 400
    height: 600
    title: "Weather"


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
                text: swipeView.currentItem.item.title
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
            model: OpenWeather.cityModel
            Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                sourceComponent: PageForm {
                    title: modelData
                }
            }
        }

        Component.onCompleted: {
            swipeView.currentIndex = OpenWeather.lastCityIndex
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
