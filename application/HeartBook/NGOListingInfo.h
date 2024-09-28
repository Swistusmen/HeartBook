#ifndef NGOLISTINGINFO_H
#define NGOLISTINGINFO_H

#include <QObject>

class NGOListingInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString projects READ projects WRITE setProjects NOTIFY projectsChanged FINAL)
public:
    explicit NGOListingInfo(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &newName);

    QString projects() const;
    void setProjects(const QString &newProjects);

signals:
    void nameChanged();
    void projectsChanged();

private:
    QString m_name;
    QString m_projects;
};

#endif // NGOLISTINGINFO_H
