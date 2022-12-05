#include <QDebug>
#include "todolist.h"

ToDoList::ToDoList( QObject* parent ) :
    QObject( parent ) {
    m_items.append( { true, QStringLiteral( "Explore Basic QML Concepts" ) } );
    m_items.append( { true, QStringLiteral( "Learn QML Model Data" ) } );
    m_items.append( { true, QStringLiteral( "Learn Property Attributes" ) } );
    m_items.append( { true, QStringLiteral( "Learn QML Basic Types" ) } );
    m_items.append( { true, QStringLiteral( "Learn Basic Signal/Slots Syntax" ) } );
}

auto ToDoList::items()->QVector<ToDoItem> const {
    return m_items;
}

int ToDoList::countDoneItems() {
    if ( m_items.size() == 0 ) {
        return 0;
    }

    return std::count_if( m_items.begin(), m_items.end(), []( ToDoItem el ) {
        return el.done;
    } );
}

auto ToDoList::setItemAt( int index, const ToDoItem& item )->bool {
    qInfo() << "-- ToDoList::setItemAt [index]=" << index << "[item]=" << item.title << item.done;

    // index out of range
    if ( index < 0 || index >= m_items.size() ) {
        return false;
    }

    const ToDoItem& oldItem = m_items.at( index );

    if ( item.done == oldItem.done && item.title == oldItem.title ) {
        return false;
    }

    m_items[index] = item;

    return true;
}

void ToDoList::appendItem( const QString& title ) {
    emit preItemAppended();

    ToDoItem item;
    item.title = title;
    item.done = false;
    m_items.append( item );

    emit postItemAppended();
}

void ToDoList::removeItemFromList( const int& index ) {
    emit preItemRemoved( index );

    m_items.removeAt( index );

    emit postItemRemoved();
}
