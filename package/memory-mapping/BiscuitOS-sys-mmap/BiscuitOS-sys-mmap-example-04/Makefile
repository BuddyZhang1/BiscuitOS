################################################
#
# BiscuitOS-sys-mmap-example-04
#
################################################
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_NAME        := BiscuitOS-sys-mmap-example-04
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_VERSION     := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_VERSION)
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SITE        := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_URL)
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_GITHUB      := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_GITHUB)
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SUBNAME     :=
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_BUILDARCH   := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_BUILDARCH)
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_DIR         := $(srctree)/package/memory-mapping/BiscuitOS-sys-mmap/BiscuitOS-sys-mmap-example-04
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_PATCH       := $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_DIR)/patch
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_BSBIT       := BiscuitOS-sys-mmap-example-04-$(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_VERSION).bsbit
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_OUT         :=
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SCRIPTS     := $(srctree)/scripts/package/package-module.sh
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_TAR         := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_TAR)
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_PACKAGE     :=
PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CONFIG      := $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CONFIG)
SUB_TARGET                  += $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_DIR)/build

PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_sh = $(CONFIG_SHELL) $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SCRIPTS) \
                 $1X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_NAME)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_VERSION)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SITE)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_GITHUB)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SUBNAME)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CONFIG)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_LIBPATH)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CPPFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_DPKCONFIG)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_LDFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CXXFLAGS)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_ASFLAGS)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_BSBIT)X \
                 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_BUILDARCH)X \
		 $(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CSRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_SRCFILE)X \
                 $(CONFIG_PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_CSRCFILE)

$(PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_DIR)/build: FORCE
	$(Q)$(call PK_BISCUITOS_SYS_MMAP_EXAMPLE_04_sh,$(srctree))
