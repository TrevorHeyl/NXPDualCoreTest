################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mcmgr/mcmgr.c \
../mcmgr/mcmgr_internal_core_api_lpc55s69.c 

OBJS += \
./mcmgr/mcmgr.o \
./mcmgr/mcmgr_internal_core_api_lpc55s69.o 

C_DEPS += \
./mcmgr/mcmgr.d \
./mcmgr/mcmgr_internal_core_api_lpc55s69.d 


# Each subdirectory must supply rules for building sources it contributes
mcmgr/%.o: ../mcmgr/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -D__MULTICORE_NONE -DCPU_LPC55S69JBD100_cm33_core1 -DARM_MATH_CM33 -DMCMGR_HANDLE_EXCEPTIONS=1 -D__SEMIHOST_HARDFAULT_DISABLE=1 -DMULTICORE_APP=1 -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33_nodsp -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__MULTICORE_M33SLAVE -I../board -I../source -I../ -I../mcmgr -I../CMSIS -I../device -I../drivers -I../startup -I../component/lists -I../component/serial_manager -I../utilities -I../component/uart -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin  -mcpu=cortex-m33+nodsp -mcpu=cortex-m33+nodsp -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


