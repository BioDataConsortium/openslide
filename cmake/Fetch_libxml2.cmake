macro(fetch_libxml2)
  message(STATUS "Fetching libxml2...")
  # libxml2 library
  set(libxml2_version v2.9.8) #latest is v2.9.10
  FetchContent_Declare(
    libxml2
    GIT_REPOSITORY https://gitlab.gnome.org/GNOME/libxml2.git
    GIT_TAG ${libxml2_version})
  FetchContent_MakeAvailable(libxml2)
  # add libxml2 ??
  message(STATUS "libxml2 loaded - ${libxml2_POPULATED}")
endmacro()