# - Try to find Awesomium.
# Once done this will define:
#  AWESOMIUM_FOUND - The system found the Awesomium library.
#  AWESOMIUM_INCLUDE_DIRS - The Awesomium include directory.
#  AWESOMIUM_LIBRARIES - The libraries needed to use Awesomium.

set(AWE_SEARCH_PATHS 
	$ENV{AWE_DIR}
	/usr/local/
	/usr/)

find_path(AWESOMIUM_INCLUDE_DIR Awesomium/WebCore.h
	HINTS $ENV{AWE_DIR}
	PATH_SUFFIXES include
    PATHS ${AWE_SEARCH_PATHS})

find_library(AWESOMIUM_LIBRARY
    NAMES awesomium
	HINTS $ENV{AWE_DIR}
	PATH_SUFFIXES lib64 lib build/lib
    PATHS ${AWE_SEARCH_PATHS})

set(AWESOMIUM_LIBRARIES ${AWESOMIUM_LIBRARY})
set(AWESOMIUM_INCLUDE_DIRS ${AWESOMIUM_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Awesomium DEFAULT_MSG AWESOMIUM_LIBRARY AWESOMIUM_INCLUDE_DIR)

mark_as_advanced(AWESOMIUM_INCLUDE_DIR AWESOMIUM_LIBRARY)
