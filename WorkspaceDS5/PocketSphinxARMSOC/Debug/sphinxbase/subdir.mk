################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sphinxbase/agc.c \
../sphinxbase/bio.c \
../sphinxbase/bitarr.c \
../sphinxbase/bitvec.c \
../sphinxbase/blas_lite.c \
../sphinxbase/case.c \
../sphinxbase/ckd_alloc.c \
../sphinxbase/cmd_ln.c \
../sphinxbase/cmn.c \
../sphinxbase/cmn_prior.c \
../sphinxbase/dtoa.c \
../sphinxbase/err.c \
../sphinxbase/errno.c \
../sphinxbase/f2c_lite.c \
../sphinxbase/fe_interface.c \
../sphinxbase/fe_noise.c \
../sphinxbase/fe_prespch_buf.c \
../sphinxbase/fe_sigproc.c \
../sphinxbase/fe_warp.c \
../sphinxbase/fe_warp_affine.c \
../sphinxbase/fe_warp_inverse_linear.c \
../sphinxbase/fe_warp_piecewise_linear.c \
../sphinxbase/feat.c \
../sphinxbase/filename.c \
../sphinxbase/fixlog.c \
../sphinxbase/fsg_model.c \
../sphinxbase/genrand.c \
../sphinxbase/glist.c \
../sphinxbase/hash_table.c \
../sphinxbase/heap.c \
../sphinxbase/jsgf.c \
../sphinxbase/jsgf_parser.c \
../sphinxbase/jsgf_scanner.c \
../sphinxbase/lda.c \
../sphinxbase/listelem_alloc.c \
../sphinxbase/lm_trie.c \
../sphinxbase/lm_trie_quant.c \
../sphinxbase/logmath.c \
../sphinxbase/matrix.c \
../sphinxbase/mmio.c \
../sphinxbase/ngram_model.c \
../sphinxbase/ngram_model_set.c \
../sphinxbase/ngram_model_trie.c \
../sphinxbase/ngrams_raw.c \
../sphinxbase/pio.c \
../sphinxbase/priority_queue.c \
../sphinxbase/profile.c \
../sphinxbase/sbthread.c \
../sphinxbase/slamch.c \
../sphinxbase/slapack_lite.c \
../sphinxbase/strfuncs.c \
../sphinxbase/yin.c 

OBJS += \
./sphinxbase/agc.o \
./sphinxbase/bio.o \
./sphinxbase/bitarr.o \
./sphinxbase/bitvec.o \
./sphinxbase/blas_lite.o \
./sphinxbase/case.o \
./sphinxbase/ckd_alloc.o \
./sphinxbase/cmd_ln.o \
./sphinxbase/cmn.o \
./sphinxbase/cmn_prior.o \
./sphinxbase/dtoa.o \
./sphinxbase/err.o \
./sphinxbase/errno.o \
./sphinxbase/f2c_lite.o \
./sphinxbase/fe_interface.o \
./sphinxbase/fe_noise.o \
./sphinxbase/fe_prespch_buf.o \
./sphinxbase/fe_sigproc.o \
./sphinxbase/fe_warp.o \
./sphinxbase/fe_warp_affine.o \
./sphinxbase/fe_warp_inverse_linear.o \
./sphinxbase/fe_warp_piecewise_linear.o \
./sphinxbase/feat.o \
./sphinxbase/filename.o \
./sphinxbase/fixlog.o \
./sphinxbase/fsg_model.o \
./sphinxbase/genrand.o \
./sphinxbase/glist.o \
./sphinxbase/hash_table.o \
./sphinxbase/heap.o \
./sphinxbase/jsgf.o \
./sphinxbase/jsgf_parser.o \
./sphinxbase/jsgf_scanner.o \
./sphinxbase/lda.o \
./sphinxbase/listelem_alloc.o \
./sphinxbase/lm_trie.o \
./sphinxbase/lm_trie_quant.o \
./sphinxbase/logmath.o \
./sphinxbase/matrix.o \
./sphinxbase/mmio.o \
./sphinxbase/ngram_model.o \
./sphinxbase/ngram_model_set.o \
./sphinxbase/ngram_model_trie.o \
./sphinxbase/ngrams_raw.o \
./sphinxbase/pio.o \
./sphinxbase/priority_queue.o \
./sphinxbase/profile.o \
./sphinxbase/sbthread.o \
./sphinxbase/slamch.o \
./sphinxbase/slapack_lite.o \
./sphinxbase/strfuncs.o \
./sphinxbase/yin.o 

C_DEPS += \
./sphinxbase/agc.d \
./sphinxbase/bio.d \
./sphinxbase/bitarr.d \
./sphinxbase/bitvec.d \
./sphinxbase/blas_lite.d \
./sphinxbase/case.d \
./sphinxbase/ckd_alloc.d \
./sphinxbase/cmd_ln.d \
./sphinxbase/cmn.d \
./sphinxbase/cmn_prior.d \
./sphinxbase/dtoa.d \
./sphinxbase/err.d \
./sphinxbase/errno.d \
./sphinxbase/f2c_lite.d \
./sphinxbase/fe_interface.d \
./sphinxbase/fe_noise.d \
./sphinxbase/fe_prespch_buf.d \
./sphinxbase/fe_sigproc.d \
./sphinxbase/fe_warp.d \
./sphinxbase/fe_warp_affine.d \
./sphinxbase/fe_warp_inverse_linear.d \
./sphinxbase/fe_warp_piecewise_linear.d \
./sphinxbase/feat.d \
./sphinxbase/filename.d \
./sphinxbase/fixlog.d \
./sphinxbase/fsg_model.d \
./sphinxbase/genrand.d \
./sphinxbase/glist.d \
./sphinxbase/hash_table.d \
./sphinxbase/heap.d \
./sphinxbase/jsgf.d \
./sphinxbase/jsgf_parser.d \
./sphinxbase/jsgf_scanner.d \
./sphinxbase/lda.d \
./sphinxbase/listelem_alloc.d \
./sphinxbase/lm_trie.d \
./sphinxbase/lm_trie_quant.d \
./sphinxbase/logmath.d \
./sphinxbase/matrix.d \
./sphinxbase/mmio.d \
./sphinxbase/ngram_model.d \
./sphinxbase/ngram_model_set.d \
./sphinxbase/ngram_model_trie.d \
./sphinxbase/ngrams_raw.d \
./sphinxbase/pio.d \
./sphinxbase/priority_queue.d \
./sphinxbase/profile.d \
./sphinxbase/sbthread.d \
./sphinxbase/slamch.d \
./sphinxbase/slapack_lite.d \
./sphinxbase/strfuncs.d \
./sphinxbase/yin.d 


# Each subdirectory must supply rules for building sources it contributes
sphinxbase/%.o: ../sphinxbase/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include" -I"C:\altera\15.0\embedded\ip\altera\hps\altera_hps\hwlib\include\soc_cv_av\socal" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


