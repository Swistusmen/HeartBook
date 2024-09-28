#ifndef CORPOLISTINGINFO_H
#define CORPOLISTINGINFO_H

#include <QObject>

class CorpoListingInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString corpoName READ corpoName WRITE setCorpoName NOTIFY corpoNameChanged FINAL)
    Q_PROPERTY(QString corpoExperience READ corpoExperience WRITE setCorpoExperience NOTIFY corpoExperienceChanged FINAL)
    Q_PROPERTY(QString corpoGoals READ corpoGoals WRITE setCorpoGoals NOTIFY corpoGoalsChanged FINAL)
    Q_PROPERTY(QString corpoTeam READ corpoTeam WRITE setCorpoTeam NOTIFY corpoTeamChanged FINAL)
    Q_PROPERTY(QList<QString> corpoTags READ corpoTags WRITE setCorpoTags NOTIFY corpoTagsChanged FINAL)


public:
    explicit CorpoListingInfo(QObject *parent = nullptr);


    QString corpoName() const;
    void setCorpoName(const QString &newCorpoName);

    QString corpoExperience() const;
    void setCorpoExperience(const QString &newCorpoExperience);

    QString corpoGoals() const;
    void setCorpoGoals(const QString &newCorpoGoals);

    QString corpoTeam() const;
    void setCorpoTeam(const QString &newCorpoTeam);

    QList<QString> corpoTags() const;
    void setCorpoTags(const QList<QString> &newCorpoTags);

signals:
    void corpoNameChanged();
    void corpoExperienceChanged();

    void corpoGoalsChanged();

    void corpoTeamChanged();

    void corpoTagsChanged();

private:
    QString m_corpoName;
    QString m_corpoExperience;
    QString m_corpoGoals;
    QString m_corpoTeam;
    QList<QString> m_corpoTags;
};

#endif // CORPOLISTINGINFO_H
