macro(fetch_libjpeg_turbo_by_ver VER)
  message(STATUS "Fetching libjpeg-turbo...")
  # libjpeg library
  FetchContent_Declare(
    libjpeg-turbo
    GIT_REPOSITORY https://github.com/libjpeg-turbo/libjpeg-turbo.git
    GIT_TAG ${VER})
  # add libjpeg
  FetchContent_MakeAvailable(libjpeg-turbo)
  if(NOT libjpeg-turbo_POPULATED)
    message(FATAL_ERROR "libjpeg version ${VER} not found!")
  endif()
  message(STATUS "libjpeg-turbo loaded - " ${libjpeg-turbo_POPULATED})
  message(STATUS "  srcdir    : " ${libjpeg-turbo_SOURCE_DIR})
  message(STATUS "  bindir    : " ${libjpeg-turbo_BINARY_DIR})
endmacro()

macro(fetch_libjpeg_turbo)
  fetch_libjpeg_turbo_by_ver(2.0.6)
endmacro()