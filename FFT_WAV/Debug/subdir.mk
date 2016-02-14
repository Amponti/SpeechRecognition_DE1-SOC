################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FFT_includes.c \
../fft2048.c \
../fft256.c \
../fft4096.c \
../fft64.c \
../ifft64.c \
../main.c 

OBJS += \
./FFT_includes.o \
./fft2048.o \
./fft256.o \
./fft4096.o \
./fft64.o \
./ifft64.o \
./main.o 

C_DEPS += \
./FFT_includes.d \
./fft2048.d \
./fft256.d \
./fft4096.d \
./fft64.d \
./ifft64.d \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


