cmake_minimum_required(VERSION 3.11...3.19)
project(
  openslide
  VERSION 3.4.1
  DESCRIPTION "openslide library"
  LANGUAGES C CXX)

include(GNUInstallDirs)

get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)

# FetchContent added in CMake 3.11, downloads during the configure step
include(FetchContent)
# add FetchContent_MakeAvalailable
include(${PARENT_DIR}/cmake/FetchContent_MakeAvailable.cmake)

# fetch zlib
include(${PARENT_DIR}/cmake/Fetch_zlib.cmake) 
# go and fetch the library
fetch_zlib()

# fetch libzip
include(${PARENT_DIR}/cmake/Fetch_libzip.cmake) 
# go and fetch the library
#fetch_libzip()

# fetch libpng
include(${PARENT_DIR}/cmake/Fetch_libpng.cmake) 
# go and fetch the library
fetch_libpng()
#set(PNG libpng)

# fetch libjpeg
include(${PARENT_DIR}/cmake/Fetch_libjpeg.cmake) 
# go and fetch the library
#fetch_libjpeg()

# fetch glib
include(${PARENT_DIR}/cmake/Fetch_glib.cmake) 
# go and fetch the library
#fetch_glib()

# fetch libtiff
include(${PARENT_DIR}/cmake/Fetch_libtiff.cmake) 
# go and fetch the library
#fetch_libtiff()

# fetch openjpeg
include(${PARENT_DIR}/cmake/Fetch_openjpeg.cmake) 
# go and fetch the library
#fetch_openjpeg()

# fetch GDK-Pixbuf
include(${PARENT_DIR}/cmake/Fetch_gdkpixbuf.cmake) 
# go and fetch the library
#fetch_gdkpixbuf()

# fetch PIXMAN
include(${PARENT_DIR}/cmake/Fetch_pixman.cmake) 
# go and fetch the library
#fetch_pixman()

# fetch win-iconv
include(${PARENT_DIR}/cmake/Fetch_iconv.cmake) 
# go and fetch the library
#fetch_iconv()

# fetch cairo
include(${PARENT_DIR}/cmake/Fetch_cairo.cmake) 
# go and fetch the library
#fetch_cairo()

# fetch sqlite
include(${PARENT_DIR}/cmake/Fetch_sqlite.cmake) 
# go and fetch the library
#fetch_sqlite()

# fetch libxml2
include(${PARENT_DIR}/cmake/Fetch_libxml2.cmake) 
# go and fetch the library
#fetch_libxml2()

add_executable(hello hello.cpp)
target_compile_features(hello PRIVATE cxx_std_14)
target_include_directories(hello PRIVATE ${zlib_SOURCE_DIR} ${zlib_BINARY_DIR})
target_link_libraries(hello PRIVATE zlib)
