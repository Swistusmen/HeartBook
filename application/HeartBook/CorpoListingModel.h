#ifndef CORPOLISTINGMODEL_H
#define CORPOLISTINGMODEL_H

#include <QObject>
#include <QAbstractListModel>

class CorpoListingInfo;

class CorpoListingModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        CorpoNameRole = Qt::UserRole + 1,
        CorpoExperienceRole,
        CorpoGoalsRole,
        CorpoTeamRole,
        CorpoTagsRole,
        CorpoImageRole,
        CorpoContactRole
    };

    explicit CorpoListingModel(QObject *parent = nullptr);


    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

public slots:
    void addCorpoListing(const QString& name,
                         const QString& experience,
                         const QString& goals,
                         const QString& team,
                         const QList<QString>& tags,
                         const QUrl& image,
                         const QString& contact);

signals:

private:
    QList<CorpoListingInfo*> m_corpoList;

};

#endif // CORPOLISTINGMODEL_H
