memblock-$(CONFIG_PK_MEMBLOCK_USERSPACE)	+= memblock_userspace/
memblock-$(CONFIG_PK_MEMBLOCK_SET_REGION_NODE)	+= memblock_set_region_node/

PACKAGE_MAKEDIR := $(patsubst %/, $(srctree)/package/memblock/%/Makefile, $(memblock-y))

include $(PACKAGE_MAKEDIR)
