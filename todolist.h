#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

struct ToDoItem {
    bool done;
    QString title;
};

class ToDoList : public QObject {
    Q_OBJECT
public:
    explicit ToDoList( QObject* parent = nullptr );

    // para o model ter acesso a lista
    auto items()->QVector<ToDoItem> const;

    auto setItemAt( int index, const ToDoItem& item )->bool;

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved( int index );
    void postItemRemoved();

public slots:
    void appendItem();
    void removeCompletedItems();

private:
    QVector<ToDoItem> m_items;
};

#endif // TODOLIST_H
