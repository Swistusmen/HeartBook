#include "CompanyListingModel.h"
#include "CompanyListingInfo.h"

CompanyListingModel::CompanyListingModel(QObject *parent)
    : QAbstractListModel{parent}
{}

int CompanyListingModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_companyList.length();
}

QVariant CompanyListingModel::data(const QModelIndex &index, int role) const
{
    if (index.isValid() && index.row() >= 0 && index.row() < m_companyList.length())
    {
        CompanyListingInfo* companyListing = m_companyList[index.row()];

        switch((Roles) role){
        case CompanyNameRole:
            return companyListing->companyName();
        case CompanyStrategiesRole:
            return companyListing->companyStrategies();
        case CompanyBudgetRole:
            return companyListing->companyBudget();
        case CompanyLookingRole:
            return companyListing->companyLooking();
        case CompanyGrantsRole:
            return companyListing->companyGrants();
        case CompanyImageRole:
            return companyListing->companyImage();
        case CompanyTagsRole:
            return companyListing->companyTags();
        case CompanyContactRole:
            return companyListing->companyContact();
        default:
            return {};
        }
    }
    return {};
}

QHash<int, QByteArray> CompanyListingModel::roleNames() const
{
    QHash<int, QByteArray> result;

    result[CompanyNameRole] = "companyName";
    result[CompanyStrategiesRole] = "companyStrategies";
    result[CompanyBudgetRole] = "companyBudget";
    result[CompanyLookingRole] = "companyLooking";
    result[CompanyGrantsRole] = "companyGrants";
    result[CompanyImageRole] = "companyImage";
    result[CompanyTagsRole] = "companyTags";
    result[CompanyContactRole] = "companyContact";


    return result;
}

void CompanyListingModel::addCompanyListing(const QString &name, const QString &strategies, const QString &budget, const QString &looking, const QString &grants, const QUrl &image, const QList<QString> &tags, const QString &contact)
{
    beginInsertRows(QModelIndex(), m_companyList.length(), m_companyList.length());

    CompanyListingInfo* companyListing = new CompanyListingInfo(this);

    companyListing->setCompanyName(name);
    companyListing->setCompanyStrategies(strategies);
    companyListing->setCompanyBudget(budget);
    companyListing->setCompanyLooking(looking);
    companyListing->setCompanyGrants(grants);
    companyListing->setCompanyImage(image);
    companyListing->setCompanyTags(tags);
    companyListing->setCompanyContact(contact);

    m_companyList << companyListing;

    //qDebug() << "Added listing to the corpo list!";

    endInsertRows();
}
