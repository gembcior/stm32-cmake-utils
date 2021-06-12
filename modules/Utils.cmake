function(STM32_TARGET_LISTING TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJDUMP} -h -D -C ${TARGET}${TARGET_SUFFIX} > ${TARGET}.lst
  )
endfunction()


function(STM32_TARGET_HEX_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJCOPY} -O ihex ${TARGET}${TARGET_SUFFIX} ${TARGET}.hex
  )
endfunction()


function(STM32_TARGET_BIN_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJCOPY} -O binary ${TARGET}${TARGET_SUFFIX} ${TARGET}.bin
  )
endfunction()


function(STM32_TARGET_SIZE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_SIZE} ${TARGET}${TARGET_SUFFIX}
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
  set_property(TARGET ${TARGET} PROPERTY SUFFIX .elf)
  stm32_target_size(${TARGET})
  stm32_target_hex_file(${TARGET})
  stm32_target_bin_file(${TARGET})
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
