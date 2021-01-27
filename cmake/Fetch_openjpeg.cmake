# openjpeg has a png and tiff dependency
# you should have recieved the Fetch_libpng.cmake and
# Fetch_openjpeg file(s)
# at the same directory level as this (Fetch_openjpeg.cmake) file
macro(fetch_openjpeg_by_ver VER)
  message(STATUS "Fetching openjpeg...")
  # openjpeg library
  set(openjpeg_version ${VER})
  FetchContent_Declare(
    openjpeg
    GIT_REPOSITORY https://github.com/uclouvain/openjpeg.git
    GIT_TAG ${openjpeg_version})
  FetchContent_MakeAvailable(openjpeg)
  # openjpeg loaded?
  if(NOT openjpeg_POPULATED)
    message(FATAL_ERROR "openjpeg version ${openjpeg_version} not found!")
  endif()
  message(STATUS "openjpeg loaded - " ${openjpeg_POPULATED})
  message(STATUS "  srcdir    : " ${openjpeg_SOURCE_DIR})
  message(STATUS "  bindir    : " ${openjpeg_BINARY_DIR})
endmacro()

macro(fetch_openjpeg)
  fetch_openjpeg_by_ver(v2.3.1)
endmacro()