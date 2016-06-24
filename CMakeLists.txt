cmake_minimum_required(VERSION 2.8)
project(AwesomiumExample)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/)

if (MSVC)
	add_definitions(-DUNICODE -D_UNICODE -DWIN32 -D_WIN32)
endif ()

# Source files.
set(SOURCES
	src/application.h
	src/application_win.cc
	src/js_delegate.h
	src/main.cc
	src/method_dispatcher.h
	src/view.h
	src/view_win.cc
)
# End of source files.

find_package(Awesomium REQUIRED)

file(COPY data/. DESTINATION ${CMAKE_CURRENT_BINARY_DIR}) # Copy data to build folder.

include_directories(${AWESOMIUM_INCLUDE_DIRS})

add_executable(AwesomiumExample ${SOURCES})

if (MSVC)
	set_target_properties(AwesomiumExample PROPERTIES LINK_FLAGS_DEBUG "/SUBSYSTEM:windows")
	set_target_properties(AwesomiumExample PROPERTIES LINK_FLAGS_RELEASE "/SUBSYSTEM:windows")
endif ()

target_link_libraries(AwesomiumExample ${AWESOMIUM_LIBRARIES})
