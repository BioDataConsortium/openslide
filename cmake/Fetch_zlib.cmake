macro(fetch_zlib_by_ver VER)
  include(FetchContent)
  if(NOT ZLIB_FOUND)
    find_package(ZLIB)
  endif(NOT ZLIB_FOUND)
  if (NOT ZLIB_FOUND)
    message(STATUS "Fetching zlibg (${VER})...")
    # zlib library
    set(zlib_version ${VER})
    FetchContent_Declare(
      zlib
      GIT_REPOSITORY https://github.com/madler/zlib.git
      GIT_TAG ${zlib_version})
    FetchContent_MakeAvailable(zlib)

    if(NOT zlib_POPULATED)
      message(FATAL_ERROR "zlib version ${zlib_version} not found!")
    endif()
    message(STATUS "zlib loaded - " ${ZLIB})
    message(STATUS "  srcdir    : " ${zlib_SOURCE_DIR})
    message(STATUS "  bindir    : " ${zlib_BINARY_DIR})
    set(zlib_INCLUDE_DIR ${zlib_SOURCE_DIR})
  endif(NOT ZLIB_FOUND)
endmacro(fetch_zlib_by_ver VER)

macro(fetch_zlib)
  fetch_zlib_by_ver(v1.2.11)
endmacro(fetch_zlib)