macro(fetch_sqlite)
  message(STATUS "Fetching sqlite...")
  # sqlite library
  set(sqlite_version version-3.24.0) #latest is 3.34.0
  FetchContent_Declare(
    sqlite
    GIT_REPOSITORY https://github.com/sqlite/sqlite.git
    GIT_TAG ${sqlite_version})
  FetchContent_MakeAvailable(sqlite)
  # add sqlite ??
  message(STATUS "sqlite loaded - ${sqlite_POPULATED}")
endmacro()