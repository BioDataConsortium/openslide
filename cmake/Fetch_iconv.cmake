macro(fetch_iconv)
  message(STATUS "Fetching iconv...")
  # iconv library
  set(iconv_version v0.0.7) #latest is v0.0.8
  FetchContent_Declare(
    win-iconv
    GIT_REPOSITORY https://github.com/win-iconv/win-iconv.git
    GIT_TAG ${iconv_version})
  FetchContent_MakeAvailable(win-iconv)
  # add iconv ??
  message(STATUS "iconv loaded - ${win-iconv_POPULATED}")
endmacro()