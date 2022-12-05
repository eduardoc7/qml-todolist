
#include "todolist.h"
#include "todomodel.h"

ToDoModel::ToDoModel(QObject *parent) : QAbstractListModel(parent) {
  qInfo("-- Contructor ToDoModel");
}

auto ToDoModel::rowCount(const QModelIndex &parent) const -> int {
  // For list models only the root node (an invalid parent) should return the
  // list's size. For all other (valid) parents, rowCount() should return 0 so
  // that it does not become a tree model.
  if (parent.isValid() || (m_list == nullptr)) {
    return 0;
  }

  return m_list->items().size();
}

auto ToDoModel::data(const QModelIndex &index, int role) const -> QVariant {
  qInfo() << "-- ToDoModel::data [index]=" << index << "[role]=" << role;

  if (!index.isValid() || (m_list == nullptr)) {
    return {};
  }

  const ToDoItem item = m_list->items().at(index.row());
  switch (role) {
  case DoneRole:
    return {item.done};
  case TitleRole:
    return QVariant(item.title);
  }

  return {};
}

auto ToDoModel::setData(const QModelIndex &index, const QVariant &value,
                        int role) -> bool {
  qInfo() << "-- ToDoModel::setData "
             "[index]="
          << index << "[value]=" << value << "[role]=" << role;

  if (m_list == nullptr) {
    return false;
  }

  ToDoItem item = m_list->items().at(index.row());

  switch (role) {
  case DoneRole:
    item.done = value.toBool();
    break;
  case TitleRole:
    item.title = value.toString();
    break;
  }

  if (m_list->setItemAt(index.row(), item)) {
    emit dataChanged(index, index, QVector<int>() << role);
    return true;
  }

  return false;
}

auto ToDoModel::flags(const QModelIndex &index) const -> Qt::ItemFlags {
  if (!index.isValid()) {
    return Qt::NoItemFlags;
  }

  return Qt::ItemIsEditable;
}

auto ToDoModel::roleNames() const -> QHash<int, QByteArray> {
  qInfo("-- ToDoModel::roleNames()");
  QHash<int, QByteArray> names;
  names[DoneRole] = "done";
  names[TitleRole] = "title";

  return names;
}

auto ToDoModel::list() const -> ToDoList * { return m_list; }

void ToDoModel::setList( ToDoList* list ) {
    beginResetModel();

    if (m_list != nullptr) {
      m_list->disconnect(this);
    }

    m_list = list;

    if (m_list != nullptr) {
      connect(m_list, &ToDoList::preItemAppended, this, [=]() {
        const int index = m_list->items().size();
        beginInsertRows(QModelIndex(), index, index);
      });
      connect(m_list, &ToDoList::postItemAppended, this,
              [=]() { endInsertRows(); });
      connect(m_list, &ToDoList::preItemRemoved, this,
              [=](int index) { beginRemoveRows(QModelIndex(), index, index); });
      connect(m_list, &ToDoList::postItemRemoved, this,
              [=]() { endRemoveRows(); });
    }

    endResetModel();
}
