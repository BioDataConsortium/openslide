macro(fetch_pixman_by_tag TAG)
  message(STATUS "Fetching pixman...")
  # pixman library
  set(pixman_tag ${TAG})
  FetchContent_Declare(
    pixman
    GIT_REPOSITORY https://gitlab.freedesktop.org/pixman/pixman.git
    GIT_TAG ${pixman_tag})
  FetchContent_MakeAvailable(pixman)
  if(NOT pixman_POPULATED)
    message(FATAL_ERROR "pixman tag ${pixman_tag} not found!")
  endif()
  message(STATUS "pixman loaded - " ${pixman_POPULATED})
  message(STATUS "  srcdir    : " ${pixman_SOURCE_DIR})
  message(STATUS "  bindir    : " ${pixman_BINARY_DIR})
endmacro()

macro(fetch_pixman)
  fetch_pixman_by_tag(pixman-0.34.0)
endmacro()