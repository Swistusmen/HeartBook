#include "CompanyListingInfo.h"

CompanyListingInfo::CompanyListingInfo(QObject *parent)
    : QObject{parent}
{}

QString CompanyListingInfo::companyName() const
{
    return m_companyName;
}

void CompanyListingInfo::setCompanyName(const QString &newCompanyName)
{
    if (m_companyName == newCompanyName)
        return;
    m_companyName = newCompanyName;
    emit companyNameChanged();
}

QString CompanyListingInfo::companyStrategies() const
{
    return m_companyStrategies;
}

void CompanyListingInfo::setCompanyStrategies(const QString &newCompanyStrategies)
{
    if (m_companyStrategies == newCompanyStrategies)
        return;
    m_companyStrategies = newCompanyStrategies;
    emit companyStrategiesChanged();
}

QString CompanyListingInfo::companyBudget() const
{
    return m_companyBudget;
}

void CompanyListingInfo::setCompanyBudget(const QString &newCompanyBudget)
{
    if (m_companyBudget == newCompanyBudget)
        return;
    m_companyBudget = newCompanyBudget;
    emit companyBudgetChanged();
}

QString CompanyListingInfo::companyLooking() const
{
    return m_companyLooking;
}

void CompanyListingInfo::setCompanyLooking(const QString &newCompanyLooking)
{
    if (m_companyLooking == newCompanyLooking)
        return;
    m_companyLooking = newCompanyLooking;
    emit companyLookingChanged();
}

QString CompanyListingInfo::companyGrants() const
{
    return m_companyGrants;
}

void CompanyListingInfo::setCompanyGrants(const QString &newCompanyGrants)
{
    if (m_companyGrants == newCompanyGrants)
        return;
    m_companyGrants = newCompanyGrants;
    emit companyGrantsChanged();
}

QUrl CompanyListingInfo::companyImage() const
{
    return m_companyImage;
}

void CompanyListingInfo::setCompanyImage(const QUrl &newCompanyImage)
{
    if (m_companyImage == newCompanyImage)
        return;
    m_companyImage = newCompanyImage;
    emit companyImageChanged();
}

QList<QString> CompanyListingInfo::companyTags() const
{
    return m_companyTags;
}

void CompanyListingInfo::setCompanyTags(const QList<QString> &newCompanyTags)
{
    if (m_companyTags == newCompanyTags)
        return;
    m_companyTags = newCompanyTags;
    emit companyTagsChanged();
}

QString CompanyListingInfo::companyContact() const
{
    return m_companyContact;
}

void CompanyListingInfo::setCompanyContact(const QString &newCompanyContact)
{
    if (m_companyContact == newCompanyContact)
        return;
    m_companyContact = newCompanyContact;
    emit companyContactChanged();
}
