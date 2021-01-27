# - Find cairo
# Find the cairo include directories and libraries
#
# This module defines
#   CAIRO_FOUND       - true if the following are found
#   CAIRO_INCLUDE_DIR - cairo include directory
#   CAIRO_LIBRARY     - cairo library location

find_package( PkgConfig )
if( PKG_CONFIG_FOUND )
    # If pkg-config finds cairo, this will set:
    #   PC_CAIRO_FOUND (to TRUE)
    #   PC_CAIRO_INCLUDEDIR
    #   PC_CAIRO_INCLUDE_DIRS
    #   PC_CAIRO_LIBDIR
    #   PC_CAIRO_LIBRARY_DIRS
    # These variables are then used as hints to find_path()
    # and find_library()
    pkg_search_module( PC_CAIRO cairo )
endif()

find_path( CAIRO_INCLUDE_DIR cairo/cairo.h
    HINTS
        # Hints provided by pkg-config
        ${PC_CAIRO_INCLUDEDIR}
        ${PC_CAIRO_INCLUDEDIR}/*
        ${PC_CAIRO_INCLUDE_DIRS}
    PATHS
        # Standard include directories
        /usr/include/
        /usr/local/include/
        # Search all subdirs of the above
        /usr/include/*
        /usr/local/include/*
    PATH_SUFFIXES
        # Subdirectory hints
        cairo
)

find_library( CAIRO_LIBRARY cairo
    HINTS
        # Hints provided by pkg-config
        ${PC_CAIRO_LIBDIR}
        ${PC_CAIRO_LIBRARY_DIRS}
)

include( FindPackageHandleStandardArgs )
# Sets CAIRO_FOUND to true if CAIRO_INCLUDE_DIR and
# CAIRO_LIBRARY are both set
find_package_handle_standard_args( Cairo DEFAULT_MSG
    CAIRO_LIBRARY
    CAIRO_INCLUDE_DIR
)
if( CAIRO_FOUND )
    message( STATUS "\tInclude directory: ${CAIRO_INCLUDE_DIR}" )
endif()

mark_as_advanced( CAIRO_INCLUDE_DIR CAIRO_LIBRARY )