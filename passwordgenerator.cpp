#include <QRandomGenerator>
#include <QtMath>
#include <algorithm>
#include "passwordgenerator.h"

PasswordGenerator::PasswordGenerator(QObject *parent)
    : QObject(parent)
{
}

static QChar randomChar(const QString &set)
{
    return set.at(QRandomGenerator::global()->bounded(set.size()));
}

QString PasswordGenerator::generate(
    int length,
    bool upper,
    bool lower,
    bool numbers,
    bool symbols
    ) {
    if (length <= 0)
        return "";

    QString upperSet  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    QString lowerSet  = "abcdefghijklmnopqrstuvwxyz";
    QString numberSet = "0123456789";
    QString symbolSet = "!@#$%^&*()-_=+[]{}<>?/";

    QStringList enabledSets;
    QString all;

    if (upper)   { enabledSets << upperSet;  all += upperSet; }
    if (lower)   { enabledSets << lowerSet;  all += lowerSet; }
    if (numbers) { enabledSets << numberSet; all += numberSet; }
    if (symbols) { enabledSets << symbolSet; all += symbolSet; }

    if (enabledSets.isEmpty())
        return "";

    QString result;
    result.reserve(length);

    for (const QString &set : std::as_const(enabledSets)) {
        if (result.size() < length)
            result.append(randomChar(set));
    }

    while (result.size() < length)
        result.append(randomChar(all));

    std::shuffle(result.begin(), result.end(), *QRandomGenerator::global());
    return result;
}
