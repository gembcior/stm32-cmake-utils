if(NOT STM32_TOOLCHAIN)
  message(FATAL_ERROR "No STM32_TOOLCHAIN specified")
endif()

set(ARM_SIZE "${STM32_TOOLCHAIN}/bin/arm-none-eabi-size")
set(ARM_OBJDUMP "${STM32_TOOLCHAIN}/bin/arm-none-eabi-objdump")


function(STM32_TARGET_LISTING TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${ARM_OBJDUMP} -h -D ${TARGET}${TARGET_SUFFIX} > ${TARGET}.lst
  )
endfunction()


function(STM32_TARGET_SIZE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${ARM_SIZE} ${TARGET}${TARGET_SUFFIX}
  )
endfunction()


function(STM32_TARGET_INSTALL TARGET)
  install(TARGETS ${TARGET}
    CONFIGURATIONS Release
    RUNTIME DESTINATION Release/bin
  )

  install(TARGETS ${TARGET}
    CONFIGURATIONS Debug
    RUNTIME DESTINATION Debug/bin
  )
endfunction()


function(STM32_TARGET_APP_RELEASE TARGET)
  stm32_target_size(${TARGET})
  stm32_target_listing(${TARGET})
  stm32_target_install(${TARGET})
endfunction()


# For Vim YouCompleteMe plugin purpose
# Create symbolic link to compile_commands.json
function(LINK_COMPILE_COMMANDS_FILE TARGET)
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND find ${CMAKE_BINARY_DIR} -type f -name "compile_commands.json" -exec ln -sf {} ${CMAKE_SOURCE_DIR} "\;"
  )
endfunction()
