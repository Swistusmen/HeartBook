#ifndef MIDDLEMAN_H
#define MIDDLEMAN_H

#include <QObject>

class MiddleMan : public QObject
{
    Q_OBJECT
public:
    explicit MiddleMan(QObject *parent = nullptr);

public slots:
    void sendLoginRequest(const QString& email, const QString& password);
    void sendSignupRequest(const QString& email, const QString& password);

signals:
};

#endif // MIDDLEMAN_H
