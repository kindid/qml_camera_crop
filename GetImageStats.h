///////////////////////////////////////////////////////////////////////////////
/// (C) kindid ltd 2018+ //////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#ifndef GETIMAGESTATS_H
#define GETIMAGESTATS_H

#include <QObject>
#include <QImage>

class GetImageStats : public QObject
{
    Q_OBJECT
public:
    explicit GetImageStats(QObject *parent = nullptr);

signals:

public slots:
    QString getState(const QImage & image) const;
};

#endif // GETIMAGESTATS_H
