#ifndef COMPANYLISTINGMODEL_H
#define COMPANYLISTINGMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QUrl>

class CompanyListingInfo;

class CompanyListingModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        CompanyNameRole = Qt::UserRole + 1,
        CompanyStrategiesRole,
        CompanyBudgetRole,
        CompanyLookingRole,
        CompanyGrantsRole,
        CompanyImageRole,
        CompanyTagsRole,
        CompanyContactRole
    };


    explicit CompanyListingModel(QObject *parent = nullptr);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

public slots:
    void addCompanyListing(const QString& name,
                           const QString& strategies,
                           const QString& budget,
                           const QString& looking,
                           const QString& grants,
                           const QUrl& image,
                           const QList<QString>& tags,
                           const QString& contact);

signals:

private:
    QList<CompanyListingInfo*> m_companyList;

};

#endif // COMPANYLISTINGMODEL_H
