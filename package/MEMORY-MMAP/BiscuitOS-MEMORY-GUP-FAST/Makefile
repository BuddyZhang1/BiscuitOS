################################################
#
# BiscuitOS-MEMORY-GUP-FAST
#
################################################
PK_MEMORY_GUP_FAST_NAME        := BiscuitOS-MEMORY-GUP-FAST
PK_MEMORY_GUP_FAST_VERSION     := $(CONFIG_PK_MEMORY_GUP_FAST_VERSION)
PK_MEMORY_GUP_FAST_SITE        := $(CONFIG_PK_MEMORY_GUP_FAST_URL)
PK_MEMORY_GUP_FAST_GITHUB      := $(CONFIG_PK_MEMORY_GUP_FAST_GITHUB)
PK_MEMORY_GUP_FAST_SUBNAME     :=
PK_MEMORY_GUP_FAST_BUILDARCH   := $(CONFIG_PK_MEMORY_GUP_FAST_BUILDARCH)
PK_MEMORY_GUP_FAST_DIR         := $(srctree)/package/MEMORY-MMAP/BiscuitOS-MEMORY-GUP-FAST
PK_MEMORY_GUP_FAST_PATCH       := $(PK_MEMORY_GUP_FAST_DIR)/patch
PK_MEMORY_GUP_FAST_BSBIT       := BiscuitOS-MEMORY-GUP-FAST-$(PK_MEMORY_GUP_FAST_VERSION).bsbit
PK_MEMORY_GUP_FAST_OUT         :=
PK_MEMORY_GUP_FAST_SCRIPTS     := $(srctree)/scripts/package/package-module.sh
PK_MEMORY_GUP_FAST_TAR         := $(CONFIG_PK_MEMORY_GUP_FAST_TAR)
PK_MEMORY_GUP_FAST_PACKAGE     :=
PK_MEMORY_GUP_FAST_CONFIG      := $(CONFIG_PK_MEMORY_GUP_FAST_CONFIG)
SUB_TARGET                  += $(PK_MEMORY_GUP_FAST_DIR)/build

PK_MEMORY_GUP_FAST_sh = $(CONFIG_SHELL) $(PK_MEMORY_GUP_FAST_SCRIPTS) \
                 $1X \
                 $(PK_MEMORY_GUP_FAST_NAME)X \
                 $(PK_MEMORY_GUP_FAST_VERSION)X \
                 $(PK_MEMORY_GUP_FAST_SITE)X \
                 $(PK_MEMORY_GUP_FAST_GITHUB)X \
                 $(PK_MEMORY_GUP_FAST_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_MEMORY_GUP_FAST_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_MEMORY_GUP_FAST_SUBNAME)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_CONFIG)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_LIBPATH)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_CPPFLAGS)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_DPKCONFIG)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_CFLAGS)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_LDFLAGS)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_CXXFLAGS)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_ASFLAGS)X \
                 $(PK_MEMORY_GUP_FAST_BSBIT)X \
                 $(PK_MEMORY_GUP_FAST_BUILDARCH)X \
		 $(PK_MEMORY_GUP_FAST_CSRCFILE)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_SRCFILE)X \
                 $(CONFIG_PK_MEMORY_GUP_FAST_CSRCFILE)

$(PK_MEMORY_GUP_FAST_DIR)/build: FORCE
	$(Q)$(call PK_MEMORY_GUP_FAST_sh,$(srctree))
