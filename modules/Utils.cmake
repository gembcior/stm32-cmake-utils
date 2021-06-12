function(STM32_FILE_INSTALL FILE)
  install(FILES ${FILE}
    DESTINATION Release/etc
    CONFIGURATIONS Release
  )
  install(FILES ${FILE}
    DESTINATION Debug/etc
    CONFIGURATIONS Debug
  )
endfunction()


function(STM32_TARGET_LISTING TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJDUMP} -h -D -C ${TARGET}${TARGET_SUFFIX} > ${TARGET}.lst
  )
  stm32_file_install(${TARGET}.lst)
endfunction()


function(STM32_TARGET_HEX_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJCOPY} -O ihex ${TARGET}${TARGET_SUFFIX} ${TARGET}.hex
  )
  stm32_file_install(${TARGET}.hex)
endfunction()


function(STM32_TARGET_BIN_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND
    ${STM32_OBJCOPY} -O binary ${TARGET}${TARGET_SUFFIX} ${TARGET}.bin
  )
  stm32_file_install(${TARGET}.bin)
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
