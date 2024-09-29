#include "CorpoListingModel.h"
#include "CorpoListingInfo.h"

#include <QDebug>

CorpoListingModel::CorpoListingModel(QObject *parent)
    : QAbstractListModel{parent}
{}

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


    return result;
}

void CorpoListingModel::addCorpoListing(const QString &name, const QString &experience, const QString &goals, const QString &team, const QList<QString> &tags)
{
    beginInsertRows(QModelIndex(), m_corpoList.length(), m_corpoList.length());

    CorpoListingInfo* corpoListing = new CorpoListingInfo(this);

    corpoListing->setCorpoName(name);
    corpoListing->setCorpoExperience(experience);
    corpoListing->setCorpoGoals(goals);
    corpoListing->setCorpoTeam(team);
    corpoListing->setCorpoTags(tags);

    m_corpoList << corpoListing;

    qDebug() << "Added listing to the corpo list!";

    endInsertRows();
}
