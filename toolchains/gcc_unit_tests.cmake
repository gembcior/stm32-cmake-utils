set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

set(CMAKE_C_FLAGS_DEBUG "-Og -g3")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3")
set(CMAKE_ASM_FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_ASM_FLAGS_RELEASE "-O2")

string(CONCAT C_FLAGS
  "-std=gnu11 "
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
)

string(CONCAT CXX_FLAGS
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
)

set(CMAKE_C_FLAGS_INIT ${C_FLAGS})
set(CMAKE_CXX_FLAGS_INIT ${CXX_FLAGS})
