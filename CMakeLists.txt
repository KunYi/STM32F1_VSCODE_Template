
cmake_minimum_required(VERSION 3.15.3)

set(PROJ_DIR             ${CMAKE_CURRENT_SOURCE_DIR})
# Path to toolchain file. This one has to be before 'project()' below
set(CMAKE_TOOLCHAIN_FILE ${PROJ_DIR}/arm-none-eabi-gcc.cmake)

project(PLC_S)

set(EXECUTABLE ${PROJECT_NAME}.elf)
set(LINKER_FILE ${PROJ_DIR}/STM32F103RCTX_FLASH.ld)

message("Build type: "              ${CMAKE_BUILD_TYPE})


#
# Symbols definition
#
set(symbols_c_SYMB
    "DEBUG"
    "STM32F103xE"
    # "USE_FULL_LL_DRIVER"
    "USE_HAL_DRIVER"
    "HSE_VALUE=8000000"
    "HSE_STARTUP_TIMEOUT=100"
    "LSE_STARTUP_TIMEOUT=5000"
    "LSE_VALUE=32768"
    "HSI_VALUE=64000000"
    "LSI_VALUE=40000"
)

set(DEFINE_COMPILE_FLAGS
    -mcpu=cortex-m3
    -mthumb

    -fdata-sections
    -ffunction-sections

    -Wall
    -Wextra
    # -Wpedantic
    -Wno-unused-parameter

    $<$<COMPILE_LANGUAGE:C>:

    >
    $<$<COMPILE_LANGUAGE:CXX>:
        #-Wno-volatile
        #-Wold-style-cast
        #-Wuseless-cast
        #-Wsuggest-override
    >
    $<$<COMPILE_LANGUAGE:ASM>:
        -x assembler-with-cpp
        -MMD
        -MP
    >
    $<$<CONFIG:Debug>:
        -Og -g3 -ggdb
    >
    $<$<CONFIG:Release>:
        -Og -g0
    >
)

enable_language(C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD              20)
set(CMAKE_CXX_STANDARD_REQUIRED     ON)
set(CMAKE_CXX_EXTENSIONS            ON)

include(stm32cubef1.cmake)

set(STARTUP_DIR ${PROJ_DIR}/Core/Startup)
set(CORE_DIR    ${PROJ_DIR}/Core)

set(SRC_FILES
    ${STARTUP_DIR}/startup_stm32f103rctx.s
    ${CORE_DIR}/Src/main.c
    ${CORE_DIR}/Src/stm32f1xx_hal_msp.c
    ${CORE_DIR}/Src/stm32f1xx_it.c
    ${CORE_DIR}/Src/syscalls.c
    ${CORE_DIR}/Src/sysmem.c
    ${CORE_DIR}/Src/system_stm32f1xx.c
)

# Build the executable based on the source files
add_executable(${EXECUTABLE} ${SRC_FILES})

target_link_libraries(${EXECUTABLE}
    stm32cubef1
)

# List of includ directories
target_include_directories(${EXECUTABLE} PRIVATE
    stm32cubef1
    ${CORE_DIR}/Inc
)

#
# Project symbols
#
target_compile_definitions(${EXECUTABLE} PRIVATE
    # Language specific only
    $<$<COMPILE_LANGUAGE:C>: ${symbols_c_SYMB}>
    #$<$<COMPILE_LANGUAGE:CXX>: ${symbols_cxx_SYMB}>
    #$<$<COMPILE_LANGUAGE:ASM>: ${symbols_asm_SYMB}>

    # Configuration specific
    $<$<CONFIG:Debug>:
        DEBUG
    >
    $<$<CONFIG:Release>: >
)

# Compiler options
target_compile_options(${EXECUTABLE} PRIVATE
    ${DEFINE_COMPILE_FLAGS}
)

# Linker options
target_link_options(${EXECUTABLE} PRIVATE
    -T${LINKER_FILE}
	-mcpu=cortex-m3
    -mthumb

    -specs=nano.specs
    -specs=nosys.specs
    -lc
    -lm
    -Wl,-Map=${PROJECT_NAME}.map,--cref
    -Wl,--gc-sections
    -Xlinker -print-memory-usage -Xlinker
)

# Optional: Print executable size as part of the post build process
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND ${CMAKE_SIZE_UTIL} ${EXECUTABLE})

# Optional: Create hex, bin and S-Record files after the build
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O ihex ${EXECUTABLE} ${PROJECT_NAME}.hex
        COMMAND ${CMAKE_OBJCOPY} -O binary ${EXECUTABLE} ${PROJECT_NAME}.bin)
