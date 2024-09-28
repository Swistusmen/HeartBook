#include "NGOListingInfo.h"

NGOListingInfo::NGOListingInfo(QObject *parent)
    : QObject{parent}
{}

QString NGOListingInfo::name() const
{
    return m_name;
}

void NGOListingInfo::setName(const QString &newName)
{
    if (m_name == newName)
        return;
    m_name = newName;
    emit nameChanged();
}

QString NGOListingInfo::projects() const
{
    return m_projects;
}

void NGOListingInfo::setProjects(const QString &newProjects)
{
    if (m_projects == newProjects)
        return;
    m_projects = newProjects;
    emit projectsChanged();
}
