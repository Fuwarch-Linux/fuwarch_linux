// Fuwarch Kawaii — SDDM theme v0.1 (clean-room, MIT)
// Fuwarch Linux — https://github.com/Rukafuu/fuwarch-docs
// Paleta: Catppuccin Mocha + acentos rosa (doc 01, D-003)
import QtQuick
import QtQuick.Controls.Basic as QQC2
import Qt5Compat.GraphicalEffects
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

    // ---- Card de login (glassmorphism + glow neon rosa) ----
    DropShadow {
        anchors.fill: card
        source: card
        color: Qt.rgba(root.cPink.r, root.cPink.g, root.cPink.b, 0.45)
        radius: 16
        samples: 33
        spread: 0.3
        transparentBorder: true
    }

    // Fontes do avatar circular (padrão Qt docs: source/mask invisíveis).
    // ISO-ready: caminho vem do theme.conf (logo=); sem logo -> fallback wordmark
    Image {
        id: avatarSource
        width: 112
        height: 112
        source: config.logo ? config.logo : ""
        fillMode: Image.PreserveAspectCrop
        visible: false
    }
    Rectangle {
        id: avatarMask
        width: 112
        height: 112
        radius: 56
        visible: false
    }

    Rectangle {
        id: card
        width: 380
        height: 320
        anchors.centerIn: parent
        radius: 24
        color: Qt.rgba(30 / 255, 30 / 255, 46 / 255, 0.7)
        border.color: root.cPink
        border.width: 1

        // Usuário alvo — API UserModel: count/lastIndex/data (ref. silent-nyarch;
        // roles: 257=name, 258=realName, 260=icon). userRow é mutável (seletor v0.2)
        property int userRow: userModel.count > 0
            ? (userModel.lastIndex >= 0 ? userModel.lastIndex : 0) : -1
        readonly property string loginName: userRow >= 0
            ? (userModel.data(userModel.index(userRow, 0), 257) || "") : ""
        readonly property string displayName: {
            if (userRow < 0)
                return "";
            var real = userModel.data(userModel.index(userRow, 0), 258);
            return (real && real !== "") ? real : loginName;
        }
        // Debug/teste: força o chevron e o popup mesmo com 1 usuário (theme.conf)
        readonly property bool multiUser: userModel.count > 1
            || config.forceUserSelector === "true"

        function doLogin() {
            if (passField.text === "") {
                passField.forceActiveFocus();
            } else {
                sddm.login(card.loginName, passField.text, sessionCombo.currentIndex);
            }
        }

        Column {
            anchors.fill: parent
            anchors.margins: 30
            spacing: 16

            // Avatar circular da Usami (asset CC BY-NC-ND 4.0 — doc 01, D-010);
            // sem logo configurada -> fallback com wordmark
            Item {
                width: 112
                height: 112
                anchors.horizontalCenter: parent.horizontalCenter
                readonly property bool avatarReady: avatarSource.status === Image.Ready

                OpacityMask {
                    anchors.fill: parent
                    source: avatarSource
                    maskSource: avatarMask
                    visible: parent.avatarReady
                }
                Rectangle {
                    anchors.fill: parent
                    radius: 56
                    color: "transparent"
                    border.color: root.cPink
                    border.width: 2
                    visible: parent.avatarReady
                }
                Text {
                    anchors.centerIn: parent
                    visible: !parent.avatarReady
                    text: "Fuwarch"
                    color: root.cPink
                    font.family: root.fontName
                    font.weight: Font.ExtraBold
                    font.pixelSize: 30
                }
            }

            // Nome do usuário (negrito, maior, centralizado) + chevron do seletor
            Item {
                width: parent.width
                height: 28

                Text {
                    anchors.centerIn: parent
                    elide: Text.ElideRight
                    text: card.displayName !== "" ? card.displayName : "usuário"
                    color: root.cText
                    font.family: root.fontName
                    font.bold: true
                    font.pixelSize: 18
                }
                Rectangle {
                    id: userSwitch
                    width: 26
                    height: 26
                    radius: 13
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    visible: card.multiUser
                    color: switchMouse.containsMouse ? root.cSurface1 : root.cSurface0
                    Text {
                        anchors.centerIn: parent
                        text: "⌄"
                        color: root.cSubtext
                        font.pixelSize: 14
                    }
                    MouseArea {
                        id: switchMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: userDropdown.visible = !userDropdown.visible
                    }
                }
            }

            // Senha (única entrada; seta circular alinhada à direita)
            Rectangle {
                width: parent.width
                height: 46
                radius: 23
                color: root.cSurface0
                border.color: passField.activeFocus ? "#FF5E7E" : root.cSurface1
                border.width: passField.activeFocus ? 2 : 1
                QQC2.TextField {
                    id: passField
                    anchors.fill: parent
                    anchors.leftMargin: 18
                    anchors.rightMargin: 56
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
                    Component.onCompleted: forceActiveFocus()
                }
                Rectangle {
                    width: 34
                    height: 34
                    radius: 17
                    anchors.right: parent.right
                    anchors.rightMargin: 6
                    anchors.verticalCenter: parent.verticalCenter
                    color: goMouse.containsMouse ? Qt.lighter(root.cPink, 1.1) : root.cPink
                    Text {
                        anchors.centerIn: parent
                        text: "→"
                        color: root.cCrust
                        font.bold: true
                        font.pixelSize: 16
                    }
                    MouseArea {
                        id: goMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: card.doLogin()
                    }
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

        // Dropdown de seleção de usuários (v0.2) — Rectangle puro, SEM QQC2.Popup
        // (greeter não é ApplicationWindow: Popup sem overlay trava o render)
        Rectangle {
            id: userDropdown
            x: 30
            y: 192
            width: 320
            height: Math.min(220, userList.contentHeight + 16)
            radius: 16
            color: root.cMantle
            border.color: root.cPink
            border.width: 1
            visible: false
            z: 10
            Component.onCompleted: visible = (config.forceUserSelector === "true")

            ListView {
                id: userList
                anchors.fill: parent
                anchors.margins: 8
                clip: true
                spacing: 4
                model: userModel
                Component.onCompleted: currentIndex = Math.max(0, card.userRow)
                delegate: QQC2.ItemDelegate {
                    id: userDelegate
                    width: userList.width
                    height: 48
                    onClicked: {
                        card.userRow = index;
                        userList.currentIndex = index;
                        userDropdown.visible = false;
                        passField.forceActiveFocus();
                    }
                    background: Rectangle {
                        radius: 12
                        color: userDelegate.hovered || index === card.userRow
                               ? root.cSurface1 : "transparent"
                    }
                    contentItem: Item {
                        Rectangle {
                            width: 36
                            height: 36
                            radius: 18
                            x: 4
                            anchors.verticalCenter: parent.verticalCenter
                            color: root.cPink
                            opacity: 0.3
                            Text {
                                anchors.centerIn: parent
                                text: "✿"
                                color: root.cCrust
                                font.pixelSize: 15
                            }
                        }
                        Text {
                            x: 52
                            width: parent.width - 60
                            anchors.verticalCenter: parent.verticalCenter
                            elide: Text.ElideRight
                            text: (model.realName && model.realName !== "") ? model.realName : model.name
                            color: root.cText
                            font.family: root.fontName
                            font.pixelSize: 14
                            font.bold: index === card.userRow
                        }
                    }
                }
            }
        }

        // Fecha o dropdown ao clicar em qualquer lugar do card fora dele
        MouseArea {
            z: 5
            anchors.fill: parent
            visible: userDropdown.visible
            onClicked: userDropdown.visible = false
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
