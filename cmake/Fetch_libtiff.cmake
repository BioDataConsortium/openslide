# libtiff has a zlib and jpeg dependency
# you should have recieved the Fetch_zlib.cmake and
# Fetch_libtiff file(s)
# at the same directory level as this (Fetch_libtiff.cmake) file
macro(fetch_libtiff_by_ver VER)
  message(STATUS "Fetching libtiff...")
  # libtiff library
  set(libtiff_version ${VER})
  FetchContent_Declare(
    libtiff
    GIT_REPOSITORY https://gitlab.com/libtiff/libtiff.git
    GIT_TAG ${VER}
    CFLAGS "${CFLAGS} -Doff64_t=_off64_t -D__USE_LARGEFILE64")
  FetchContent_MakeAvailable(libtiff)
  # libtiff loaded?
  if(NOT libtiff_POPULATED)
    message(FATAL_ERROR "libtiff version ${VER} not found!")
  endif()
  message(STATUS "libtiff loaded - " ${libtiff_POPULATED})
  message(STATUS "  srcdir    : " ${libtiff_SOURCE_DIR})
  message(STATUS "  bindir    : " ${libtiff_BINARY_DIR})
endmacro()

macro(fetch_libtiff)
  fetch_libtiff_by_ver(e0d707dc1524d8c0e20f03396f234e0f1b07b3f4)
endmacro()