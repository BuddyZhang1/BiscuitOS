################################################
#
# BiscuitOS-MOTION-MEMORY-DMA
#
################################################
PK_MOTION_MEMORY_DMA_NAME        := BiscuitOS-MOTION-MEMORY-DMA
PK_MOTION_MEMORY_DMA_VERSION     := $(CONFIG_PK_MOTION_MEMORY_DMA_VERSION)
PK_MOTION_MEMORY_DMA_SITE        := $(CONFIG_PK_MOTION_MEMORY_DMA_URL)
PK_MOTION_MEMORY_DMA_GITHUB      := $(CONFIG_PK_MOTION_MEMORY_DMA_GITHUB)
PK_MOTION_MEMORY_DMA_SUBNAME     :=
PK_MOTION_MEMORY_DMA_BUILDARCH   := $(CONFIG_PK_MOTION_MEMORY_DMA_BUILDARCH)
PK_MOTION_MEMORY_DMA_DIR         := $(srctree)/package/MOTION-MEMORY/BiscuitOS-MOTION-MEMORY-DMA
PK_MOTION_MEMORY_DMA_PATCH       := $(PK_MOTION_MEMORY_DMA_DIR)/patch
PK_MOTION_MEMORY_DMA_BSBIT       := BiscuitOS-MOTION-MEMORY-DMA-$(PK_MOTION_MEMORY_DMA_VERSION).bsbit
PK_MOTION_MEMORY_DMA_OUT         :=
PK_MOTION_MEMORY_DMA_SCRIPTS     := $(srctree)/scripts/package/package-module.sh
PK_MOTION_MEMORY_DMA_TAR         := $(CONFIG_PK_MOTION_MEMORY_DMA_TAR)
PK_MOTION_MEMORY_DMA_PACKAGE     :=
PK_MOTION_MEMORY_DMA_CONFIG      := $(CONFIG_PK_MOTION_MEMORY_DMA_CONFIG)
SUB_TARGET                  += $(PK_MOTION_MEMORY_DMA_DIR)/build

PK_MOTION_MEMORY_DMA_sh = $(CONFIG_SHELL) $(PK_MOTION_MEMORY_DMA_SCRIPTS) \
                 $1X \
                 $(PK_MOTION_MEMORY_DMA_NAME)X \
                 $(PK_MOTION_MEMORY_DMA_VERSION)X \
                 $(PK_MOTION_MEMORY_DMA_SITE)X \
                 $(PK_MOTION_MEMORY_DMA_GITHUB)X \
                 $(PK_MOTION_MEMORY_DMA_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_MOTION_MEMORY_DMA_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_MOTION_MEMORY_DMA_SUBNAME)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_CONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_LIBPATH)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_CPPFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_DPKCONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_CFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_LDFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_CXXFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_ASFLAGS)X \
                 $(PK_MOTION_MEMORY_DMA_BSBIT)X \
                 $(PK_MOTION_MEMORY_DMA_BUILDARCH)X \
		 $(PK_MOTION_MEMORY_DMA_CSRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_SRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_DMA_CSRCFILE)

$(PK_MOTION_MEMORY_DMA_DIR)/build: FORCE
	$(Q)$(call PK_MOTION_MEMORY_DMA_sh,$(srctree))
