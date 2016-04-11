################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libpocketsphinx/acmod.c \
../libpocketsphinx/allphone_search.c \
../libpocketsphinx/bin_mdef.c \
../libpocketsphinx/blkarray_list.c \
../libpocketsphinx/dict.c \
../libpocketsphinx/dict2pid.c \
../libpocketsphinx/fsg_history.c \
../libpocketsphinx/fsg_lextree.c \
../libpocketsphinx/fsg_search.c \
../libpocketsphinx/hmm.c \
../libpocketsphinx/kws_detections.c \
../libpocketsphinx/kws_search.c \
../libpocketsphinx/mdef.c \
../libpocketsphinx/ms_gauden.c \
../libpocketsphinx/ms_mgau.c \
../libpocketsphinx/ms_senone.c \
../libpocketsphinx/ngram_search.c \
../libpocketsphinx/ngram_search_fwdflat.c \
../libpocketsphinx/ngram_search_fwdtree.c \
../libpocketsphinx/phone_loop_search.c \
../libpocketsphinx/pocketsphinx.c \
../libpocketsphinx/ps_alignment.c \
../libpocketsphinx/ps_lattice.c \
../libpocketsphinx/ps_mllr.c \
../libpocketsphinx/ptm_mgau.c \
../libpocketsphinx/s2_semi_mgau.c \
../libpocketsphinx/state_align_search.c \
../libpocketsphinx/tmat.c \
../libpocketsphinx/vector.c 

OBJS += \
./libpocketsphinx/acmod.o \
./libpocketsphinx/allphone_search.o \
./libpocketsphinx/bin_mdef.o \
./libpocketsphinx/blkarray_list.o \
./libpocketsphinx/dict.o \
./libpocketsphinx/dict2pid.o \
./libpocketsphinx/fsg_history.o \
./libpocketsphinx/fsg_lextree.o \
./libpocketsphinx/fsg_search.o \
./libpocketsphinx/hmm.o \
./libpocketsphinx/kws_detections.o \
./libpocketsphinx/kws_search.o \
./libpocketsphinx/mdef.o \
./libpocketsphinx/ms_gauden.o \
./libpocketsphinx/ms_mgau.o \
./libpocketsphinx/ms_senone.o \
./libpocketsphinx/ngram_search.o \
./libpocketsphinx/ngram_search_fwdflat.o \
./libpocketsphinx/ngram_search_fwdtree.o \
./libpocketsphinx/phone_loop_search.o \
./libpocketsphinx/pocketsphinx.o \
./libpocketsphinx/ps_alignment.o \
./libpocketsphinx/ps_lattice.o \
./libpocketsphinx/ps_mllr.o \
./libpocketsphinx/ptm_mgau.o \
./libpocketsphinx/s2_semi_mgau.o \
./libpocketsphinx/state_align_search.o \
./libpocketsphinx/tmat.o \
./libpocketsphinx/vector.o 

C_DEPS += \
./libpocketsphinx/acmod.d \
./libpocketsphinx/allphone_search.d \
./libpocketsphinx/bin_mdef.d \
./libpocketsphinx/blkarray_list.d \
./libpocketsphinx/dict.d \
./libpocketsphinx/dict2pid.d \
./libpocketsphinx/fsg_history.d \
./libpocketsphinx/fsg_lextree.d \
./libpocketsphinx/fsg_search.d \
./libpocketsphinx/hmm.d \
./libpocketsphinx/kws_detections.d \
./libpocketsphinx/kws_search.d \
./libpocketsphinx/mdef.d \
./libpocketsphinx/ms_gauden.d \
./libpocketsphinx/ms_mgau.d \
./libpocketsphinx/ms_senone.d \
./libpocketsphinx/ngram_search.d \
./libpocketsphinx/ngram_search_fwdflat.d \
./libpocketsphinx/ngram_search_fwdtree.d \
./libpocketsphinx/phone_loop_search.d \
./libpocketsphinx/pocketsphinx.d \
./libpocketsphinx/ps_alignment.d \
./libpocketsphinx/ps_lattice.d \
./libpocketsphinx/ps_mllr.d \
./libpocketsphinx/ptm_mgau.d \
./libpocketsphinx/s2_semi_mgau.d \
./libpocketsphinx/state_align_search.d \
./libpocketsphinx/tmat.d \
./libpocketsphinx/vector.d 


# Each subdirectory must supply rules for building sources it contributes
libpocketsphinx/%.o: ../libpocketsphinx/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include" -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include\soc_cv_av\socal" -O2 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


