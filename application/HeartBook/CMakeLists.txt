cmake_minimum_required(VERSION 3.16)

project(HeartBook VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appHeartBook
    main.cpp
)

qt_add_qml_module(appHeartBook
    URI HeartBook
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES AppStyle.qml
        QML_FILES MainHeader.qml
        RESOURCES res.qrc
        QML_FILES ColoredIcon.qml
        QML_FILES PureSquareButton.qml
        QML_FILES ScrollablePage.qml
        QML_FILES SharpSquareButton.qml
        QML_FILES ColoredInputSingle.qml
        SOURCES MiddleMan.h MiddleMan.cpp
        SOURCES
        SOURCES
        QML_FILES ColoredInputMulti.qml
        QML_FILES NGOListingCreator.qml
        SOURCES CorpoListingInfo.h CorpoListingInfo.cpp
        QML_FILES ColoredInputSingle2.qml
        SOURCES CorpoListingModel.h CorpoListingModel.cpp
        SOURCES CompanyListingInfo.h CompanyListingInfo.cpp
        SOURCES CompanyListingModel.h CompanyListingModel.cpp
        QML_FILES CorporationListingCreator.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHeartBook PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHeartBook
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHeartBook
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appHeartBook
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
