################################################
#
# BiscuitOS-BUDDY-GFP-KERNEL
#
################################################
PK_BUDDY_GFP_KERNEL_NAME        := BiscuitOS-BUDDY-GFP-KERNEL
PK_BUDDY_GFP_KERNEL_VERSION     := $(CONFIG_PK_BUDDY_GFP_KERNEL_VERSION)
PK_BUDDY_GFP_KERNEL_SITE        := $(CONFIG_PK_BUDDY_GFP_KERNEL_URL)
PK_BUDDY_GFP_KERNEL_GITHUB      := $(CONFIG_PK_BUDDY_GFP_KERNEL_GITHUB)
PK_BUDDY_GFP_KERNEL_SUBNAME     :=
PK_BUDDY_GFP_KERNEL_BUILDARCH   := $(CONFIG_PK_BUDDY_GFP_KERNEL_BUILDARCH)
PK_BUDDY_GFP_KERNEL_DIR         := $(srctree)/package/BUDDY-ALLOCATOR/BiscuitOS-BUDDY-GFP-KERNEL
PK_BUDDY_GFP_KERNEL_PATCH       := $(PK_BUDDY_GFP_KERNEL_DIR)/patch
PK_BUDDY_GFP_KERNEL_BSBIT       := BiscuitOS-BUDDY-GFP-KERNEL-$(PK_BUDDY_GFP_KERNEL_VERSION).bsbit
PK_BUDDY_GFP_KERNEL_OUT         :=
PK_BUDDY_GFP_KERNEL_SCRIPTS     := $(srctree)/scripts/package/package-module.sh
PK_BUDDY_GFP_KERNEL_TAR         := $(CONFIG_PK_BUDDY_GFP_KERNEL_TAR)
PK_BUDDY_GFP_KERNEL_PACKAGE     :=
PK_BUDDY_GFP_KERNEL_CONFIG      := $(CONFIG_PK_BUDDY_GFP_KERNEL_CONFIG)
SUB_TARGET                  += $(PK_BUDDY_GFP_KERNEL_DIR)/build

PK_BUDDY_GFP_KERNEL_sh = $(CONFIG_SHELL) $(PK_BUDDY_GFP_KERNEL_SCRIPTS) \
                 $1X \
                 $(PK_BUDDY_GFP_KERNEL_NAME)X \
                 $(PK_BUDDY_GFP_KERNEL_VERSION)X \
                 $(PK_BUDDY_GFP_KERNEL_SITE)X \
                 $(PK_BUDDY_GFP_KERNEL_GITHUB)X \
                 $(PK_BUDDY_GFP_KERNEL_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_BUDDY_GFP_KERNEL_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_BUDDY_GFP_KERNEL_SUBNAME)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_CONFIG)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_LIBPATH)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_CPPFLAGS)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_DPKCONFIG)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_CFLAGS)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_LDFLAGS)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_CXXFLAGS)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_ASFLAGS)X \
                 $(PK_BUDDY_GFP_KERNEL_BSBIT)X \
                 $(PK_BUDDY_GFP_KERNEL_BUILDARCH)X \
		 $(PK_BUDDY_GFP_KERNEL_CSRCFILE)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_SRCFILE)X \
                 $(CONFIG_PK_BUDDY_GFP_KERNEL_CSRCFILE)

$(PK_BUDDY_GFP_KERNEL_DIR)/build: FORCE
	$(Q)$(call PK_BUDDY_GFP_KERNEL_sh,$(srctree))
