Sources and prebuilt binaries are included for release, the structure for this 
folder is as below:

    2014.09
    	|- cv-datamover-ed	
        	|- README.txt
        	|- cv_datamover_ed.tar.gz


Content of cv_datamover_ed.tar.gz
    cv_datamover_ed
        |- bin
              |- fpga
                    datamover_5csxfc6.flash
                    datamover_5csxfc6.sof
              |- linux
                    altera-datamover-image-socfpga_cyclone5.rootfs.tar.gz
                    preloader-mkpimage.bin
                    sdimage.bin
                    socfpga.dtb
                    u-boot-socfpga_cyclone5.img
                    vmlinux
                    zImage
              |- niosii_hal  
                    datamover_demo.flash
                    datamover_demo.elf
        |- hw
            datamover_5csxfc6.qpf
            datamover_5csxfc6.qsf
            datamover_5csxfc6.qsys
            datamover_top.v
            hps_common_board_info.xml
            soc_system_board_info.xml
            soc_system_timing.sdc
    	       ip
              |- altsource_probe
              |- axi_conduit_merger
              |- edge_detect
        |- sw
              |- niosii_hal
                    datamover_demo.c
              |- linux
                    altera_datamover_yocto.patch


For further information, please refer to user guide at,
http://www.rocketboards.org/foswiki/view/Projects/Datamover