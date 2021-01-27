# libpng has a zlib dependency
# you should have recieved a Fetch_zlib.cmake file
# at the same directory level as this (Fetch_libpng.cmake) file
macro(fetch_libpng_by_ver VER)
  message(STATUS "Fetching libpng (${VER})...")
  # libpng library
  FetchContent_Declare(
    libpng
    GIT_REPOSITORY https://github.com/glennrp/libpng.git
    GIT_TAG ${VER})
  FetchContent_MakeAvailable(libpng)
  if(NOT libpng_POPULATED)
    message(FATAL_ERROR "libpng version ${VER} not found!")
  endif()
  message(STATUS "libpng loaded - " ${libpng_POPULATED})
  message(STATUS "  srcdir    : " ${libpng_SOURCE_DIR})
  message(STATUS "  bindir    : " ${libpng_BINARY_DIR})
 # set(PNG_PNG_INCLUDE_DIR ${libpng_SOURCE_DIR})
 # set(PNG_LIBRARY libpng)
 # set(png libpng)
 # set(PNG_INCLUDE_DIRS ${libpng_SOURCE_DIR} ${libpng_BINARY_DIR})
 # set(PNG_INCLUDE_DIR ${libpng_INCLUDE_DIRS})
endmacro()

macro(fetch_libpng)
  fetch_libpng_by_ver(v1.6.34)
endmacro()