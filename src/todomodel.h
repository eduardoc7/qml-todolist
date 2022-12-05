#ifndef HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOMODEL_H
#define HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOMODEL_H

#include <QAbstractListModel>

class ToDoList;
class ToDoModel : public QAbstractListModel {
  Q_OBJECT
  Q_PROPERTY(ToDoList *list READ list WRITE setList)

public:
  // NOLINTNEXTLINE
  explicit ToDoModel(QObject *parent = nullptr);

  enum { DoneRole = Qt::UserRole, TitleRole };

  // Basic functionality:
  auto rowCount(const QModelIndex &parent) const -> int override;

  auto data(const QModelIndex &index, int role) const -> QVariant override;

  // Editable:
  auto setData(const QModelIndex &index, const QVariant &value, int role)
      -> bool override;

  auto flags(const QModelIndex &index) const -> Qt::ItemFlags override;

  auto roleNames() const -> QHash<int, QByteArray> override;

  auto list() const -> ToDoList *;
  void setList(ToDoList *list);

private:
  ToDoList *m_list{nullptr};
};

#endif // HOME_RUNNER_WORK_QML_TODOLIST_QML_TODOLIST_SRC_TODOMODEL_H
