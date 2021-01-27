macro(fetch_gdkpixbuf_by_ver VER)
  message(STATUS "Fetching gdk-pixbuf...")
  # GDK-Pixbuf library
  set(gdk-pixbuf_version ${VER})
  FetchContent_Declare(
    gdk-pixbuf
    GIT_REPOSITORY https://gitlab.gnome.org/GNOME/gdk-pixbuf.git
    GIT_TAG ${gdk-pixbuf_version})
  FetchContent_MakeAvailable(gdk-pixbuf)
  if(NOT gdk-pixbuf_POPULATED)
    message(FATAL_ERROR "gdk-pixbuf version ${gdk-pixbuf_version} not found!")
  endif()
  message(STATUS "gdk-pixbuf loaded - " ${gdk-pixbuf_POPULATED})
  message(STATUS "  srcdir    : " ${gdk-pixbuf_SOURCE_DIR})
  message(STATUS "  bindir    : " ${gdk-pixbuf_BINARY_DIR})
endmacro()

macro(fetch_gdkpixbuf)
  fetch_gdkpixbuf_by_ver(2.42.2)
endmacro()