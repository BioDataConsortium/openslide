# libzip has a zlib dependency
# you should have recieved a Fetch_zlib.cmake file
# at the same directory level as this (Fetch_libzip.cmake) file
macro(fetch_libzip)
  message(STATUS "Fetching libzip...")
  # libzip library
  set(libzip_version rel-1-5-1)
  FetchContent_Declare(
    libzip
    GIT_REPOSITORY https://github.com/nih-at/libzip.git
    GIT_TAG ${libzip_version})
  FetchContent_MakeAvailable(libzip)
  # libzip loaded?
  message(STATUS "libzip loaded - ${libzip_POPULATED}")
endmacro()