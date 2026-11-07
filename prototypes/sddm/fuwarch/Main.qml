// Fuwarch Kawaii — SDDM theme v0.1 (clean-room, MIT)
// Fuwarch Linux — https://github.com/Rukafuu/fuwarch-docs
// Paleta: Catppuccin Mocha + acentos rosa (doc 01, D-003)
import QtQuick
import QtQuick.Controls.Basic as QQC2
import SddmComponents 2.0

Rectangle {
    id: root

    width: 1600
    height: 900

    // ---- Paleta (Catppuccin Mocha) ----
    readonly property color cCrust: "#11111b"
    readonly property color cMantle: "#181825"
    readonly property color cBase: "#1e1e2e"
    readonly property color cSurface0: "#313244"
    readonly property color cSurface1: "#45475a"
    readonly property color cText: "#cdd6f4"
    readonly property color cSubtext: "#a6adc8"
    readonly property color cPink: config.accent ? config.accent : "#f5c2e7"
    readonly property color cMauve: "#cba6f7"
    readonly property color cLavender: "#b4befe"
    readonly property color cRed: "#f38ba8"

    // ---- Config (theme.conf) ----
    property string fontName: config.font ? config.font : "Rounded Mplus 1c"

    gradient: Gradient {
        GradientStop { position: 0.0; color: root.cCrust }
        GradientStop { position: 0.55; color: root.cBase }
        GradientStop { position: 1.0; color: root.cMantle }
    }

    // Papel de parede opcional (theme.conf: background=)
    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: config.background ? config.background : ""
        visible: source !== ""
    }

    // ---- Bolhas kawaii decorativas ----
    Rectangle {
        x: -140; y: parent.height - 340
        width: 460; height: 460; radius: 230
        color: root.cPink; opacity: 0.07
    }
    Rectangle {
        x: parent.width - 320; y: -160
        width: 400; height: 400; radius: 200
        color: root.cMauve; opacity: 0.08
    }
    Rectangle {
        x: parent.width - 240; y: parent.height - 190
        width: 280; height: 280; radius: 140
        color: root.cLavender; opacity: 0.06
    }
    Rectangle {
        x: 90; y: 70
        width: 180; height: 180; radius: 90
        color: root.cLavender; opacity: 0.05
    }

    // Florzinhas piscando (kawaii sparkle)
    Text {
        text: "✿"; color: root.cPink; font.pixelSize: 34
        x: parent.width * 0.18; y: parent.height * 0.72
        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 0.15; duration: 2600; easing.type: Easing.InOutSine }
            NumberAnimation { to: 0.7; duration: 2600; easing.type: Easing.InOutSine }
        }
    }
    Text {
        text: "♡"; color: root.cMauve; font.pixelSize: 26
        x: parent.width * 0.82; y: parent.height * 0.26
        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 0.7; duration: 3200; easing.type: Easing.InOutSine }
            NumberAnimation { to: 0.15; duration: 3200; easing.type: Easing.InOutSine }
        }
    }

    // ---- Relógio ----
    Clock {
        id: clock
        visible: config.showClock === "true"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 56
        color: root.cText
        timeFont.family: root.fontName
        timeFont.pixelSize: 52
        timeFont.weight: Font.Medium
        dateFont.family: root.fontName
        dateFont.pixelSize: 14
    }

    // ---- Card de login ----
    Rectangle {
        id: card
        width: 380
        height: 470
        anchors.centerIn: parent
        radius: 24
        color: "#e6181825"
        border.color: Qt.rgba(root.cPink.r, root.cPink.g, root.cPink.b, 0.35)
        border.width: 1

        function doLogin() {
            if (userField.text === "") {
                userField.forceActiveFocus();
            } else if (passField.text === "") {
                passField.forceActiveFocus();
            } else {
                sddm.login(userField.text, passField.text, sessionCombo.currentIndex);
            }
        }

        Column {
            anchors.fill: parent
            anchors.margins: 34
            spacing: 18

            // Wordmark
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: "Fuwarch"
                color: root.cPink
                font.family: root.fontName
                font.weight: Font.ExtraBold
                font.pixelSize: 36
            }
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: "fuwafuwa login ✿"
                color: root.cSubtext
                font.family: root.fontName
                font.pixelSize: 13
            }

            Item { width: 1; height: 6 }

            // Usuário
            Rectangle {
                width: parent.width
                height: 46
                radius: 14
                color: root.cSurface0
                border.color: userField.activeFocus ? root.cPink : root.cSurface1
                border.width: userField.activeFocus ? 2 : 1
                QQC2.TextField {
                    id: userField
                    anchors.fill: parent
                    anchors.leftMargin: 16
                    anchors.rightMargin: 16
                    background: Item {}
                    color: root.cText
                    selectionColor: root.cPink
                    selectedTextColor: root.cCrust
                    placeholderText: "usuário"
                    font.family: root.fontName
                    font.pixelSize: 14
                    onAccepted: card.doLogin()
                    Component.onCompleted: forceActiveFocus()
                }
            }

            // Senha
            Rectangle {
                width: parent.width
                height: 46
                radius: 14
                color: root.cSurface0
                border.color: passField.activeFocus ? root.cPink : root.cSurface1
                border.width: passField.activeFocus ? 2 : 1
                QQC2.TextField {
                    id: passField
                    anchors.fill: parent
                    anchors.leftMargin: 16
                    anchors.rightMargin: 16
                    background: Item {}
                    color: root.cText
                    selectionColor: root.cPink
                    selectedTextColor: root.cCrust
                    placeholderText: "senha"
                    echoMode: TextInput.Password
                    passwordCharacter: "●"
                    font.family: root.fontName
                    font.pixelSize: 14
                    onAccepted: card.doLogin()
                }
            }

            // Botão login
            Rectangle {
                width: parent.width
                height: 48
                radius: 14
                color: loginMouse.containsPress ? Qt.lighter(root.cPink, 0.88)
                     : (loginMouse.containsMouse ? Qt.lighter(root.cPink, 1.08) : root.cPink)
                Text {
                    anchors.centerIn: parent
                    text: "✿ Entrar"
                    color: root.cCrust
                    font.family: root.fontName
                    font.bold: true
                    font.pixelSize: 15
                }
                MouseArea {
                    id: loginMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: card.doLogin()
                }
            }

            // Erro
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                visible: sddm.errors !== ""
                text: sddm.errors
                color: root.cRed
                font.family: root.fontName
                font.pixelSize: 12
            }
        }
    }

    // ---- Hostname (rodapé esquerdo) ----
    Text {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 24
        anchors.bottomMargin: 22
        text: sddm.hostName
        color: root.cSubtext
        font.family: root.fontName
        font.pixelSize: 13
    }

    // ---- Sessão (rodapé centro) ----
    QQC2.ComboBox {
        id: sessionCombo
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 18
        width: 240
        model: sessionModel
        textRole: "name"
        currentIndex: 0
        font.family: root.fontName
        font.pixelSize: 13
        background: Rectangle {
            radius: 12
            color: root.cSurface0
            border.color: root.cSurface1
            border.width: 1
        }
        contentItem: Text {
            leftPadding: 14
            rightPadding: 34
            text: sessionCombo.displayText
            color: root.cText
            font: sessionCombo.font
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        indicator: Text {
            x: sessionCombo.width - 26
            y: sessionCombo.height / 2 - 10
            text: "▾"
            color: root.cSubtext
            font.pixelSize: 14
        }
        delegate: QQC2.ItemDelegate {
            id: sessionDelegate
            width: sessionCombo.width
            contentItem: Text {
                text: model.name
                color: root.cText
                font.family: root.fontName
                font.pixelSize: 13
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: sessionCombo.highlightedIndex === index
            background: Rectangle {
                radius: 8
                color: sessionDelegate.highlighted ? root.cSurface1 : root.cSurface0
            }
        }
        popup: QQC2.Popup {
            y: sessionCombo.height + 4
            width: sessionCombo.width
            padding: 4
            background: Rectangle {
                radius: 12
                color: root.cMantle
                border.color: root.cSurface1
                border.width: 1
            }
        }
    }

    // ---- Energia (rodapé direito) ----
    Row {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 24
        anchors.bottomMargin: 18
        spacing: 12

        Rectangle {
            width: 42; height: 42; radius: 21
            visible: sddm.canReboot
            color: rebootMouse.containsMouse ? root.cSurface1 : root.cSurface0
            Text { anchors.centerIn: parent; text: "⟳"; color: root.cSubtext; font.pixelSize: 17 }
            MouseArea {
                id: rebootMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: sddm.reboot()
            }
        }
        Rectangle {
            width: 42; height: 42; radius: 21
            visible: sddm.canPowerOff
            color: powerMouse.containsMouse ? root.cSurface1 : root.cSurface0
            Text { anchors.centerIn: parent; text: "⏻"; color: root.cSubtext; font.pixelSize: 17 }
            MouseArea {
                id: powerMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: sddm.powerOff()
            }
        }
    }
}
