################################################
#
# BiscuitOS-UKVM-SMAP
#
################################################
PK_BISCUITOS_UKVM_SMAP_USER_NAME        := BiscuitOS-UKVM-SMAP
PK_BISCUITOS_UKVM_SMAP_USER_VERSION     := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_VERSION)
PK_BISCUITOS_UKVM_SMAP_USER_SITE        := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_URL)
PK_BISCUITOS_UKVM_SMAP_USER_GITHUB      := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_GITHUB)
PK_BISCUITOS_UKVM_SMAP_USER_SUBNAME     :=
PK_BISCUITOS_UKVM_SMAP_USER_BUILDARCH   := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_BUILDARCH)
PK_BISCUITOS_UKVM_SMAP_USER_DIR         := $(srctree)/package/kvm/BiscuitOS-UKVM-SMAP-userspace
PK_BISCUITOS_UKVM_SMAP_USER_PATCH       := $(PK_BISCUITOS_UKVM_SMAP_USER_DIR)/patch
PK_BISCUITOS_UKVM_SMAP_USER_BSBIT       := BiscuitOS-UKVM-SMAP-$(PK_BISCUITOS_UKVM_SMAP_USER_VERSION).bsbit
PK_BISCUITOS_UKVM_SMAP_USER_OUT         :=
PK_BISCUITOS_UKVM_SMAP_USER_SCRIPTS     := $(srctree)/scripts/package/package-app.sh
PK_BISCUITOS_UKVM_SMAP_USER_TAR         := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_TAR)
PK_BISCUITOS_UKVM_SMAP_USER_PACKAGE     :=
PK_BISCUITOS_UKVM_SMAP_USER_CONFIG      := $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CONFIG)
SUB_TARGET                  += $(PK_BISCUITOS_UKVM_SMAP_USER_DIR)/build

PK_BISCUITOS_UKVM_SMAP_USER_sh = $(CONFIG_SHELL) $(PK_BISCUITOS_UKVM_SMAP_USER_SCRIPTS) \
                 $1X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_NAME)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_VERSION)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_SITE)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_GITHUB)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_SUBNAME)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CONFIG)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_LIBPATH)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CPPFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_DPKCONFIG)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_LDFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CXXFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_ASFLAGS)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_BSBIT)X \
                 $(PK_BISCUITOS_UKVM_SMAP_USER_BUILDARCH)X \
		 $(PK_BISCUITOS_UKVM_SMAP_USER_CSRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_SRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_UKVM_SMAP_USER_CSRCFILE)

$(PK_BISCUITOS_UKVM_SMAP_USER_DIR)/build: FORCE
	$(Q)$(call PK_BISCUITOS_UKVM_SMAP_USER_sh,$(srctree))
