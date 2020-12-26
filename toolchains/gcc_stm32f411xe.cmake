include(gcc_stm32)


string(CONCAT C_FLAGS
  "-mcpu=cortex-m4 "
  "-mfpu=fpv4-sp-d16 "
  "-mfloat-abi=hard "
  "-mabi=aapcs "
  "-mthumb "
  "-std=gnu11 "
  "-fno-builtin "
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
  "-ffunction-sections "
  "-fdata-sections "
  "-fno-exceptions "
  "-fstack-usage "
  "--specs=nano.specs "
  "-fomit-frame-pointer "
  "-fno-unroll-loops "
  "-ffast-math "
  "-ftree-vectorize "
)

string(CONCAT CXX_FLAGS
  "-mcpu=cortex-m4 "
  "-mfpu=fpv4-sp-d16 "
  "-mfloat-abi=hard "
  "-mabi=aapcs "
  "-mthumb "
  "-fno-builtin "
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
  "-ffunction-sections "
  "-fdata-sections "
  "-fno-exceptions "
  "-fno-rtti "
  "-fno-threadsafe-statics "
  "-fno-use-cxa-atexit "
  "-fstack-usage "
  "--specs=nano.specs "
  "-fomit-frame-pointer "
  "-fno-unroll-loops "
  "-ffast-math "
  "-ftree-vectorize "
)

string(CONCAT ASM_FLAGS
  "-mcpu=cortex-m4 "
  "-mfpu=fpv4-sp-d16 "
  "-mfloat-abi=hard "
  "-mabi=aapcs "
  "-mthumb "
  "-x assembler-with-cpp "
  "--specs=nano.specs "
)

string(CONCAT LINKER_FLAGS
  "-mcpu=cortex-m4 "
  "-mfpu=fpv4-sp-d16 "
  "-mfloat-abi=hard "
  "-mabi=aapcs "
  "-mthumb "
  "-Wl,--gc-sections "
  "-Wl,-lc,-lm "
  "-static "
  "--specs=nosys.specs "
)

set(CMAKE_C_FLAGS_INIT ${C_FLAGS})
set(CMAKE_CXX_FLAGS_INIT ${CXX_FLAGS})
set(CMAKE_ASM_FLAGS_INIT ${ASM_FLAGS})
set(CMAKE_EXE_LINKER_FLAGS_INIT ${LINKER_FLAGS})
set(CMAKE_MODULE_LINKER_FLAGS_INIT ${LINKER_FLAGS})
set(CMAKE_SHARED_LINKER_FLAGS_INIT ${LINKER_FLAGS})
