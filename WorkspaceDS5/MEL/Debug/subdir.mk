################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MEL_includes.c \
../fixedptc.c \
../main.c 

OBJS += \
./MEL_includes.o \
./fixedptc.o \
./main.o 

C_DEPS += \
./MEL_includes.d \
./fixedptc.d \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include" -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include\soc_cv_av\socal" -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


