set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER "${STM32_TOOLCHAIN}/bin/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${STM32_TOOLCHAIN}/bin/arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "${STM32_TOOLCHAIN}/bin/arm-none-eabi-gcc")
set(CMAKE_AR "${STM32_TOOLCHAIN}/bin/arm-none-eabi-ar")
set(CMAKE_RANLIB "${STM32_TOOLCHAIN}/bin/arm-none-eabi-ranlib")
set(STM32_OBJCOPY "${STM32_TOOLCHAIN}/bin/arm-none-eabi-objcopy")
set(STM32_OBJDUMP "${STM32_TOOLCHAIN}/bin/arm-none-eabi-objdump")
set(STM32_SIZE "${STM32_TOOLCHAIN}/bin/arm-none-eabi-size")
set(STM32_NM "${STM32_TOOLCHAIN}/bin/arm-none-eabi-nm")
set(STM32_STRIP "${STM32_TOOLCHAIN}/bin/arm-none-eabi-strip")

set(CMAKE_C_FLAGS_DEBUG "-Og -g3")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3")
set(CMAKE_ASM_FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_ASM_FLAGS_RELEASE "-O2")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
