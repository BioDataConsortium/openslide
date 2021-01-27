cmake_minimum_required(VERSION 3.14)

include(GNUInstallDirs)

get_filename_component(PARENT_DIR ${CMAKE_CURRENT_LIST_DIR} DIRECTORY)

message(STATUS "Writing out openslide.pc file '${CMAKE_CURRENT_BINARY_DIR}/openslide.pc'...")
set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix ${CMAKE_INSTALL_PREFIX}/openslide/bin)
set(libdir ${CMAKE_INSTALL_PREFIX}/openslide/lib)
set(includedir ${CMAKE_INSTALL_PREFIX}/openslide/include)
set(VERSION ${PROJECT_VERSION})
configure_file(${PARENT_DIR}/openslide.pc.in "${CMAKE_CURRENT_BINARY_DIR}/openslide.pc" @ONLY)

find_package(ZLIB REQUIRED)
#target_link_libraries(main PRIVATE ZLIB::ZLIB)

find_package(libzip CONFIG REQUIRED)
#target_link_libraries(main PRIVATE libzip::zip)

find_package(libpng CONFIG REQUIRED)
#target_link_libraries(main PRIVATE png)

find_package(JPEG)
#target_link_libraries(main PRIVATE ${JPEG_LIBRARIES})
#target_include_directories(main PRIVATE ${JPEG_INCLUDE_DIR})

find_package(Iconv REQUIRED)

find_package(unofficial-glib CONFIG REQUIRED)
# Note: 1 target(s) were omitted.
#target_link_libraries(main PRIVATE unofficial::glib::gio unofficial::glib::glib unofficial::glib::gmodule unofficial::glib::gobject)

find_package(TIFF REQUIRED)

find_package(OpenJPEG REQUIRED)
#target_link_libraries(main PRIVATE openjp2)

find_package(GDKPixBuf REQUIRED)
#target_link_libraries(main PRIVATE ${GDKPIXBUF_LIBRARY})
#target_include_directories(main PRIVATE ${GDKPIXBUF_INCLUDE_DIR})

find_package(unofficial-pixman CONFIG REQUIRED)
#target_link_libraries(main PRIVATE unofficial::pixman::pixman-1)

# hmmm iconv cannot be found from this dir
#find_package(Iconv REQUIRED)
#target_link_libraries(main PRIVATE Iconv::Iconv)

find_package(Cairo REQUIRED)
#target_link_libraries(main PRIVATE CAIRO_LIBRARY)

find_package(unofficial-sqlite3 CONFIG REQUIRED)
#target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)

find_package(LibXml2 REQUIRED)
#target_include_directories(main PRIVATE ${LIBXML2_INCLUDE_DIR})
#target_link_libraries(main PRIVATE ${LIBXML2_LIBRARIES})


file(GLOB lib_c_src
    ${CMAKE_CURRENT_SOURCE_DIR}/*.c
)

add_library(openslide ${lib_c_src})
target_include_directories(openslide PRIVATE
${png_SOURCE_DIR} ${png_BINARY_DIR}
${JPEG_INCLUDE_DIR}
${GDKPIXBUF_INCLUDE_DIR}
                                        ${CAIRO_INCLUDE_DIR}
                                        ${LIBXML2_INCLUDE_DIR}
)
target_link_libraries(openslide PRIVATE
ZLIB::ZLIB
png
${JPEG_LIBRARIES}
TIFF
openjp2
${GDKPIXBUF_LIBRARY}
                                    ${CAIRO_LIBRARY}
                                    unofficial::sqlite3::sqlite3
                                    ${LIBXML2_LIBRARIES}
                                    unofficial::glib::glib
)
#target_include_directories(openslide
#  PUBLIC ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_BINARY_DIR}
#  PRIVATE ${linked_libs_private_includes}
#)
target_compile_features(openslide PUBLIC c_std_11 c_variadic_macros)
#target_link_libraries(openslide PRIVATE ${linked_libs})