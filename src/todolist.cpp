#include "todolist.h"
#include <QDebug>

ToDoList::ToDoList(QObject *parent) : QObject(parent) {
  m_items.append({true, QStringLiteral("Explore Basic QML Concepts")});
  m_items.append({true, QStringLiteral("Learn QML Model Data")});
  m_items.append({true, QStringLiteral("Learn Property Attributes")});
  m_items.append({true, QStringLiteral("Learn QML Basic Types")});
  m_items.append({true, QStringLiteral("Learn Basic Signal/Slots Syntax")});
}

QVector<ToDoItem> ToDoList::items() const { return m_items; }

auto ToDoList::countDoneItems() -> int {
  if (m_items.empty()) {
    return 0;
  }

  return std::count_if(m_items.begin(), m_items.end(),
                       [](const ToDoItem &el) { return el.done; });
}

auto ToDoList::setItemAt(int index, const ToDoItem &item) -> bool {
  qInfo() << "-- ToDoList::setItemAt [index]=" << index
          << "[item]=" << item.title << item.done;

  // index out of range
  if (index < 0 || index >= m_items.size()) {
    return false;
  }

  const ToDoItem &oldItem = m_items.at(index);

  if (item.done == oldItem.done && item.title == oldItem.title) {
    return false;
  }

  m_items[index] = item;

  return true;
}

void ToDoList::appendItem(const QString &title) {
  emit preItemAppended();

  m_items.append({false, QString(title)});

  emit postItemAppended();
}

void ToDoList::removeItemFromList(const int &index) {
  emit preItemRemoved(index);

  m_items.removeAt(index);

  emit postItemRemoved();
}
