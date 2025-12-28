#pragma once
#include <QObject>

class PasswordGenerator : public QObject
{
    Q_OBJECT
public:
    explicit PasswordGenerator(QObject *parent = nullptr);

    Q_INVOKABLE QString generate(
        int length,
        bool upper,
        bool lower,
        bool numbers,
        bool symbols
        );
};
