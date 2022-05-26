/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define X4_Pin GPIO_PIN_0
#define X4_GPIO_Port GPIOA
#define X3_Pin GPIO_PIN_1
#define X3_GPIO_Port GPIOA
#define SW_RUN_Pin GPIO_PIN_2
#define SW_RUN_GPIO_Port GPIOA
#define RS485_RE_Pin GPIO_PIN_3
#define RS485_RE_GPIO_Port GPIOA
#define X7_Pin GPIO_PIN_6
#define X7_GPIO_Port GPIOA
#define X6_Pin GPIO_PIN_7
#define X6_GPIO_Port GPIOA
#define X5_Pin GPIO_PIN_4
#define X5_GPIO_Port GPIOC
#define LED_ERR_Pin GPIO_PIN_5
#define LED_ERR_GPIO_Port GPIOC
#define LED_RUN_Pin GPIO_PIN_0
#define LED_RUN_GPIO_Port GPIOB
#define RTC_SCL_Pin GPIO_PIN_13
#define RTC_SCL_GPIO_Port GPIOB
#define RTC_SDA_Pin GPIO_PIN_14
#define RTC_SDA_GPIO_Port GPIOB
#define X2_Pin GPIO_PIN_15
#define X2_GPIO_Port GPIOB
#define X1_Pin GPIO_PIN_6
#define X1_GPIO_Port GPIOC
#define X0_Pin GPIO_PIN_7
#define X0_GPIO_Port GPIOC
#define OUT0_Pin GPIO_PIN_9
#define OUT0_GPIO_Port GPIOC
#define OUT1_Pin GPIO_PIN_8
#define OUT1_GPIO_Port GPIOA
#define OUT2_Pin GPIO_PIN_11
#define OUT2_GPIO_Port GPIOC
#define OUT3_Pin GPIO_PIN_12
#define OUT3_GPIO_Port GPIOC
#define OUT4_Pin GPIO_PIN_2
#define OUT4_GPIO_Port GPIOD
#define OUT5_Pin GPIO_PIN_3
#define OUT5_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
