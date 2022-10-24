#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "todomodel.h"
#include "todolist.h"

int main( int argc, char* argv[] ) {
    QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );

    QGuiApplication app( argc, argv );

    // perimite criar um modulo para ser importado e usado dentro do qml
    // import ToDo 1.0. 1 major version. 0 minor version.
    qmlRegisterType<ToDoModel>( "ToDo", 1, 0, "ToDoModel" );

    // força o nosso model toDoList ser usado apenas no backend e não nos arquivos qml
    qmlRegisterUncreatableType<ToDoList>( "ToDo", 1, 0, "ToDoList", QStringLiteral( "ToDoList should not be created in QML file" ) );

    ToDoList toDoList;
    QQmlApplicationEngine engine;

    // torna o objeto toDoList disponível em todos os qml files da aplicação
    engine.rootContext()->setContextProperty( QStringLiteral( "toDoList" ), &toDoList );

    const QUrl url( QStringLiteral( "qrc:/main.qml" ) );
    QObject::connect( &engine, &QQmlApplicationEngine::objectCreated,
                      &app, [url]( QObject* obj, const QUrl& objUrl ) {
        if ( !obj && url == objUrl )
            QCoreApplication::exit( -1 );
    }, Qt::QueuedConnection );
    engine.load( url );

    return app.exec();
}
