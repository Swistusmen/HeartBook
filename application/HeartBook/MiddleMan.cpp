#include "MiddleMan.h"
#include <QDebug>

MiddleMan::MiddleMan(QObject *parent)
    : QObject{parent}
{}

void MiddleMan::sendLoginRequest(const QString &email, const QString &password)
{
    qDebug() << "Email:" << email <<"; Password:" << password;
}

void MiddleMan::sendSignupRequest(const QString &email, const QString &password)
{
    qDebug() << "Email:" << email <<"; Password:" << password;
}
