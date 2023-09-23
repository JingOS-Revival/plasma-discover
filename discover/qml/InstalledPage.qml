import QtQuick 2.1
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import org.kde.discover 2.0
import org.kde.discover.app 1.0
import org.kde.kirigami 2.1 as Kirigami

ApplicationsListPage {
    id: page
    stateFilter: AbstractResource.Installed
    sortOrder: Qt.AscendingOrder
    allBackends: true
    sortProperty: "installedPageSorting"
    sortRole: DiscoverSettings.installedPageSorting

    title: i18n("Installed")
    compact: true
    showRating: false
    canNavigate: false

    listHeader: null
}
