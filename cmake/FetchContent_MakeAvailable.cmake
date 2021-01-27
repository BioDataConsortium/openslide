
# FetchContent_MakeAvailable wasn't available before CMake 3.14
if(${CMAKE_VERSION} VERSION_LESS 3.14)
  macro(FetchContent_MakeAvailable NAME)
  FetchContent_GetProperties(${NAME})
  if(NOT ${NAME}_POPULATED)
    FetchContent_Populate(${NAME})
    add_subdirectory(${${NAME}_SOURCE_DIR} ${${NAME}_BINARY_DIR})
  endif()
  endmacro()
endif()