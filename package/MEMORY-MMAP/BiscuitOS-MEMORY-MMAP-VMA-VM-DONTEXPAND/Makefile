################################################
#
# BiscuitOS-MEMORY-MMAP-VMA-VM-DONTEXPAND
#
################################################
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_NAME        := BiscuitOS-MEMORY-MMAP-VMA-VM-DONTEXPAND
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_VERSION     := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_VERSION)
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SITE        := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_URL)
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_GITHUB      := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_GITHUB)
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SUBNAME     :=
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_BUILDARCH   := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_BUILDARCH)
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_DIR         := $(srctree)/package/MEMORY-MMAP/BiscuitOS-MEMORY-MMAP-VMA-VM-DONTEXPAND
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_PATCH       := $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_DIR)/patch
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_BSBIT       := BiscuitOS-MEMORY-MMAP-VMA-VM-DONTEXPAND-$(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_VERSION).bsbit
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_OUT         :=
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SCRIPTS     := $(srctree)/scripts/package/package-app.sh
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_TAR         := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_TAR)
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_PACKAGE     :=
PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CONFIG      := $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CONFIG)
SUB_TARGET                  += $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_DIR)/build

PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_sh = $(CONFIG_SHELL) $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SCRIPTS) \
                 $1X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_NAME)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_VERSION)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SITE)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_GITHUB)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SUBNAME)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CONFIG)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_LIBPATH)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CPPFLAGS)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_DPKCONFIG)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CFLAGS)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_LDFLAGS)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CXXFLAGS)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_ASFLAGS)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_BSBIT)X \
                 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_BUILDARCH)X \
		 $(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CSRCFILE)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_SRCFILE)X \
                 $(CONFIG_PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_CSRCFILE)

$(PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_DIR)/build: FORCE
	$(Q)$(call PK_MEMORY_MMAP_VMA_VM_DONTEXPAND_sh,$(srctree))
