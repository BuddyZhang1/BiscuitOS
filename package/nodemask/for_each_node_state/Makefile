################################################
#
# for_each_node_state
#
################################################
PK_FOR_EACH_NODE_STATE_NAME        := for_each_node_state
PK_FOR_EACH_NODE_STATE_VERSION     := $(CONFIG_PK_FOR_EACH_NODE_STATE_VERSION)
PK_FOR_EACH_NODE_STATE_SITE        := $(CONFIG_PK_FOR_EACH_NODE_STATE_URL)
PK_FOR_EACH_NODE_STATE_GITHUB      := $(CONFIG_PK_FOR_EACH_NODE_STATE_GITHUB)
PK_FOR_EACH_NODE_STATE_SUBNAME     :=
PK_FOR_EACH_NODE_STATE_BUILDARCH   := $(CONFIG_PK_FOR_EACH_NODE_STATE_BUILDARCH)
PK_FOR_EACH_NODE_STATE_DIR         := $(srctree)/package/nodemask/for_each_node_state
PK_FOR_EACH_NODE_STATE_PATCH       := $(PK_FOR_EACH_NODE_STATE_DIR)/patch
PK_FOR_EACH_NODE_STATE_BSBIT       := for_each_node_state-$(PK_FOR_EACH_NODE_STATE_VERSION).bsbit
PK_FOR_EACH_NODE_STATE_OUT         :=
PK_FOR_EACH_NODE_STATE_SCRIPTS     := $(srctree)/scripts/package/package-module.sh
PK_FOR_EACH_NODE_STATE_TAR         := $(CONFIG_PK_FOR_EACH_NODE_STATE_TAR)
PK_FOR_EACH_NODE_STATE_PACKAGE     :=
PK_FOR_EACH_NODE_STATE_CONFIG      := $(CONFIG_PK_FOR_EACH_NODE_STATE_CONFIG)
SUB_TARGET                  += $(PK_FOR_EACH_NODE_STATE_DIR)/build

PK_FOR_EACH_NODE_STATE_sh = $(CONFIG_SHELL) $(PK_FOR_EACH_NODE_STATE_SCRIPTS) \
                 $1X \
                 $(PK_FOR_EACH_NODE_STATE_NAME)X \
                 $(PK_FOR_EACH_NODE_STATE_VERSION)X \
                 $(PK_FOR_EACH_NODE_STATE_SITE)X \
                 $(PK_FOR_EACH_NODE_STATE_GITHUB)X \
                 $(PK_FOR_EACH_NODE_STATE_PATCH)X \
                 $(CONFIG_LINUX_KERNEL_VERSION)X \
	         $(CONFIG_MAIN_PROJ_NAME)X \
                 $(PK_FOR_EACH_NODE_STATE_TAR)X \
                 $(CONFIG_LINUX_KERNEL_CROSS_COMPILE)X \
                 $(PK_FOR_EACH_NODE_STATE_SUBNAME)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_CONFIG)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_LIBPATH)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_CPPFLAGS)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_DPKCONFIG)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_CFLAGS)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_LDFLAGS)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_CXXFLAGS)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_ASFLAGS)X \
                 $(PK_FOR_EACH_NODE_STATE_BSBIT)X \
                 $(PK_FOR_EACH_NODE_STATE_BUILDARCH)X \
		 $(PK_FOR_EACH_NODE_STATE_CSRCFILE)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_SRCFILE)X \
                 $(CONFIG_PK_FOR_EACH_NODE_STATE_CSRCFILE)

$(PK_FOR_EACH_NODE_STATE_DIR)/build: FORCE
	$(Q)$(call PK_FOR_EACH_NODE_STATE_sh,$(srctree))
