macro(fetch_doxygen_by_ver VER)
  include(FetchContent)
  if (NOT Doxygen_FOUND)
    find_package(Doxygen)
  endif(NOT Doxygen_FOUND)
  if (NOT Doxygen_FOUND)
    message(STATUS "Fetching Doxygen (${VER})...")
    # Doxygen library
    FetchContent_Declare(
      Doxygen
      GIT_REPOSITORY https://github.com/doxygen/doxygen.git
      GIT_TAG ${VER})
    FetchContent_MakeAvailable(Doxygen)

    if(NOT Doxygen_POPULATED)
      message(FATAL_ERROR "Doxygen version ${VER} not found!")
    endif()
    message(STATUS "Doxygen loaded - " ${Doxygen})
    message(STATUS "  srcdir    : " ${Doxygen_SOURCE_DIR})
    message(STATUS "  bindir    : " ${Doxygen_BINARY_DIR})
    set(Doxygen_INCLUDE_DIR ${Doxygen_SOURCE_DIR})
  endif(NOT Doxygen_FOUND)
endmacro(fetch_doxygen_by_ver VER)

macro(fetch_doxygen)
  fetch_doxygen_by_ver(Release-1.8.20)
endmacro(fetch_doxygen)