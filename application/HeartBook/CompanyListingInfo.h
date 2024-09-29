#ifndef COMPANYLISTINGINFO_H
#define COMPANYLISTINGINFO_H

#include <QObject>
#include <QUrl>

class CompanyListingInfo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString companyName READ companyName WRITE setCompanyName NOTIFY companyNameChanged FINAL)
    Q_PROPERTY(QString companyStrategies READ companyStrategies WRITE setCompanyStrategies NOTIFY companyStrategiesChanged FINAL)
    Q_PROPERTY(QString companyBudget READ companyBudget WRITE setCompanyBudget NOTIFY companyBudgetChanged FINAL)
    Q_PROPERTY(QString companyLooking READ companyLooking WRITE setCompanyLooking NOTIFY companyLookingChanged FINAL)
    Q_PROPERTY(QString companyGrants READ companyGrants WRITE setCompanyGrants NOTIFY companyGrantsChanged FINAL)
    Q_PROPERTY(QUrl companyImage READ companyImage WRITE setCompanyImage NOTIFY companyImageChanged FINAL)
    Q_PROPERTY(QList<QString> companyTags READ companyTags WRITE setCompanyTags NOTIFY companyTagsChanged FINAL)
    Q_PROPERTY(QString companyContact READ companyContact WRITE setCompanyContact NOTIFY companyContactChanged FINAL)

public:
    explicit CompanyListingInfo(QObject *parent = nullptr);

    QString companyName() const;
    void setCompanyName(const QString &newCompanyName);

    QString companyStrategies() const;
    void setCompanyStrategies(const QString &newCompanyStrategies);

    QString companyBudget() const;
    void setCompanyBudget(const QString &newCompanyBudget);

    QString companyLooking() const;
    void setCompanyLooking(const QString &newCompanyLooking);

    QString companyGrants() const;
    void setCompanyGrants(const QString &newCompanyGrants);

    QUrl companyImage() const;
    void setCompanyImage(const QUrl &newCompanyImage);

    QList<QString> companyTags() const;
    void setCompanyTags(const QList<QString> &newCompanyTags);

    QString companyContact() const;
    void setCompanyContact(const QString &newCompanyContact);

signals:
    void companyNameChanged();
    void companyStrategiesChanged();

    void companyBudgetChanged();

    void companyLookingChanged();

    void companyGrantsChanged();

    void companyImageChanged();

    void companyTagsChanged();

    void companyContactChanged();

private:
    QString m_companyName;
    QString m_companyStrategies;
    QString m_companyBudget;
    QString m_companyLooking;
    QString m_companyGrants;
    QUrl m_companyImage = QUrl("qrc:/res/assets/icons/icon_company.svg");
    QList<QString> m_companyTags;
    QString m_companyContact;
};

#endif // COMPANYLISTINGINFO_H
