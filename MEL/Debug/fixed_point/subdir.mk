################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../fixed_point/test.c \
../fixed_point/verify.c 

OBJS += \
./fixed_point/test.o \
./fixed_point/verify.o 

C_DEPS += \
./fixed_point/test.d \
./fixed_point/verify.d 


# Each subdirectory must supply rules for building sources it contributes
fixed_point/%.o: ../fixed_point/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


