macro(fetch_glib_by_ver VER)
  message(STATUS "Fetching glib...")
  # glib library
  set(glib_version ${VER})
  FetchContent_Declare(
    glib
    GIT_REPOSITORY https://github.com/GNOME/glib.git
    GIT_TAG ${VER})
  # add glib
  FetchContent_MakeAvailable(glib)
  if(NOT glib_POPULATED)
    message(FATAL_ERROR "glib version ${VER} not found!")
  endif()
  message(STATUS "glib loaded - " ${glib_POPULATED})
  message(STATUS "  srcdir    : " ${glib_SOURCE_DIR})
  message(STATUS "  bindir    : " ${glib_BINARY_DIR})
endmacro()

macro(fetch_glib)
  fetch_glib_by_ver(2.56.1)
endmacro()