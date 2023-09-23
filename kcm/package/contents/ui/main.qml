/*
 *   SPDX-FileCopyrightText: 2020 Aleix Pol Gonzalez <aleixpol@kde.org>
 *
 *   SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.3 as QQC2
import org.kde.kirigami 2.6 as Kirigami
import org.kde.kcm 1.3

SimpleKCM {
    id: root

    ConfigModule.buttons: ConfigModule.Default | ConfigModule.Apply
    QQC2.ButtonGroup {
        id: autoUpdatesGroup
        onCheckedButtonChanged: {
            kcm.updatesSettings.useUnattendedUpdates = automaticallyRadio.checked
        }
    }

    ColumnLayout {
        Kirigami.FormLayout {
            QQC2.RadioButton {
                Kirigami.FormData.label: i18n("Update software:")
                text: i18n("Manually")

                QQC2.ButtonGroup.group: autoUpdatesGroup
                checked: !kcm.updatesSettings.useUnattendedUpdates
            }
            QQC2.RadioButton {
                id: automaticallyRadio
                text: i18n("Automatically")

                QQC2.ButtonGroup.group: autoUpdatesGroup
                checked: kcm.updatesSettings.useUnattendedUpdates
            }

            SettingStateBinding {
                configObject: kcm.updatesSettings
                settingName: "useUnattendedUpdates"
                target: automaticallyRadio
            }
        }

        QQC2.Label {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: Math.min(Kirigami.Units.gridUnit * 25, Math.round(root.width * 0.6))

            wrapMode: Text.WordWrap
            visible: automaticallyRadio.checked
            horizontalAlignment: Text.AlignHCenter
            font: theme.smallestFont
            text: xi18nc("@info", "Software updates will be downloaded automatically when they become available. Updates for applications will be installed immediately, while system updates will be installed the next time the computer is restarted.")
        }
    }
}
