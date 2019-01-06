import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Drawer {
    property alias cityIndex: listView.currentIndex

    CityPicker {
        id: cityPicker
        anchors.centerIn: parent
        width: appWindow.width - appWindow.width * 0.2
        height: appWindow.height - appWindow.height * 0.3
    }

    ColumnLayout {
        anchors.fill: parent

        ToolBar {
            Layout.fillWidth: true

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter

                ToolButton {
                    text: "+"
                    onClicked: cityPicker.open()
                }

                ToolButton {
                    text: "-"
                    onClicked: cities.remove(listView.currentIndex)
                }
            }
        }

        ListView {
            id: listView
            Layout.fillHeight: true
            Layout.fillWidth: true

            model: cities
            orientation: Qt.Vertical
            delegate: ItemDelegate {
                width: parent.width
                text: modelData
                highlighted: ListView.isCurrentItem
                onClicked: listView.currentIndex = index
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}
