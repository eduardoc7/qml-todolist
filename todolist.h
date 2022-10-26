#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

struct ToDoItem {
    bool done;
    QString title;
};

/**
 * @brief Objeto personalido criado para representar o tipo da minha todolist
 */
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
    int countDoneItems();
    void appendItem( const QString& title );
    void removeCompletedItems();

private:
    QVector<ToDoItem> m_items;
};

#endif // TODOLIST_H
