#ifndef HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOLIST_H
#define HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOLIST_H

struct ToDoItem {
  bool done{};
  QString title;
} __attribute__((aligned(16)));

/**
 * @brief Objeto personalido criado para representar o tipo da minha todolist
 */
class ToDoList : public QObject {
    Q_OBJECT
public:
  explicit ToDoList(QObject *parent);

  // para o model ter acesso a lista
  auto items() -> QVector<ToDoItem> const;

  auto setItemAt(int index, const ToDoItem &item) -> bool;

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved( int index );
    void postItemRemoved();

public slots:
  auto countDoneItems() -> int;
  void appendItem(const QString &title);
  void removeItemFromList(const int &index);

private:
    QVector<ToDoItem> m_items;
};

#endif // HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOLIST_H
