import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Dialog {
    id: dialog
    standardButtons: Dialog.Ok | Dialog.Cancel
    modal: true
    title: qsTr("Select city")

    onAccepted: {
        if(search.text != "")
        {
            saveCity(search.text)
            search.text = ""
        }
    }

    function saveCity(city)
    {
        cities.append({"city": city});
    }

    ColumnLayout {
        anchors.fill: parent
        TextField {
            id: search
            Layout.fillWidth: true
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ScrollIndicator.vertical: ScrollIndicator {}

            model: ["1", "2", "3", "4"]
            delegate: ItemDelegate {
                width: parent.width
                text: modelData
                onClicked: {
                    saveCity(text)
                    dialog.close();
                }
            }
        }
    }
}
