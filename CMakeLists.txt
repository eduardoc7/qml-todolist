cmake_minimum_required(VERSION 3.5)

project(todolistqml LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.qrc"
)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

if(ANDROID)
    add_library(todolistqml SHARED ${SOURCES})
else()
    add_executable(todolistqml ${SOURCES})
endif()

target_compile_definitions(todolistqml
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(todolistqml
  PRIVATE Qt5::Core Qt5::Quick)
