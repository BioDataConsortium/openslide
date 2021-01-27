macro(fetch_cairo)
  message(STATUS "Fetching cairo...")
  # cairo library
  set(cairo_version 1.14.12)
  FetchContent_Declare(
    cairo
    GIT_REPOSITORY https://gitlab.freedesktop.org/cairo/cairo.git
    GIT_TAG ${cairo_version})
  FetchContent_MakeAvailable(cairo)
  # add cairo ??
  message(STATUS "cairo loaded - ${cairo_POPULATED}")
endmacro()