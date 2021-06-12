function(STM32_TARGET_ADD_TEST TARGET)
  include(GoogleTest)

  add_executable(${TARGET}_test ${ARGN})

  target_include_directories(${TARGET}_test
    PRIVATE
      ${CMAKE_CURRENT_SOURCE_DIR}
  )

  target_link_libraries(${TARGET}_test
    PRIVATE
      gtest
      gmock
      ${TARGET}
  )

  gtest_discover_tests(${TARGET}_test)
endfunction()


function(STM32_TARGET_TEST_LINK_LIBRARIES TARGET)
  target_link_libraries(${TARGET}_test
    PRIVATE
      ${ARGN}
  )
endfunction()


function(STM32_TARGET_TEST_LINK_MOCK_LIBRARIES TARGET)
  FOREACH (lib ${ARGN})
    LIST(APPEND MOCKS "${lib}_mock")
  ENDFOREACH()

  target_link_libraries(${TARGET}_test
    PRIVATE
      ${MOCKS}
  )
endfunction()


function(STM32_TARGET_ADD_MOCK_LIBRARY TARGET)
  add_library(${TARGET}_mock INTERFACE)

  target_include_directories(${TARGET}_mock
    INTERFACE
      ${CMAKE_CURRENT_SOURCE_DIR}/mock
  )

  target_link_libraries(${TARGET}_mock
    INTERFACE
      gtest
      gmock
      ${TARGET}
  )
endfunction()


function(STM32_TARGET_MOCK_LINK_LIBRARIES TARGET)
  target_link_libraries(${TARGET}_mock
    INTERFACE
      ${ARGN}
  )
endfunction()
