################################################
#
# BiscuitOS-MOTION-MEMORY-THP
#
################################################
PK_MOTION_MEMORY_THP_NAME        := BiscuitOS-MOTION-MEMORY-THP
PK_MOTION_MEMORY_THP_VERSION     := $(CONFIG_PK_MOTION_MEMORY_THP_VERSION)
PK_MOTION_MEMORY_THP_SITE        := $(CONFIG_PK_MOTION_MEMORY_THP_URL)
PK_MOTION_MEMORY_THP_GITHUB      := $(CONFIG_PK_MOTION_MEMORY_THP_GITHUB)
PK_MOTION_MEMORY_THP_SUBNAME     :=
PK_MOTION_MEMORY_THP_BUILDARCH   := $(CONFIG_PK_MOTION_MEMORY_THP_BUILDARCH)
PK_MOTION_MEMORY_THP_DIR         := $(srctree)/package/MOTION-MEMORY/BiscuitOS-MOTION-MEMORY-THP
PK_MOTION_MEMORY_THP_PATCH       := $(PK_MOTION_MEMORY_THP_DIR)/patch
PK_MOTION_MEMORY_THP_BSBIT       := BiscuitOS-MOTION-MEMORY-THP-$(PK_MOTION_MEMORY_THP_VERSION).bsbit
PK_MOTION_MEMORY_THP_OUT         :=
PK_MOTION_MEMORY_THP_SCRIPTS     := $(srctree)/scripts/package/package-app.sh
PK_MOTION_MEMORY_THP_TAR         := $(CONFIG_PK_MOTION_MEMORY_THP_TAR)
PK_MOTION_MEMORY_THP_PACKAGE     :=
PK_MOTION_MEMORY_THP_CONFIG      := $(CONFIG_PK_MOTION_MEMORY_THP_CONFIG)
SUB_TARGET                  += $(PK_MOTION_MEMORY_THP_DIR)/build

PK_MOTION_MEMORY_THP_sh = $(CONFIG_SHELL) $(PK_MOTION_MEMORY_THP_SCRIPTS) \
                 $1X \
                 $(PK_MOTION_MEMORY_THP_NAME)X \
                 $(PK_MOTION_MEMORY_THP_VERSION)X \
                 $(PK_MOTION_MEMORY_THP_SITE)X \
                 $(PK_MOTION_MEMORY_THP_GITHUB)X \
                 $(PK_MOTION_MEMORY_THP_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_MOTION_MEMORY_THP_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_MOTION_MEMORY_THP_SUBNAME)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_CONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_LIBPATH)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_CPPFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_DPKCONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_CFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_LDFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_CXXFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_ASFLAGS)X \
                 $(PK_MOTION_MEMORY_THP_BSBIT)X \
                 $(PK_MOTION_MEMORY_THP_BUILDARCH)X \
		 $(PK_MOTION_MEMORY_THP_CSRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_SRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_THP_CSRCFILE)

$(PK_MOTION_MEMORY_THP_DIR)/build: FORCE
	$(Q)$(call PK_MOTION_MEMORY_THP_sh,$(srctree))
