################################################
#
# BiscuitOS-address-space-process
#
################################################
PK_BISCUITOS_AS_PROCESS_NAME        := BiscuitOS-address-space-process
PK_BISCUITOS_AS_PROCESS_VERSION     := $(CONFIG_PK_BISCUITOS_AS_PROCESS_VERSION)
PK_BISCUITOS_AS_PROCESS_SITE        := $(CONFIG_PK_BISCUITOS_AS_PROCESS_URL)
PK_BISCUITOS_AS_PROCESS_GITHUB      := $(CONFIG_PK_BISCUITOS_AS_PROCESS_GITHUB)
PK_BISCUITOS_AS_PROCESS_SUBNAME     :=
PK_BISCUITOS_AS_PROCESS_BUILDARCH   := $(CONFIG_PK_BISCUITOS_AS_PROCESS_BUILDARCH)
PK_BISCUITOS_AS_PROCESS_DIR         := $(srctree)/package/address-space/BiscuitOS-address-space-process
PK_BISCUITOS_AS_PROCESS_PATCH       := $(PK_BISCUITOS_AS_PROCESS_DIR)/patch
PK_BISCUITOS_AS_PROCESS_BSBIT       := BiscuitOS-address-space-process-$(PK_BISCUITOS_AS_PROCESS_VERSION).bsbit
PK_BISCUITOS_AS_PROCESS_OUT         :=
PK_BISCUITOS_AS_PROCESS_SCRIPTS     := $(srctree)/scripts/package/package-app.sh
PK_BISCUITOS_AS_PROCESS_TAR         := $(CONFIG_PK_BISCUITOS_AS_PROCESS_TAR)
PK_BISCUITOS_AS_PROCESS_PACKAGE     :=
PK_BISCUITOS_AS_PROCESS_CONFIG      := $(CONFIG_PK_BISCUITOS_AS_PROCESS_CONFIG)
SUB_TARGET                  += $(PK_BISCUITOS_AS_PROCESS_DIR)/build

PK_BISCUITOS_AS_PROCESS_sh = $(CONFIG_SHELL) $(PK_BISCUITOS_AS_PROCESS_SCRIPTS) \
                 $1X \
                 $(PK_BISCUITOS_AS_PROCESS_NAME)X \
                 $(PK_BISCUITOS_AS_PROCESS_VERSION)X \
                 $(PK_BISCUITOS_AS_PROCESS_SITE)X \
                 $(PK_BISCUITOS_AS_PROCESS_GITHUB)X \
                 $(PK_BISCUITOS_AS_PROCESS_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_BISCUITOS_AS_PROCESS_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_BISCUITOS_AS_PROCESS_SUBNAME)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_CONFIG)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_LIBPATH)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_CPPFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_DPKCONFIG)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_CFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_LDFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_CXXFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_ASFLAGS)X \
                 $(PK_BISCUITOS_AS_PROCESS_BSBIT)X \
                 $(PK_BISCUITOS_AS_PROCESS_BUILDARCH)X \
		 $(PK_BISCUITOS_AS_PROCESS_CSRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_SRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_AS_PROCESS_CSRCFILE)

$(PK_BISCUITOS_AS_PROCESS_DIR)/build: FORCE
	$(Q)$(call PK_BISCUITOS_AS_PROCESS_sh,$(srctree))
