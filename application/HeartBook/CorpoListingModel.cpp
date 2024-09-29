#include "CorpoListingModel.h"
#include "CorpoListingInfo.h"
#include <QUrl>

#include <QDebug>

CorpoListingModel::CorpoListingModel(QObject *parent)
    : QAbstractListModel{parent}
{
    addCorpoListing("Bestlex", "Our Company has gained experience over many years...", "Improve well being, ...", "Senior Software Developer - Jeff, Marie and Zbigniew...", {"It ", "Trade ", "Fintech ", "... "}, QUrl("qrc:/res/assets/images/hq1.jpg"), "Email: contact@bestplex.com");
}

int CorpoListingModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_corpoList.length();
}

QVariant CorpoListingModel::data(const QModelIndex &index, int role) const
{
    if (index.isValid() && index.row() >= 0 && index.row() < m_corpoList.length())
    {
        CorpoListingInfo* corpoListing = m_corpoList[index.row()];

        switch((Roles) role){
        case CorpoNameRole:
            return corpoListing->corpoName();
        case CorpoExperienceRole:
            return corpoListing->corpoExperience();
        case CorpoGoalsRole:
            return corpoListing->corpoGoals();
        case CorpoTeamRole:
            return corpoListing->corpoTeam();
        case CorpoTagsRole:
            return corpoListing->corpoTags();
        case CorpoImageRole:
            return corpoListing->corpoImage();
        case CorpoContactRole:
            return corpoListing->corpoContact();
        default:
            return {};
        }
    }
    return {};
}

QHash<int, QByteArray> CorpoListingModel::roleNames() const
{
    QHash<int, QByteArray> result;

    result[CorpoNameRole] = "corpoName";
    result[CorpoExperienceRole] = "corpoExperience";
    result[CorpoGoalsRole] = "corpoGoals";
    result[CorpoTeamRole] = "corpoTeam";
    result[CorpoTagsRole] = "corpoTags";
    result[CorpoImageRole] = "corpoImage";
    result[CorpoContactRole] = "corpoContact";


    return result;
}

void CorpoListingModel::addCorpoListing(const QString &name, const QString &experience, const QString &goals, const QString &team, const QList<QString> &tags, const QUrl& image, const QString& contact)
{
    beginInsertRows(QModelIndex(), m_corpoList.length(), m_corpoList.length());

    CorpoListingInfo* corpoListing = new CorpoListingInfo(this);

    corpoListing->setCorpoName(name);
    corpoListing->setCorpoExperience(experience);
    corpoListing->setCorpoGoals(goals);
    corpoListing->setCorpoTeam(team);
    corpoListing->setCorpoTags(tags);
    corpoListing->setCorpoImage(image);
    corpoListing->setCorpoContact(contact);

    m_corpoList << corpoListing;

    //qDebug() << "Added listing to the corpo list!";

    endInsertRows();
}
