#include "CorpoListingInfo.h"

CorpoListingInfo::CorpoListingInfo(QObject *parent)
    : QObject{parent}
{}

QString CorpoListingInfo::corpoName() const
{
    return m_corpoName;
}

void CorpoListingInfo::setCorpoName(const QString &newCorpoName)
{
    if (m_corpoName == newCorpoName)
        return;
    m_corpoName = newCorpoName;
    emit corpoNameChanged();
}

QString CorpoListingInfo::corpoExperience() const
{
    return m_corpoExperience;
}

void CorpoListingInfo::setCorpoExperience(const QString &newCorpoExperience)
{
    if (m_corpoExperience == newCorpoExperience)
        return;
    m_corpoExperience = newCorpoExperience;
    emit corpoExperienceChanged();
}

QString CorpoListingInfo::corpoGoals() const
{
    return m_corpoGoals;
}

void CorpoListingInfo::setCorpoGoals(const QString &newCorpoGoals)
{
    if (m_corpoGoals == newCorpoGoals)
        return;
    m_corpoGoals = newCorpoGoals;
    emit corpoGoalsChanged();
}

QString CorpoListingInfo::corpoTeam() const
{
    return m_corpoTeam;
}

void CorpoListingInfo::setCorpoTeam(const QString &newCorpoTeam)
{
    if (m_corpoTeam == newCorpoTeam)
        return;
    m_corpoTeam = newCorpoTeam;
    emit corpoTeamChanged();
}

QList<QString> CorpoListingInfo::corpoTags() const
{
    return m_corpoTags;
}

void CorpoListingInfo::setCorpoTags(const QList<QString> &newCorpoTags)
{
    if (m_corpoTags == newCorpoTags)
        return;
    m_corpoTags = newCorpoTags;
    emit corpoTagsChanged();
}

QString CorpoListingInfo::corpoContact() const
{
    return m_corpoContact;
}

void CorpoListingInfo::setCorpoContact(const QString &newCorpoContact)
{
    if (m_corpoContact == newCorpoContact)
        return;
    m_corpoContact = newCorpoContact;
    emit corpoContactChanged();
}

QUrl CorpoListingInfo::corpoImage() const
{
    return m_corpoImage;
}

void CorpoListingInfo::setCorpoImage(const QUrl &newCorpoImage)
{
    if (m_corpoImage == newCorpoImage)
        return;
    m_corpoImage = newCorpoImage;
    emit corpoImageChanged();
}
