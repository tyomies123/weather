import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import edu.owe 1.0

Dialog {
    id: dialog
    standardButtons: Dialog.Ok | Dialog.Cancel
    modal: true
    title: qsTr("Search city")

    onAccepted: {
        if(search.text != "")
        {
            saveCity(search.text)
            search.text = ""
        }
    }

    function saveCity(city)
    {
        OpenWeather.addCity(city)
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

            model: CitySearchModel{
                filter: search.text
            }

            delegate: ItemDelegate {
                width: parent.width
                text: city + "," + country
                onClicked: {
                    saveCity(text)
                    dialog.close();
                    search.text = ""
                }
            }
        }
    }
}
