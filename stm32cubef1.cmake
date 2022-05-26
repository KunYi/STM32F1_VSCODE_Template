
add_library(stm32cubef1 INTERFACE)

set(STM32CUBE_F1_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Drivers)
set(STM32CUBEF1_HAL_DIR ${STM32CUBE_F1_DIR}/STM32F1xx_HAL_Driver)
set(STM32CUBEF1_HAL_SRC_DIR ${STM32CUBE_F1_DIR}/STM32F1xx_HAL_Driver/Src)

set(STM32CUBE_F1_INCLUDE_DIRS
    ${STM32CUBE_F1_DIR}/CMSIS/Include
    ${STM32CUBE_F1_DIR}/CMSIS/Device/ST/STM32F1xx/Include
    ${STM32CUBEF1_HAL_DIR}/Inc
    ${STM32CUBEF1_HAL_DIR}/Inc/Legacy
)

set(STM32CUBEF1_COMPILER_FLAGS  ${DEFINE_COMPILE_FLAGS})

target_include_directories(stm32cubef1 INTERFACE
    ${STM32CUBE_F1_INCLUDE_DIRS}
)

target_sources(stm32cubef1 INTERFACE
#
# STM32F1xx HAL Layer Libraries
#
    ${STM32CUBEF1_HAL_SRC_DIR}/Legacy/stm32f1xx_hal_can.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_adc_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_adc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_can.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_cec.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_cortex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_crc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_dac_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_dac.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_dma.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_eth.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_exti.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_eth.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_flash_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_flash.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_gpio_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_gpio.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_hcd.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_i2c.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_i2s.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_irda.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_iwdg.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_mmc.c
    # ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_msp_template.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_nor.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_pccard.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_pcd_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_pcd.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_pwr.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_rcc_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_rcc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_rtc_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_rtc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_sd.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_smartcard.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_spi.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_sram.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_tim_ex.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_tim.c
    # ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_timebase_rtc_alarm_template.c
    # ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_timebase_tim_template.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_uart.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_usart.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal_wwdg.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_hal.c
#
# STM32F1xx Low Layer Libraries
#
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_adc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_crc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_dac.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_dma.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_exti.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_fsmc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_gpio.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_i2c.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_pwr.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_rcc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_rtc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_sdmmc.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_spi.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_tim.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_usart.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_usb.c
    ${STM32CUBEF1_HAL_SRC_DIR}/stm32f1xx_ll_utils.c
)
