import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import edu.owe 1.0

Page {
    id: page
    width: 600
    height: 400

    ColumnLayout {
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        Rectangle {
            Layout.fillWidth: true
            height: page.height/4
            color: "#eeeeee"

            Row {
                anchors.top: parent.top
                anchors.topMargin: 15

                OpenWeatherConditions {
                    id: currentWeather
                    place: page.title
                }

                Column {
                    width: 130

                    Image {
                        id: bigImage
                        source: currentWeather.icon
                        sourceSize.width: 120
                        sourceSize.height: 120
                        smooth: true
                    }
                    Label {
                        font.pixelSize: 20
                        font.bold: true
                        text: currentWeather.temperature + OpenWeather.temperatureSymbol
                        width: bigImage.width
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Column {

                    Label {
                        text: currentWeather.description
                        font.pixelSize: 20
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Pressure: ") + currentWeather.pressure + " hpa"
                    }
                    Label {
                        text: qsTr("Humidity: ") + currentWeather.humidity + "%"
                    }

                    Row {
                        spacing: 5

                        Image {
                            source: "arrow.png"
                            sourceSize.width: 15
                            sourceSize.height: 15

                            rotation: currentWeather.windDirection
                            smooth: true
                        }
                        Label {
                            text: currentWeather.windSpeed + " km/h"
                        }
                    }
                }

            }
        }
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ScrollIndicator.vertical: ScrollIndicator {}

            model: OpenWeatherForecast {
                place: page.title
            }
            delegate: ItemDelegate {
                width: parent.width
                height: 90

                RowLayout {
                    anchors.fill: parent

                    Column {
                        Layout.preferredWidth: 120
                        Layout.fillHeight: true

                        Label {
                            text: day
                        }

                        Label {
                            text: time
                        }
                    }

                    Column {
                        Layout.preferredWidth: 55
                        Layout.fillHeight: true

                        Image {
                            id: image
                            source: weatherIcon
                            sourceSize.width: 55
                            sourceSize.height: 55
                            smooth: true
                        }
                        Label {
                            text: temperature + OpenWeather.temperatureSymbol
                            width: image.width
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Column {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Label {
                            text: description
                        }

                        Label {
                            text: qsTr("Pressure: ") + pressure + " hpa"
                        }
                        Label {
                            text: qsTr("Humidity: ") + humidity + "%"
                        }

                        Row {
                            spacing: 5

                            Image {
                                source: "arrow.png"
                                sourceSize.width: 15
                                sourceSize.height: 15

                                rotation: windDirection
                                smooth: true
                            }
                            Label {
                                text: windSpeed + " km/h"
                            }
                        }
                    }
                }
            }
        }
    }
}

