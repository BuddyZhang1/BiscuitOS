################################################
#
# BiscuitOS-MOTION-MEMORY-ZSWAP-ANON
#
################################################
PK_MOTION_MEMORY_ZSWAP_ANON_NAME        := BiscuitOS-MOTION-MEMORY-ZSWAP-ANON
PK_MOTION_MEMORY_ZSWAP_ANON_VERSION     := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_VERSION)
PK_MOTION_MEMORY_ZSWAP_ANON_SITE        := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_URL)
PK_MOTION_MEMORY_ZSWAP_ANON_GITHUB      := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_GITHUB)
PK_MOTION_MEMORY_ZSWAP_ANON_SUBNAME     :=
PK_MOTION_MEMORY_ZSWAP_ANON_BUILDARCH   := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_BUILDARCH)
PK_MOTION_MEMORY_ZSWAP_ANON_DIR         := $(srctree)/package/MOTION-MEMORY/BiscuitOS-MOTION-MEMORY-ZSWAP-ANON
PK_MOTION_MEMORY_ZSWAP_ANON_PATCH       := $(PK_MOTION_MEMORY_ZSWAP_ANON_DIR)/patch
PK_MOTION_MEMORY_ZSWAP_ANON_BSBIT       := BiscuitOS-MOTION-MEMORY-ZSWAP-ANON-$(PK_MOTION_MEMORY_ZSWAP_ANON_VERSION).bsbit
PK_MOTION_MEMORY_ZSWAP_ANON_OUT         :=
PK_MOTION_MEMORY_ZSWAP_ANON_SCRIPTS     := $(srctree)/scripts/package/package-app.sh
PK_MOTION_MEMORY_ZSWAP_ANON_TAR         := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_TAR)
PK_MOTION_MEMORY_ZSWAP_ANON_PACKAGE     :=
PK_MOTION_MEMORY_ZSWAP_ANON_CONFIG      := $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CONFIG)
SUB_TARGET                  += $(PK_MOTION_MEMORY_ZSWAP_ANON_DIR)/build

PK_MOTION_MEMORY_ZSWAP_ANON_sh = $(CONFIG_SHELL) $(PK_MOTION_MEMORY_ZSWAP_ANON_SCRIPTS) \
                 $1X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_NAME)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_VERSION)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_SITE)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_GITHUB)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_SUBNAME)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_LIBPATH)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CPPFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_DPKCONFIG)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_LDFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CXXFLAGS)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_ASFLAGS)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_BSBIT)X \
                 $(PK_MOTION_MEMORY_ZSWAP_ANON_BUILDARCH)X \
		 $(PK_MOTION_MEMORY_ZSWAP_ANON_CSRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_SRCFILE)X \
                 $(CONFIG_PK_MOTION_MEMORY_ZSWAP_ANON_CSRCFILE)

$(PK_MOTION_MEMORY_ZSWAP_ANON_DIR)/build: FORCE
	$(Q)$(call PK_MOTION_MEMORY_ZSWAP_ANON_sh,$(srctree))
