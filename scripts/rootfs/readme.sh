#/bin/bash
# MAX_ARGS 34
  
# set -e
# Auto create README.
#
# (C) 2019.05.11 BiscuitOS <buddy.zhang@aliyun.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

# Root Dir for BiscuitOS
ROOT=${1%X}
# Project NAME
PROJECT_NAME=${9%X}
# Project ROOT
OUTPUT=${ROOT}/output/${PROJECT_NAME}
# BUSYBOX
BUSYBOX=${OUTPUT}/busybox/busybox
# CROSS
CROSS_COMPILE=${12%X}
# CROSS PATH
CROSS_PATH=${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}
# Uboot
UBOOT=${15%X}
# Uboot CROSS Compile
UBOOT_CROSS=${16%X}
# Kernel Version
KERNEL_VERSION=${7%X}
[ ${KERNEL_VERSION}X = "newestX" ] && KERNEL_VERSION=6.0.0
[ ${KERNEL_VERSION}X = "newest-giteeX" ] && KERNEL_VERSION=6.0.0
[ ${KERNEL_VERSION}X = "nextX" ] && KERNEL_VERSION=6.0.0
# Rootfs NAME
ROOTFS_NAME=${2%X}
# Rootfs Version
ROOTFS_VERSION=${3%X}
# Rootfs Path
ROOTFS_PATH=${OUTPUT}/rootfs/${ROOTFS_NAME}
# Disk size (MB)
DISK_SIZE=${18%X}
[ ! ${DISK_SIZE} ] && DISK_SIZE=512
# Freeze Information
FREEZE_NAME=${17%X}
# Uboot Cross-Compiler Path
UCROSS_PATH=${OUTPUT}/${UBOOT_CROSS}/${UBOOT_CROSS}
# Kernel Cross-Compiler Path
KCROSS_PATH=${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}
# Qemu Path
QEMU_PATH=${OUTPUT}/qemu-system/qemu-system
# Broiler Path
BROILER_PATH=${OUTPUT}/Broiler-system/Broiler-system
# Module Install Path
MODULE_INSTALL_PATH=${OUTPUT}/rootfs/rootfs/
# Running Only
ONLYRUN=${19%X}
SUPPORT_ONLYRUN=N
# Rootfs type
ROOTFS_TYPE=${20%X}
# HYPV 
SUPPORT_HYPV=${21%X}
# NUMA
SUPPORT_NUMA=${22}
# KVM
SUPPORT_KVM=${23}

## DIY CONFIGURE
# DIY CPU NUM
DIY_CPU_NUM=${30%XX}
[ ! ${DIY_CPU_NUM} ] && DIY_CPU_NUM=2
# DIY Memory
DIY_MEMORY=${26%XX}
[ ! ${DIY_MEMORY} ] && DIY_MEMORY=512
# DIY CPU 440FX
SUPPORT_CPU_440FX=N
[ ${34%X} = "yX" ] && SUPPORT_CPU_440FX=Y
# DIY CPU Q35
SUPPORT_CPU_Q35=N
[ ${35%X} = "yX" ] && SUPPORT_CPU_Q35=Y
# DIY vIOMMU
SUPPORT_vIOMMU=N
[ ${36%X} = "yX" ] && SUPPORT_vIOMMU=Y
# DIY CMDLINE
SUPPORT_CMDLINE=N
[ "${31%X}" != "X" ] && SUPPORT_CMDLINE=Y && DIY_CMDLINE=${31%XX}

## HARDWARE
# PCI BAR
SUPPORT_HW_PCI_BAR=N
[ ${37%X} = "yX" ] && SUPPORT_HW_PCI_BAR=Y
# PCI INTX
SUPPORT_HW_PCI_INTX=N
[ ${38%X} = "yX" ] && SUPPORT_HW_PCI_INTX=Y
# PCI MSI
SUPPORT_HW_PCI_MSI=N
[ ${39%X} = "yX" ] && SUPPORT_HW_PCI_MSI=Y
# PCI MSIX
SUPPORT_HW_PCI_MSIX=N
[ ${40%X} = "yX" ] && SUPPORT_HW_PCI_MSIX=Y
# PCI DMA INTX
SUPPORT_HW_PCI_DMA_INTX=N
[ ${41%X} = "yX" ] && SUPPORT_HW_PCI_DMA_INTX=Y
# PCI DMA MSI
SUPPORT_HW_PCI_DMA_MSI=N
[ ${42%X} = "yX" ] && SUPPORT_HW_PCI_DMA_MSI=Y
# PCI DMA MSIX
SUPPORT_HW_PCI_DMA_MSIX=N
[ ${43%X} = "yX" ] && SUPPORT_HW_PCI_DMA_MSIX=Y
# PCI DMA-BUF
SUPPORT_HW_PCI_DMA_BUF=N
[ ${44%X} = "yX" ] && SUPPORT_HW_PCI_DMA_BUF=Y
# CXL_QEMU
SUPPORT_CXL_QEMU=N
[ ${45%X} = "yX" ] && SUPPORT_CXL_QEMU=Y
# CXL DEVICE
SUPPORT_CXL_HW=N
if [ ${46%X} = "yX" ]; then
	SUPPORT_CXL_HW=Y
	SUPPORT_CXL_TPG_NR=${70%XX}
	SUPPORT_NUMA=N
	CXL_CMDLINE="BiscuitOS_CXL_TPG_${SUPPORT_CXL_TPG_NR}"
fi
# PMEM DEVICE
SUPPORT_PMEM_HW=N
[ ${70%X} = "Y" ] && SUPPORT_PMEM_HW=Y && SUPPORT_NUMA=N
# NUMA HARDWARE
SUPPORT_NUMA_HW=N
if [ "${71%XX}X" != "X" ]; then
	[ "${71%XX}" -gt 0 ] && SUPPORT_NUMA_HW=Y && SUPPORT_NUMA_TOPOLOGY=${71%XX}
fi
# NUAM HMAT
SUPPORT_NUMA_HMAT=N
[ "${72%XX}X" = "yX" ] && SUPPORT_NUMA_HMAT=Y

# CXL PCIE DEVICE
SUPPORT_HW_CXL_GPU=N
[ "${73%XX}X" = "yX" ] && SUPPORT_HW_CXL_GPU=Y

# VIRTIO-BLK: ARG 47-49
SUPPORT_VDB=${47%}
SUPPORT_VDC=${48%}
SUPPORT_VDD=${49%}
SUPPORT_VDE=${50%}
SUPPORT_VDF=${51%}
SUPPORT_VDG=${52%}
SUPPORT_VDH=${53%}
SUPPORT_VDI=${54%}
SUPPORT_VDJ=${55%}
SUPPORT_VDK=${56%}
SUPPORT_VDL=${57%}
SUPPORT_VDM=${58%}
SUPPORT_VDN=${59%}
SUPPORT_VDO=${60%}
SUPPORT_VDP=${61%}
SUPPORT_VDQ=${62%}
SUPPORT_VDR=${63%}
SUPPORT_VDS=${64%}
SUPPORT_DEFAULT_DISK=${65%}

# LOGLVEL
DMESG_LOGLEVEL=${66}

# Ubuntu Version
UBUNTU_FULL=$(cat /etc/issue | grep "Ubuntu" | awk '{print $2}')
UBUNTU=${UBUNTU_FULL:0:2}

[ ${ONLYRUN}X = "YX" ] && SUPPORT_ONLYRUN=Y && KERNEL_VERSION=6.0.0

# Don't edit
README_NAME=README.md
RUNSCP_NAME=RunBiscuitOS.sh

## Feature list
SUPPORT_DTB=N
SUPPORT_2_X=N
SUPPORT_EXT3=N
SUPPORT_BLK=N
SUPPORT_DISK=N
SUPPORT_NONE_GNU=N
SUPPORT_RAMDISK=N
SUPPORT_UBOOT=N
SUPPORT_RPI=N
SUPPORT_RPI4B=N
SUPPORT_RPI3B=N
SUPPORT_DESKTOP=N
SUPPORT_DEBIAN=N
SUPPORT_DOCKER=N
SUPPORT_SERVER=N
SUPPORT_FREEZE_DISK=Y
SUPPORT_BUSYBOX=Y
SUPPORT_NETWORK=Y
SUPPORT_GCC341=N
SUPPORT_26X24=N
SUPPORT_SEABIOS=N
SUPPORT_VIRTIO=N
SUPPORT_BIOS=N
SUPPORT_DEBUG_BIOS=N

# Kernel Version field
KERNEL_MAJOR_NO=
KERNEL_MINOR_NO=
KERNEL_MINIR_NO=

DEFAULT_CONFIG=defconfig
# Debian Package
DEBIAN_PACKAGE=

##
## Architecture information
ARCH=${11%X}
ARCH_NAME=

# Architecture Detect
case ${ARCH} in
	0)
	ARCH_NAME=unknown
	;;
	1)
	ARCH_NAME=x86
	QEMU=${QEMU_PATH}/i386-softmmu/qemu-system-i386
	;;
	2)
	ARCH_NAME=arm
	QEMU=${QEMU_PATH}/arm-softmmu/qemu-system-arm
	DEFAULT_CONFIG=vexpress_defconfig
	DEBIAN_PACKAGE=buster-base-armel.tar.gz.${ROOTFS_TYPE}.bsp
	;;
	3)
	ARCH_NAME=arm64
	QEMU=${QEMU_PATH}/aarch64-softmmu/qemu-system-aarch64
	DEFAULT_CONFIG=defconfig
	DEBIAN_PACKAGE=buster-base-arm64.tar.gz.${ROOTFS_TYPE}.bsp
	;;
	4)
	ARCH_NAME=riscv32
	QEMU=${QEMU_PATH}/riscv32-softmmu/qemu-system-riscv32
	DEFAULT_CONFIG=BiscuitOS_riscv32_defconfig
	;;
	5)
	ARCH_NAME=riscv64
	QEMU=${QEMU_PATH}/riscv64-softmmu/qemu-system-riscv64
	DEFAULT_CONFIG=BiscuitOS_riscv64_defconfig
	;;
	6)
	ARCH_NAME=x86_64
	QEMU=${QEMU_PATH}/x86_64-softmmu/qemu-system-x86_64
	[ ${SUPPORT_CXL_QEMU} = "Y" -o ${SUPPORT_NUMA_HW} = "Y" ] && QEMU=${QEMU_PATH}/build/qemu-system-x86_64
	BROILER=${BROILER_PATH}/BiscuitOS_Broiler
	;;
esac

# Detect Kernel version field
#   Kernek version field
#   --> Major.minor.minir
#   --> 5.0.1
#   --> Major: 5
#   --> Minor: 0
#   --> minir: 1
detect_kernel_version_field()
{
	[ ! ${KERNEL_VERSION} ] && echo "Invalid kernel version" && exit -1
	# Major field of Kernel version
	KERNEL_MAJOR_NO=${KERNEL_VERSION%%.*}
	tmpv1=${KERNEL_VERSION#*.}
	# Minor field of kernel version
	KERNEL_MINOR_NO=${tmpv1%%.*}
	# minir field of kernel version
	KERNEL_MINIR_NO=${tmpv1#*.}
}
detect_kernel_version_field

# Detect SeaBIOS
detect_seaBIOS()
{
	cat ${OUTPUT}/bootloader/version | grep "BiscuitOS_seaBIOS" > /dev/null 
	if [ $? -eq 0 ]; then
		SUPPORT_SEABIOS=Y
		rm -rf ${OUTPUT}/bootloader/seaBIOS > /dev/null 2>&1
		ln -s ${OUTPUT}/qemu-system/qemu-system/roms/seabios ${OUTPUT}/bootloader/seaBIOS
		if [ ! -f ${OUTPUT}/bootloader/seaBIOS/out/bios.bin ]; then
			cd ${OUTPUT}/bootloader/seaBIOS/ > /dev/null 2>&1
			make -j4
			cd - > /dev/null 2>&1
		fi
	fi
}

[ -d ${OUTPUT}/bootloader/ ] && detect_seaBIOS

# DTB support
# --> Only ARM >= 4.x support DTB
[ ${ARCH_NAME} == "arm" -a ${KERNEL_MAJOR_NO} -ge 4 ] && SUPPORT_DTB=Y
[ ${ARCH_NAME} == "arm" -a ${KERNEL_MAJOR_NO} -ge 3 -a ${KERNEL_MINOR_NO} -gt 15 ] && SUPPORT_DTB=Y

# Support RAMDISK (2.x/3.x Support)
# --> Mount / at RAMDISK
[ ${KERNEL_MAJOR_NO} -lt 4 ] && SUPPORT_RAMDISK=Y && SUPPORT_FREEZE_DISK=N
[ ${ARCH_NAME} == "arm64" ] && SUPPORT_RAMDISK=N
[ ${ARCH_NAME} == "x86" ] && SUPPORT_RAMDISK=N && SUPPORT_FREEZE_DISK=Y
[ ${ARCH_NAME} == "x86_64" ] && SUPPORT_RAMDISK=N && SUPPORT_FREEZE_DISK=Y

# Support BIOS and Debug BIOS
[ ${ARCH_NAME} == "x86_64" -o ${ARCH_NAME} == "x86" ] && SUPPORT_BIOS=Y && SUPPORT_DEBUG_BIOS=Y

# Support VirtIO
[ ${KERNEL_MAJOR_NO} -ge 5 -a ${ARCH_NAME} == "x86" ] && SUPPORT_VIRTIO=Y
[ ${KERNEL_MAJOR_NO} -ge 5 -a ${ARCH_NAME} == "x86_64" ] && SUPPORT_VIRTIO=Y

# Support Disk mount /
# --> Mount / at /dev/vda
[ ${SUPPORT_RAMDISK} = "N" ] && SUPPORT_DISK=Y

# Support Hard-disk
# --> Mount a disk on /mnt/
# --> 4.x, 5.x support
# --> 2.x, 3.x no support
[ ${KERNEL_MAJOR_NO} -ge 3 ] && SUPPORT_BLK=Y
[ ${KERNEL_MAJOR_NO} -eq 2 -o ${KERNEL_MAJOR_NO} -eq 3 ] && SUPPORT_BLK=N
[ ${ARCH_NAME} = "arm64" ] && SUPPORT_BLK=Y

# Linux 2.x Feature 
[ ${KERNEL_MAJOR_NO} -eq 2 ] && SUPPORT_2_X=Y

# EXT3 support
# --> Kernel < 3.10 Only support EXT3
[ ${KERNEL_MAJOR_NO} -eq 3 -a ${KERNEL_MINOR_NO} -lt 10 ] && SUPPORT_EXT3=Y
[ ${KERNEL_MAJOR_NO} -lt 3 ] && SUPPORT_EXT3=Y
[ ${KERNEL_MAJOR_NO} -eq 3 -a ${KERNEL_MINOR_NO} -lt 21 -a ${ARCH_NAME} = "arm" ] && SUPPORT_EXT3=Y

# CROSS_CROMPILE
[ ${SUPPORT_2_X} = "Y" -a ${KERNEL_MINOR_NO}Y = "6Y" -a ${KERNEL_MINIR_NO} -ge 34 ] && SUPPORT_NONE_GNU=Y
[ ${SUPPORT_2_X} = "Y" -a ${KERNEL_MINOR_NO}Y = "6Y" -a ${KERNEL_MINIR_NO} -lt 34 ] && SUPPORT_GCC341=Y && SUPPORT_26X24=Y

# ARM Kernel Configure
[ ${SUPPORT_2_X} = "Y" ] && DEFAULT_CONFIG=versatile_defconfig

# Uboot
[ ${UBOOT}X = "yX" ] && SUPPORT_UBOOT=Y

# Platform 
[ ${PROJECT_NAME} = "RaspberryPi_4B" ] && SUPPORT_RPI4B=Y && DEFAULT_CONFIG=bcm2711_defconfig
[ ${PROJECT_NAME} = "RaspberryPi_3B" ] && SUPPORT_RPI3B=Y && DEFAULT_CONFIG=bcm2709_defconfig
[ ${SUPPORT_RPI4B} = "Y" -o ${SUPPORT_RPI3B} = "Y" ] && SUPPORT_RPI=Y && SUPPORT_RAMDISK=N

# Debian/Desktop/Docker
[ ${ROOTFS_TYPE}X = "DesktopX" ] && SUPPORT_DESKTOP=Y && SUPPORT_DEBIAN=Y && SUPPORT_BUSYBOX=N
[ ${ROOTFS_TYPE}X = "DockerX" ]  && SUPPORT_DOCKER=Y && SUPPORT_DEBIAN=Y && SUPPORT_BUSYBOX=N
[ ${ROOTFS_TYPE}X = "ServerX" ]  && SUPPORT_SERVER=Y && SUPPORT_DEBIAN=Y && SUPPORT_BUSYBOX=N
[ ${SUPPORT_ONLYRUN}X = "YX" ] && SUPPORT_DESKTOP=Y && SUPPORT_DEBIAN=Y && SUPPORT_BUSYBOX=N

## NUMA
# CPU
if [ ${SUPPORT_NUMA} = "yX" ]; then
	SUPPORT_NUMA=Y
	SUPPORT_CPU_NR=`grep -c ^processor /proc/cpuinfo`
	SUPPORT_NUMA_LAYOUT=1
	if [ ${SUPPORT_CPU_NR} -lt 4 ]; then
		SUPPORT_NUMA=N
		echo "NUMA Mechaism must need 4 CPUs!"
	elif [ ${SUPPORT_CPU_NR} -lt 8 ]; then
		# 2 CPUs on 2 NUMA NODE
		SUPPORT_NUMA_LAYOUT=1
		echo "NUMA Layout: 2CPUs with 2 NUMA NODE"
	else
		# 4 CPUS on 3 NUMA NODE
		SUPPORT_NUMA_LAYOUT=2
		echo "NUMA Layoyt: 4CPUs with 3 NUMA NODE"
	fi
else
	SUPPORT_NUMA=N
fi

##
# Rootfs Inforamtion
FS_TYPE=
FS_TYPE_TOOLS=
ROOTFS_MB=${18%X}
ROOTFS_BLOCKS=$[ROOTFS_MB * 1024]

if [ ${SUPPORT_EXT3} = "Y" ]; then
	FS_TYPE=ext3
	FS_TYPE_TOOLS=mkfs.ext3
else
	FS_TYPE=ext4
	FS_TYPE_TOOLS=mkfs.ext4
fi

if [ ${SUPPORT_NONE_GNU} = "Y" ]; then
	DEF_UBOOT_CROOS=${UCROSS_PATH}/bin/arm-none-linux-gnueabi-
	DEF_KERNEL_CROSS=${OUTPUT}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-
	CROSS_COMPILE=arm-none-linux-gnueabi
elif [ ${SUPPORT_GCC341} = "Y" ]; then
	DEF_UBOOT_CROOS=${UCROSS_PATH}/bin/arm-linux-
	DEF_KERNEL_CROSS=${OUTPUT}/arm-linux/arm-linux/bin/arm-linux-
	CROSS_COMPILE=arm-linux
else
	DEF_UBOOT_CROOS=${UCROSS_PATH}/bin/${UBOOT_CROSS}-
	DEF_KERNEL_CROSS=${KCROSS_PATH}/bin/${CROSS_COMPILE}-
fi

## Lower version uboot tools
if [ ${UBOOT_CROSS}X = "arm-none-linux-gnueabiX" ]; then
	DEF_UBOOT_CROOS=${OUTPUT}/${CROSS_COMPILE}/uboot-${CROSS_COMPILE}/bin/arm-none-linux-gnueabi-
fi

##
# Debug Stuff
[ -d ${OUTPUT}/package/gdb ] && rm -rf ${OUTPUT}/package/gdb
mkdir -p ${OUTPUT}/package/gdb
# GDB pl
[ ! -f ${OUTPUT}/package/gdb/gdb.pl ] && \
cp ${ROOT}/scripts/package/gdb.pl ${OUTPUT}/package/gdb/
[ ${ARCH_NAME} == "x86_64" ] && \
cp ${ROOT}/scripts/package/gdb-x86-64.sh ${OUTPUT}/package/gdb/gdb.pl

## 
# Networking Stuff
mkdir -p ${OUTPUT}/package/networking
cp ${ROOT}/scripts/rootfs/qemu-if* ${OUTPUT}/package/networking
cp ${ROOT}/scripts/rootfs/bridge.sh ${OUTPUT}/package/networking

##
# Memory

[ ${SUPPORT_2_X} = "N" ] && [ ${DIY_MEMORY} -lt 512 ] && DIY_MEMORY=512
[ ${SUPPORT_2_X} = "Y" ] && [ ${DIY_MEMORY} -lt 256 ] && DIY_MEMORY=256
[ ${SUPPORT_ONLYRUN} = "Y" ] && [ ${DIY_MEMORY} -lt 1024 ] && DIY_MEMORY=1024
[ ${SUPPORT_DEBIAN} = "Y" ] && [ ${DIY_MEMORY} -lt 1024 ] && DIY_MEMORY=1024

## 
# Auto create Running scripts
MF=${OUTPUT}/${RUNSCP_NAME}
[ -f ${MF} ] && rm -rf ${MF}

DATE_COMT=`date +"%Y.%m.%d"`
cat << EOF >> ${MF}
#!/bin/bash

# Build system.
#
# (C) ${DATE_COMT} BiscuitOS <buddy.zhang@aliyun.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

ROOT=${OUTPUT}
QEMUT=${QEMU}
BROILER=${BROILER}
ARCH=${ARCH_NAME}
BUSYBOX=${BUSYBOX}
OUTPUT=${OUTPUT}
ROOTFS_NAME=${ROOTFS_NAME}
CROSS_COMPILE=${CROSS_COMPILE}
FS_TYPE=${FS_TYPE}
FS_TYPE_TOOLS=${FS_TYPE_TOOLS}
ROOTFS_SIZE=${18%X}
FREEZE_SIZE=${17%X}
CPU_NUM=${DIY_CPU_NUM}
DL=${ROOT}/dl
DEBIAN_PACKAGE=${DEBIAN_PACKAGE}
RAM_SIZE=${DIY_MEMORY}
[ ${SUPPORT_CMDLINE} = "Y" -o ${SUPPORT_CXL_HW} = "Y" -o ${SUPPORT_PMEM_HW} = 'Y' ] && DIY_CMDLINE="${DIY_CMDLINE} ${CXL_CMDLINE} movable_node"
DMESG_LOGLEVEL=${DMESG_LOGLEVEL}
EOF
## RAM size
if [ ${SUPPORT_NUMA_HW} = "Y" ]; then
	if [ ${SUPPORT_NUMA_TOPOLOGY} = 4 ]; then
		echo 'NUMA_LAYOUT_MEMORY_0=`echo "${RAM_SIZE}/4"|bc`' >> ${MF}
	elif [ ${SUPPORT_NUMA_TOPOLOGY} = 6 ]; then
		echo 'NUMA_LAYOUT_MEMORY_0=`echo "${RAM_SIZE}/4"|bc`' >> ${MF}
		echo 'NUMA_LAYOUT_MEMORY_1=`echo "${RAM_SIZE}/2"|bc`' >> ${MF}
	else
		echo 'NUMA_LAYOUT_MEMORY_0=`echo "${RAM_SIZE}/2"|bc`' >> ${MF}
	fi
fi

# Platform
[ ${SUPPORT_2_X} = "Y" -a ${ARCH_NAME} == "arm" ] && echo 'MACH=versatilepb' >> ${MF} 
[ ${SUPPORT_2_X} = "N" -a ${ARCH_NAME} == "arm" ] && echo 'MACH=vexpress-a9' >> ${MF}
echo 'LINUX_DIR=${ROOT}/linux/linux/arch' >> ${MF}
echo 'NET_CFG=${ROOT}/package/networking' >> ${MF}
case ${ARCH_NAME} in
	arm)
		if [ ${SUPPORT_DEBIAN} = "N" ]; then
			[ ${SUPPORT_RAMDISK} = "Y" ] && echo 'CMDLINE="earlycon root=/dev/ram0 rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/linuxrc loglevel=8"' >> ${MF}
			[ ${SUPPORT_RAMDISK} = "N" ] && echo 'CMDLINE="earlycon root=/dev/vda rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/linuxrc loglevel=8"' >> ${MF}
		else
			echo 'CMDLINE="earlycon root=/dev/vda rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/sbin/init loglevel=8"' >> ${MF}
		fi
	;;
	arm64)
		if [ ${SUPPORT_DEBIAN} = "N" ]; then
			[ ${SUPPORT_RAMDISK} = "Y" ] && echo 'CMDLINE="earlycon root=/dev/ram0 rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/linuxrc loglevel=8"' >> ${MF}
			[ ${SUPPORT_RAMDISK} = "N" ] && echo 'CMDLINE="earlycon root=/dev/vda rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/linuxrc loglevel=8"' >> ${MF}
		else
			echo 'CMDLINE="earlycon root=/dev/vda rw rootfstype=${FS_TYPE} console=ttyAMA0 init=/sbin/init loglevel=8"' >> ${MF}

		fi
	;;
	riscv32)
		echo 'CMDLINE="root=/dev/vda rw console=ttyS0 init=/linuxrc loglevel=8"' >> ${MF}
	;;
	riscv64)
		echo 'CMDLINE="root=/dev/vda rw console=ttyS0 init=/linuxrc loglevel=8"' >> ${MF}
	;;
	x86)
		[ ${SUPPORT_DISK} = "N" ] && echo 'CMDLINE="root=/dev/ram0 rw rootfstype=${FS_TYPE} console=ttyS0 init=/linuxrc loglevel=${DMESG_LOGLEVEL}"' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo 'CMDLINE="root=/dev/sda rw rootfstype=${FS_TYPE} console=ttyS0 init=/linuxrc loglevel=${DMESG_LOGLEVEL}"' >> ${MF}
	;;
	x86_64)
		if [ ${SUPPORT_HYPV} = "Broiler" ]; then
			echo 'CMDLINE="noapic noacpi pci=conf1 reboot=k panic=1 i8042.direct=1 i8042.dumbkbd=1 i8042.nopnp=1 i8042.noaux=1 root=/dev/vda rw rootfstype=ext4 console=ttyS0 loglevel=${DMESG_LOGLEVEL}"' >> ${MF}
		else
			[ ${SUPPORT_DISK} = "N" ] && echo 'CMDLINE="root=/dev/ram0 rw rootfstype=${FS_TYPE} console=ttyS0 init=/linuxrc loglevel=${DMESG_LOGLEVEL} ${DIY_CMDLINE}"' >> ${MF}
			[ ${SUPPORT_DISK} = "Y" ] && echo 'CMDLINE="root=/dev/sda rw rootfstype=${FS_TYPE} console=ttyS0 init=/linuxrc loglevel=${DMESG_LOGLEVEL} ${DIY_CMDLINE}"' >> ${MF}
		fi
	;;
esac

# RISC-V BBL
if [ ${ARCH_NAME} = "riscv64" -o ${ARCH_NAME} = "riscv32" ]; then
	echo 'PACKAGE=${ROOT}/package/' >> ${MF}
	echo 'RISCV_PK=' >> ${MF}
	echo 'RISCV_BBL=${ROOT}/linux/linux/riscvbbl' >> ${MF}
	echo '' >> ${MF}
	echo '# Risc-V BBL' >> ${MF}
	echo 'riscv_bbl()' >> ${MF}
	echo '{' >> ${MF}
	echo -e '\tDirlist=`ls ${PACKAGE}`' >> ${MF}
	echo -e '\tfor dir in ${Dirlist}' >> ${MF}
	echo -e '\tdo' >> ${MF}
	echo -e '\t\t[ ${dir:0:8} = "riscv-pk" ] && RISCV_PK=${dir}' >> ${MF}
	echo -e '\tdone' >> ${MF}
	echo -e '\t[ ! ${RISCV_PK} ] && return 0' >> ${MF}
	echo -e '\tcd ${PACKAGE}/${RISCV_PK} > /dev/null 2>&1' >> ${MF}
	echo -e '\tif [ ! -d ${RISCV_PK} ]; then' >> ${MF}
	echo -e '\t\tmake download' >> ${MF}
	echo -e '\t\tmake tar' >> ${MF}
	echo -e '\t\tmake configure' >> ${MF}
	echo -e '\tfi' >> ${MF}
	echo -e '\tmake > /dev/null 2>&1' >> ${MF}
	echo -e '\tcp ${RISCV_PK}/build/bbl ${OUTPUT}/linux/linux/riscvbbl' >> ${MF}
	echo -e '\tcd - > /dev/null 2>&1' >> ${MF}
	echo -e '\t' >> ${MF}
	echo '}' >> ${MF}
fi

if [ ${SUPPORT_UBOOT} = "Y" ]; then
	echo "UBOOT=${OUTPUT}/u-boot/u-boot" >> ${MF}
	echo 'PART_TAB_SZ=1' >> ${MF}
	echo 'MMC0P1_SZ=20' >> ${MF}
	echo 'MMC0P2_SZ=${ROOTFS_SIZE}' >> ${MF}
	echo 'MMC0P1_SEEK=`expr ${PART_TAB_SZ} + ${MMC0P1_SZ}`' >> ${MF}
	echo 'SD_SIZE=`expr ${MMC0P1_SZ} + ${MMC0P2_SZ} + ${PART_TAB_SZ}`' >> ${MF}
	echo '' >> ${MF}
	echo '# Partition Table' >> ${MF}
	echo 'SD_PTAB_BEG=0' >> ${MF}
	echo 'SD_PTAB=`expr ${PART_TAB_SZ} \* 1024 \* 1024 \/ 512`' >> ${MF}
	echo 'SD_PTAB_END=`expr ${SD_PTAB_BEG} + ${SD_PTAB} - 1`' >> ${MF}
	echo '# mmcblk0p1' >> ${MF}
	echo 'SD_MMC0_BEG=`expr ${SD_PTAB_END} + 1`' >> ${MF}
	echo 'SD_MMC0=`expr ${MMC0P1_SZ} \* 1024 \* 1024 \/ 512`' >> ${MF}
	echo 'SD_MMC0_END=`expr ${SD_MMC0_BEG} + ${SD_MMC0} - 1`' >> ${MF}
	echo '# mmcblk0p1' >> ${MF}
	echo 'SD_MMC1_BEG=`expr ${SD_MMC0_END} + 1`' >> ${MF}
	echo 'SD_MMC1=`expr ${MMC0P2_SZ} \* 1024 \* 1024 \/ 512`' >> ${MF}
	echo 'SD_MMC1_END=`expr ${SD_MMC1_BEG} + ${SD_MMC1} - 1`' >> ${MF}
	echo '' >> ${MF}
	echo 'do_uboot()' >> ${MF}
	echo '{' >> ${MF}
	echo -e '\tmkimage -A arm \' >> ${MF}
	echo -e '\t\t-C none \' >> ${MF}
	echo -e '\t\t-O linux \' >> ${MF}
	echo -e '\t\t-T kernel \' >> ${MF}
	echo -e '\t\t-n BiscuitOS \' >> ${MF}
	echo -e '\t\t-a 0x60008000 \' >> ${MF}
	echo -e '\t\t-e 0x60008000 \' >> ${MF}
	echo -e '\t\t-d ${LINUX_DIR}/${ARCH}/boot/zImage \' >> ${MF}
	echo -e '\t\t${LINUX_DIR}/${ARCH}/boot/uImage' >> ${MF}
	echo -e '\t# SD card boot' >> ${MF}
	echo -e '\t[ -d ${OUTPUT}/.tmpsd ] && sudo rm -rf ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\tsudo losetup -o `expr ${SD_MMC0_BEG} \* 512` ${loopdev} ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
	echo -e '\tsudo mkdir -p ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo mount -o loop,rw ${loopdev} ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/uImage ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/dts/vexpress-v2p-ca9.dtb ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo umount ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo rm -rf ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo losetup -d ${loopdev}' >> ${MF}
	echo -e '\t' >> ${MF}
	echo -e '\t# Uboot boot-cmd' >> ${MF}
	echo -e '\t# --> fatload mmc 0:1 0x60200000 uImage' >> ${MF}
	echo -e '\t# --> fatload mmc 0:1 0x60800000 vexpress-v2p-ca9.dtb' >> ${MF}
	echo -e '\t# --> setenv bootargs 'earlycon root=/dev/mmcblk0p1 rw rootfstype=ext4 console=ttyAMA0 init=/linuxrc loglevel=8'' >> ${MF}
	echo -e '\t# --> bootm 0x60200000 - 0x60800000' >> ${MF}
	echo -e '\tsudo ${QEMUT} \' >> ${MF}
	echo -e '\t-M vexpress-a9 \' >> ${MF}
	echo -e '\t-kernel ${UBOOT}/u-boot \' >> ${MF}
	echo -e '\t-sd ${OUTPUT}/Hardware/BiscuitOS.img \' >> ${MF}
	echo -e '\t-m ${RAM_SIZE}M \' >> ${MF}
	echo -e '\t-nographic' >> ${MF}
	echo '}' >> ${MF}
fi

## 
# Common Running function
# 
# -> Used to launch a Server Linux 
echo '' >> ${MF}
echo 'do_running()' >> ${MF}
echo '{' >> ${MF}
echo -e '\tSUPPORT_DEBUG=N' >> ${MF}
echo -e '\tSUPPORT_NET=N' >> ${MF}
echo -e '\t[ ${1}X = "debug"X -o ${2}X = "debug"X ] && ARGS+="-s -S "' >> ${MF}
echo -e '\tif [ ${1}X = "net"X  -o ${2}X = "net"X ]; then' >> ${MF}
echo -e '\t\tARGS+="-net tap "' >> ${MF}
echo -e '\t\tARGS+="-device virtio-net-device,netdev=bsnet0,"' >> ${MF}
echo -e '\t\tARGS+="mac=E0:FE:D0:3C:2E:EE "' >> ${MF}
echo -e '\t\tARGS+="-netdev tap,id=bsnet0,ifname=bsTap0 "' >> ${MF}
echo -e '\tfi' >> ${MF}
echo -e '\t[ ${1}X = "bios"X ] && ARGS+="-bios ${ROOT}/qemu-system/qemu-system/roms/seabios/out/bios.bin "' >> ${MF}
echo -e '\t[ ${2}X = "bios-debug"X ] && ARGS+="-chardev pipe,path=${ROOT}/qemu-system/qemu-system/roms/seabios/BiscuitOS-pipe,id=seabios -device isa-debugcon,iobase=0x402,chardev=seabios "' >> ${MF}
echo -e '\t' >> ${MF}
echo -e '\tARGS+="-D ${ROOT}/qemu-system/BiscuitOS-QEMU.log "' >> ${MF}
echo '' >> ${MF}
case ${ARCH_NAME} in
	arm) 
		[ ${SUPPORT_ONLYRUN} = "N" ] && echo -e '\t${ROOT}/package/gdb/gdb.pl ${ROOT} ${CROSS_COMPILE}' >> ${MF}
		echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
		echo -e '\t-M ${MACH} \' >> ${MF}
		echo -e '\t-m ${RAM_SIZE}M \' >> ${MF}
		[ ${SUPPORT_ONLYRUN} = "N" ] && echo -e '\t-kernel ${LINUX_DIR}/${ARCH}/boot/zImage \' >> ${MF}
		[ ${SUPPORT_ONLYRUN} = "Y" ] && echo -e '\t-kernel ${ROOT}/images/zImage \' >> ${MF}
		# Support DTB/DTS/FDT
		[ ${SUPPORT_DTB} = "Y" -a ${SUPPORT_ONLYRUN} = "N" ] && echo -e '\t-dtb ${LINUX_DIR}/${ARCH}/boot/dts/vexpress-v2p-ca9.dtb \' >> ${MF}
		[ ${SUPPORT_DTB} = "Y" -a ${SUPPORT_ONLYRUN} = "Y" ] && echo -e '\t-dtb ${ROOT}/images/vexpress-v2p-ca9.dtb \' >> ${MF}
		# Support HardDisk
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-device virtio-blk-device,drive=hd1 \' >> ${MF}
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-drive file=${ROOT}/Hardware/Freeze.img,format=raw,id=hd1 \' >> ${MF} 
		# Support Mount root on HardDisk
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-device virtio-blk-device,drive=hd0 \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-drive file=${ROOT}/Hardware/BiscuitOS.img,format=raw,id=hd0 \' >> ${MF} 
		# Support RAMDISK only
		[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		# Discard Ctrl-C to exit and default Ctrl-A + X
		# echo -e '\t-serial stdio \' >> ${MF}
		# echo -e '\t-nodefaults \' >> ${MF}
		[ ${SUPPORT_DESKTOP} = "N" ] && echo -e '\t-nographic \' >> ${MF}
		echo -e '\t-append "${CMDLINE}"' >> ${MF}
	;;
	arm64)
		echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
		echo -e '\t-M virt \' >> ${MF}
		echo -e '\t-m ${RAM_SIZE}M \' >> ${MF}
		echo -e '\t-cpu cortex-a53 \' >> ${MF}
		echo -e '\t-smp 2 \' >> ${MF}
		echo -e '\t-kernel ${LINUX_DIR}/${ARCH}/boot/Image \' >> ${MF}
		# Support HardDisk
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-device virtio-blk-device,drive=hd1 \' >> ${MF}
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-drive if=none,file=${ROOT}/Hardware/Freeze.img,format=raw,id=hd1 \' >> ${MF} 
		# Support Mount root on HardDisk
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-device virtio-blk-device,drive=hd0 \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-drive if=none,file=${ROOT}/Hardware/BiscuitOS.img,format=raw,id=hd0 \' >> ${MF} 
		# Support RAMDISK only
		[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		# discard Ctrl-C to exit and default Ctrl-A + X
		# echo -e '\t-serial stdio \' >> ${MF}
		# echo -e '\t-nodefaults \' >> ${MF}
		echo -e '\t-nographic \' >> ${MF}
		echo -e '\t-append "${CMDLINE}"' >> ${MF}
	;;
	riscv32)
		echo -e '\triscv_bbl' >> ${MF}
		echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
		echo -e '\t-machine virt \' >> ${MF}
		echo -e '\t-kernel ${RISCV_BBL} \' >> ${MF}
		# Support Mount root on HardDisk
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-device virtio-blk-device,drive=hd0 \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-drive if=none,file=${ROOT}/Hardware/BiscuitOS.img,format=raw,id=hd0 \' >> ${MF} 
		# Support HardDisk
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-device virtio-blk-device,drive=hd1 \' >> ${MF}
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-drive if=none,file=${ROOT}/Hardware/Freeze.img,format=raw,id=hd1 \' >> ${MF} 
		# Support RAMDISK only
		[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		# Discard Ctrl-C to exit and default Ctrl-A + X
		# echo -e '\t-serial stdio \' >> ${MF}
		# echo -e '\t-nodefaults \' >> ${MF}
		echo -e '\t-nographic \' >> ${MF}
		echo -e '\t-append "${CMDLINE}"' >> ${MF}
	;;
	riscv64)
		echo -e '\triscv_bbl' >> ${MF}
		echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
		echo -e '\t-machine virt \' >> ${MF}
		echo -e '\t-kernel ${RISCV_BBL} \' >> ${MF}
		# Support Mount root on HardDisk
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-device virtio-blk-device,drive=hd0 \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-drive if=none,file=${ROOT}/Hardware/BiscuitOS.img,format=raw,id=hd0 \' >> ${MF} 
		# Support HardDisk
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-device virtio-blk-device,drive=hd1 \' >> ${MF}
		[ ${SUPPORT_BLK} = "Y" ]  && echo -e '\t-drive if=none,file=${ROOT}/Hardware/Freeze.img,format=raw,id=hd1 \' >> ${MF} 
		# Support RAMDISK only
		[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		# Discard Ctrl-C to exit and default Ctrl-A + X
		# echo -e '\t-serial stdio \' >> ${MF}
		# echo -e '\t-nodefaults \' >> ${MF}
		echo -e '\t-nographic \' >> ${MF}
		echo -e '\t-append "${CMDLINE}"' >> ${MF}
	;;
	x86)
		echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
		echo -e '\t-smp 2 \' >> ${MF}
		[ ${SUPPORT_KVM} = "yX" ] && echo -e '\t-cpu host \' >> ${MF}
		[ ${SUPPORT_KVM} = "yX" ] && echo -e '\t-enable-kvm \' >> ${MF}
		echo -e '\t-m ${RAM_SIZE}M \' >> ${MF}
		[ ${SUPPORT_SEABIOS} = "Y" ] && echo -e '\t-bios ${OUTPUT}/bootloader/seaBIOS/out/bios.bin \' >> ${MF}
		echo -e '\t-kernel ${LINUX_DIR}/${ARCH}/boot/bzImage \' >> ${MF}
		# Support Ramdisk
		[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		# Discard Ctrl-C to exit and default Ctrl-A + X
		# echo -e '\t-serial stdio \' >> ${MF}
		# echo -e '\t-nodefaults \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-hda ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" -a ${SUPPORT_VIRTIO} = "N" ] && echo -e '\t-hdb ${ROOT}/Hardware/Freeze.img \' >> ${MF}
		[ ${SUPPORT_DISK} = "Y" -a ${SUPPORT_VIRTIO} = "Y" ] && echo -e '\t-drive file=${ROOT}/Hardware/Freeze.img,if=virtio \' >> ${MF}
		echo -e '\t-nographic \' >> ${MF}
		echo -e '\t-serial mon:stdio \' >> ${MF}
		echo -e '\t-qmp tcp:localhost:8888,server,nowait \' >> ${MF}
		echo -e '\t-append "${CMDLINE}"' >> ${MF}
	;;
	x86_64)
		echo -e '\t[ ${1}X = "debug"X -o ${2}X = "debug"X ] && ${ROOT}/package/gdb/gdb.pl ${ROOT}' >> ${MF}
		if [ ${SUPPORT_HYPV} = "Broiler" ]; then
			echo -e '\tsudo ${BROILER} \' >> ${MF}
			echo -e '\t\t--kernel ${LINUX_DIR}/x86/boot/bzImage \' >> ${MF}
			echo -e '\t\t--rootfs ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
			echo -e '\t\t--memory ${RAM_SIZE} \' >> ${MF}
			echo -e '\t\t--cpu 2 \' >> ${MF}
			echo -e '\t\t--cmdline "${CMDLINE}"' >> ${MF}
		else
			echo -e '\tsudo ${QEMUT} ${ARGS} \' >> ${MF}
			if [ ${SUPPORT_NUMA_HW} = "Y" ]; then
				if [ ${SUPPORT_NUMA_TOPOLOGY} = 1 ]; then
					# x2 Socket NUMA NODE with QPI(Xeon E5-2600 LCC)
					#    - x2 Socket
					#    - x1 Die Per Socket
					#    - x1 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=2,sockets=2,cores=1,threads=1,maxcpus=2 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=BiscuitOS-MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=1,memdev=BiscuitOS-MEM1 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=0,socket-id=0 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=1,socket-id=1 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=200 \' >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				elif [ ${SUPPORT_NUMA_TOPOLOGY} = 2 ]; then
					# x2 Socket NUMA NODE with RingBus(Xeon E5-2600 HCC)
					#    - x2 Socket
					#    - x1 Die Per Socket
					#    - x2 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=4,sockets=2,cores=2,threads=1,maxcpus=4 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=BiscuitOS-MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=1,memdev=BiscuitOS-MEM1 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=0,socket-id=0 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=1,socket-id=1 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=200 \' >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				elif [ ${SUPPORT_NUMA_TOPOLOGY} = 3 ]; then
					# x2 SNC NUMA NODE with Mesh(Xeon Skylake-SP)
					#    - x1 Socket
					#    - x1 Die Per Socket
					#    - x2 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=2,sockets=1,cores=2,threads=1,maxcpus=2 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-numa node,memdev=BiscuitOS-MEM0,cpus=0,nodeid=0 \' >> ${MF}
					echo -e '\t-numa node,memdev=BiscuitOS-MEM1,cpus=1,nodeid=1 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=10 \' >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				elif [ ${SUPPORT_NUMA_TOPOLOGY} = 4 ]; then
					# x2 SNC + x2 Socket NUMA NODE with UPI(Xeon Skylake-SP)
					#    - x2 Socket
					#    - x1 Die Per Socket
					#    - x2 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=4,sockets=2,cores=2,threads=1,maxcpus=4 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM2,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM3,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=BiscuitOS-MEM0,cpus=0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=1,memdev=BiscuitOS-MEM1,cpus=1 \' >> ${MF}
					echo -e '\t-numa node,nodeid=2,memdev=BiscuitOS-MEM2,cpus=2 \' >> ${MF}
					echo -e '\t-numa node,nodeid=3,memdev=BiscuitOS-MEM3,cpus=3 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=20 \'  >> ${MF}
					echo -e '\t-numa dist,src=0,dst=2,val=200 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=3,val=200 \' >> ${MF}
					echo -e '\t-numa dist,src=1,dst=2,val=200 \' >> ${MF}
					echo -e '\t-numa dist,src=1,dst=3,val=200 \' >> ${MF}
					echo -e '\t-numa dist,src=2,dst=3,val=20 \'  >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=3,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=3,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=3,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=3,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=0,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=1,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=2,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=3,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=2,target=3,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=0,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=1,hierarchy=memory,data-type=access-latency,latency=200 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=2,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=3,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=3,target=3,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				elif [ ${SUPPORT_NUMA_TOPOLOGY} = 5 ]; then
					# x2 Socket NUMA with PCIe
					#    - x2 Socket
					#    - x1 Die Per Socket
					#    - x1 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=2,sockets=2,cores=1,threads=1,maxcpus=2 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=BiscuitOS-MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=1,memdev=BiscuitOS-MEM1 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=0,socket-id=0 \' >> ${MF}
					echo -e '\t-numa cpu,node-id=1,socket-id=1 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=200 \' >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=100 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=1M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				elif [ ${SUPPORT_NUMA_TOPOLOGY} = 6 ]; then
					# x2 SNC with CPUless NUMA NODE
					#    - x1 Socket
					#    - x1 Die Per Socket
					#    - x2 Core Per Die
					#    - x1 Threads Per Core
					echo -e '\t-smp cpus=2,sockets=1,cores=2,threads=1,maxcpus=2 \' >> ${MF}
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM0,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM1,size=${NUMA_LAYOUT_MEMORY_0}M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=BiscuitOS-MEM2,size=${NUMA_LAYOUT_MEMORY_1}M \' >> ${MF}
					echo -e '\t-numa node,memdev=BiscuitOS-MEM0,cpus=0,nodeid=0 \' >> ${MF}
					echo -e '\t-numa node,memdev=BiscuitOS-MEM1,cpus=1,nodeid=1 \' >> ${MF}
					echo -e '\t-numa node,memdev=BiscuitOS-MEM2,nodeid=2 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=1,val=10 \' >> ${MF}
					echo -e '\t-numa dist,src=0,dst=2,val=100 \' >> ${MF}
					echo -e '\t-numa dist,src=1,dst=2,val=100 \' >> ${MF}
					if [ ${SUPPORT_NUMA_HMAT} = "Y" ]; then
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=90M \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \' >> ${MF}
						echo -e '\t-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \' >> ${MF}
					fi
				fi
			else # UMA Architecture
				echo -e '\t-smp ${CPU_NUM} \' >> ${MF}
				if [ ${SUPPORT_PMEM_HW} = "Y" -o ${SUPPORT_CXL_HW} = "Y" ]; then
					echo -e '\t-m ${RAM_SIZE}M,slots=16,maxmem=32G \' >> ${MF}
				else
					echo -e '\t-m ${RAM_SIZE}M \' >> ${MF}
				fi
			fi
			[ ${SUPPORT_CPU_Q35} = "Y" -a ${SUPPORT_CXL_HW} = "Y" ] && echo -e '\t-M q35,cxl=on \' >> ${MF}
			[ ${SUPPORT_CPU_Q35} = "Y" -a ${SUPPORT_PMEM_HW} = "Y" ] && echo -e '\t-M q35,nvdimm=on \' >> ${MF}
			[ ${SUPPORT_CPU_Q35} = "Y" -a ${SUPPORT_NUMA_HW} = "Y" ] && echo -e '\t-M q35,hmat=on \' >> ${MF}
			[ ${SUPPORT_CPU_Q35} = "Y" -a ${SUPPORT_CXL_HW} = "N" -a ${SUPPORT_PMEM_HW} = "N" -a ${SUPPORT_NUMA_HW} = "N" ] && echo -e '\t-M q35 \' >> ${MF}
			[ ${SUPPORT_vIOMMU} = "Y" ] && echo -e '\t-device intel-iommu,intremap=on \' >> ${MF}
			[ ${SUPPORT_KVM} = "yX" ] && echo -e '\t-cpu host \' >> ${MF}
			[ ${SUPPORT_KVM} = "yX" ] && echo -e '\t-enable-kvm \' >> ${MF}
			[ ${SUPPORT_SEABIOS} = "Y" ] && echo -e '\t-bios ${OUTPUT}/bootloader/seaBIOS/out/bios.bin \' >> ${MF}
			echo -e '\t-kernel ${LINUX_DIR}/x86/boot/bzImage \' >> ${MF}
			# Support Ramdisk
			# Discard Ctrl-C to exit and default Ctrl-A + X
			# echo -e '\t-serial stdio \' >> ${MF}
			# echo -e '\t-nodefaults \' >> ${MF}
			# Support HardDisk
			[ ${SUPPORT_DISK} = "Y" ] && echo -e '\t-hda ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
			[ ${SUPPORT_DISK} = "Y" -a ${SUPPORT_VIRTIO} = "N" ] && echo -e '\t-hdb ${ROOT}/Hardware/Freeze.img \' >> ${MF}
			[ ${SUPPORT_DISK} = "Y" -a ${SUPPORT_VIRTIO} = "Y" -a ${SUPPORT_CXL_HW} = "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/Freeze.img,if=virtio \' >> ${MF}
			if [ ${SUPPORT_DEFAULT_DISK} = "Y" ]; then
				[ ${SUPPORT_VDB} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDB.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDC} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDC.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDD} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDD.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDE} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDE.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDF} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDF.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDG} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDG.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDH} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDH.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDI} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDI.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDJ} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDJ.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDK} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDK.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDL} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDL.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDM} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDM.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDN} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDN.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDO} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDO.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDP} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDP.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDQ} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDQ.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDR} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDR.img,if=virtio \' >> ${MF}
				[ ${SUPPORT_VDS} != "N" ] && echo -e '\t-drive file=${ROOT}/Hardware/VDS.img,if=virtio \' >> ${MF}
			fi
			[ ${SUPPORT_DISK} = "N" ] && echo -e '\t-initrd ${ROOT}/Hardware/BiscuitOS.img \' >> ${MF}
			# HW Device
			[ ${SUPPORT_HW_PCI_BAR} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-BAR \' >> ${MF}
			[ ${SUPPORT_HW_PCI_INTX} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-INTX \' >> ${MF}
			[ ${SUPPORT_HW_PCI_MSI} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-MSI \' >> ${MF}
			[ ${SUPPORT_HW_PCI_MSIX} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-MSIX \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_INTX} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-DMA-INTX \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_MSI} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-DMA-MSI \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_MSIX} = "Y" ] && echo -e '\t-device BiscuitOS-PCI-DMA-MSIX \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_BUF} = "Y" ] && echo -e '\t-device BiscuitOS-DMA-BUF-EXPORT \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_BUF} = "Y" ] && echo -e '\t-device BiscuitOS-DMA-BUF-IMPORTA \' >> ${MF}
			[ ${SUPPORT_HW_PCI_DMA_BUF} = "Y" ] && echo -e '\t-device BiscuitOS-DMA-BUF-IMPORTB \' >> ${MF}
			[ ${SUPPORT_HW_CXL_GPU} = "Y" ] && echo -e '\t-device BiscuitOS-CXL-GPU \' >> ${MF}
			if [ ${SUPPORT_CXL_HW} = "Y" ]; then
				if [ ${SUPPORT_CXL_TPG_NR} = "0" ]; then
					## CXL TOPLOGY: DirectEP: x1 Type3 PMEM on CXL RootPort
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM0,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY0,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA0,share=on,mem-path=${ROOT}/Hardware/CXL.LAB0,size=16M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL_RP.0,memdev=CXL-HOST-MEM0,id=CXL-PMEM0,lsa=CXL-LSA0 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "1" ]; then
					## CXL TOPLOGY: DirectEP: x1 Type3 DDR on CXL RootPort
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM0,share=on,size=512M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL_RP.0,volatile-memdev=CXL-HOST-MEM0,id=CXL-DDR0 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "2" ]; then
					## CXL TOPLOGY: CXL2.0 - x1 VCS + x1 Type3 PMEM
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM0,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY0,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA0,share=on,mem-path=${ROOT}/Hardware/CXL.LAB0,size=16M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=2,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=3,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=4,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=5,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH0-DP0,memdev=CXL-HOST-MEM0,id=CXL-PMEM0,lsa=CXL-LSA0 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "3" ]; then
					## CXL TOPLOGY: CXL2.0 - x1 VCS + x1 Type3 DDR
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM0,share=on,size=512M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2,port=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3,port=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4,port=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5,port=5 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH0-DP0,volatile-memdev=CXL-HOST-MEM0,id=CXL-DDR0 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "4" ]; then
					## CXL TOPLOGY: CXL2.0 - x1 VCS + x4 Type3 DDR
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM0,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM1,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM2,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM3,share=on,size=256M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=0,bus=CXL-SWITCH,id=CXL-SWITCH-DP0,chassis=0,slot=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=1,bus=CXL-SWITCH,id=CXL-SWITCH-DP1,chassis=0,slot=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=2,bus=CXL-SWITCH,id=CXL-SWITCH-DP2,chassis=0,slot=5 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=3,bus=CXL-SWITCH,id=CXL-SWITCH-DP3,chassis=0,slot=6 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=4,bus=CXL-SWITCH,id=CXL-SWITCH-DP4,chassis=0,slot=7 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP0,volatile-memdev=CXL-HOST-MEM0,id=CXL-EP-DDR0 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP1,volatile-memdev=CXL-HOST-MEM1,id=CXL-EP-DDR1 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP2,volatile-memdev=CXL-HOST-MEM2,id=CXL-EP-DDR2 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP3,volatile-memdev=CXL-HOST-MEM3,id=CXL-EP-DDR3 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "5" ]; then
					## CXL TOPLOGY: CXL2.0 - x1 VCS + x4 Type3 PMEM
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM0,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY0,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA0,share=on,mem-path=${ROOT}/Hardware/CXL.LAB0,size=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM1,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY1,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA1,share=on,mem-path=${ROOT}/Hardware/CXL.LAB1,size=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM2,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY2,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA2,share=on,mem-path=${ROOT}/Hardware/CXL.LAB2,size=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-HOST-MEM3,share=on,mem-path=${ROOT}/Hardware/CXL.MEMORY3,size=512M,align=16M \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-LSA3,share=on,mem-path=${ROOT}/Hardware/CXL.LAB3,size=16M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=0,bus=CXL-SWITCH,id=CXL-SWITCH-DP0,chassis=0,slot=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=1,bus=CXL-SWITCH,id=CXL-SWITCH-DP1,chassis=0,slot=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=2,bus=CXL-SWITCH,id=CXL-SWITCH-DP2,chassis=0,slot=5 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=3,bus=CXL-SWITCH,id=CXL-SWITCH-DP3,chassis=0,slot=6 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=4,bus=CXL-SWITCH,id=CXL-SWITCH-DP4,chassis=0,slot=7 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP0,memdev=CXL-HOST-MEM0,id=CXL-EP-PMEM0,lsa=CXL-LSA0 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP1,memdev=CXL-HOST-MEM1,id=CXL-EP-PMEM1,lsa=CXL-LSA1 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP2,memdev=CXL-HOST-MEM2,id=CXL-EP-PMEM2,lsa=CXL-LSA2 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH-DP3,memdev=CXL-HOST-MEM3,id=CXL-EP-PMEM3,lsa=CXL-LSA3 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "6" ]; then
					## CXL TOPLOGY: CXL2.0 - x2 VCS + x4 Type3 DDR(PerVCS)
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM0,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM1,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM2,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM3,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM4,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM5,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM6,share=on,size=256M \' >> ${MF}
					echo -e '\t-object memory-backend-ram,id=CXL-HOST-MEM7,share=on,size=256M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.1,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=2.0,chassis=0,slot=2,port=2 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-VCS0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS0,id=CXL-VCS0-DP0,chassis=0,slot=3,port=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS0,id=CXL-VCS0-DP1,chassis=0,slot=4,port=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS0,id=CXL-VCS0-DP2,chassis=0,slot=5,port=5 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS0,id=CXL-VCS0-DP3,chassis=0,slot=6,port=6 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS0,id=CXL-VCS0-DP4,chassis=0,slot=7,port=7 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS0-DP0,volatile-memdev=CXL-HOST-MEM0,id=CXL-EP-DDR0 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS0-DP1,volatile-memdev=CXL-HOST-MEM1,id=CXL-EP-DDR1 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS0-DP2,volatile-memdev=CXL-HOST-MEM2,id=CXL-EP-DDR2 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS0-DP3,volatile-memdev=CXL-HOST-MEM3,id=CXL-EP-DDR3 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.1,id=CXL-VCS1 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS1,id=CXL-VCS1-DP0,chassis=0,slot=8,port=8 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS1,id=CXL-VCS1-DP1,chassis=0,slot=9,port=9 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS1,id=CXL-VCS1-DP2,chassis=0,slot=10,port=10 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS1,id=CXL-VCS1-DP3,chassis=0,slot=11,port=11 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-VCS1,id=CXL-VCS1-DP4,chassis=0,slot=12,port=12 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS1-DP0,volatile-memdev=CXL-HOST-MEM4,id=CXL-EP-DDR4 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS1-DP1,volatile-memdev=CXL-HOST-MEM5,id=CXL-EP-DDR5 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS1-DP2,volatile-memdev=CXL-HOST-MEM6,id=CXL-EP-DDR6 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-VCS1-DP3,volatile-memdev=CXL-HOST-MEM7,id=CXL-EP-DDR7 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "7" ]; then
					## CXL TOPLOGY: CXL2.0 - x2 Host(VH) + SLD
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=2,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=3,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=4,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=5,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "8" ]; then
					## CXL TOPLOGY: CXL2.0 - x2 Host(VH) + MLD
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=2,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=3,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=4,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,port=5,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "9" ]; then
					## CXL TOPLOGY: CXL2.0 - x2 Host(VH) + MH-SLD
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-MHSLD0,share=on,mem-path=${ROOT}/Hardware/CXL.MHSLD,size=512M,align=16M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2,port=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3,port=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4,port=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5,port=5 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH0-DP0,volatile-memdev=CXL-MHSLD0,id=CXL-DDR0 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				elif [ ${SUPPORT_CXL_TPG_NR} = "10" ]; then
					## CXL TOPLOGY: CXL2.0 - x2 Host(VH) + MH-MLD
					echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
					echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-MHMLD0,share=on,mem-path=${ROOT}/Hardware/CXL.MHMLD,size=256M,align=16M,offset=0 \' >> ${MF}
					echo -e '\t-object memory-backend-file,id=CXL-MHMLD1,share=on,mem-path=${ROOT}/Hardware/CXL.MHMLD,size=256M,align=16M,offset=256M \' >> ${MF}
					echo -e '\t-device pxb-cxl,id=CXL.0,bus=pcie.0,bus_nr=12 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.0,bus=CXL.0,addr=0.0,chassis=0,slot=0,port=0 \' >> ${MF}
					echo -e '\t-device cxl-rp,id=CXL_RP.RSVD,bus=CXL.0,addr=1.0,chassis=0,slot=1,port=1 \' >> ${MF}
					echo -e '\t-device cxl-upstream,bus=CXL_RP.0,id=CXL-SWITCH0 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP0,chassis=1,slot=2,port=2 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP1,chassis=1,slot=3,port=3 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP2,chassis=1,slot=4,port=4 \' >> ${MF}
					echo -e '\t-device cxl-downstream,bus=CXL-SWITCH0,id=CXL-SWITCH0-DP3,chassis=1,slot=5,port=5 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH0-DP0,volatile-memdev=CXL-MHMLD0,id=CXL-DDR0 \' >> ${MF}
					echo -e '\t-device cxl-type3,bus=CXL-SWITCH0-DP1,volatile-memdev=CXL-MHMLD1,id=CXL-DDR1 \' >> ${MF}
					echo -e '\t-M cxl-fmw.0.targets.0=CXL.0,cxl-fmw.0.size=4G \' >> ${MF}
				fi
			else # SUPPORT_CXL_HW
				echo -e '\t-netdev tap,ifname=BiscuitOS-TAP,script=no,downscript=no,id=BiscuitOS-NIC \' >> ${MF}
				echo -e '\t-device virtio-net-pci,netdev=BiscuitOS-NIC \' >> ${MF}
			fi
			if [ ${SUPPORT_PMEM_HW} = "Y" ]; then
				echo -e '\t-object memory-backend-ram,size=${RAM_SIZE}M,id=MEM0 \' >> ${MF}
				echo -e '\t-numa node,nodeid=0,memdev=MEM0,cpus=0-1 \' >> ${MF}
				echo -e '\t-numa node,nodeid=1 \' >> ${MF}
				echo -e '\t-object memory-backend-file,id=PMEM0,share=on,mem-path=${ROOT}/Hardware/PMEM0,size=512M,align=16M \' >> ${MF}
				echo -e '\t-device nvdimm,id=BiscuitOS-NVDIMM0,memdev=PMEM0,label-size=2M,node=1 \' >> ${MF}
			fi
			echo -e '\t-nographic \' >> ${MF}
			echo -e '\t-serial mon:stdio \' >> ${MF}
			echo -e '\t-qmp tcp:localhost:8888,server,nowait \' >> ${MF}
			echo -e '\t-append "${CMDLINE}"' >> ${MF}
		fi
	;;
esac
echo '}' >> ${MF}
echo '' >> ${MF}
##
# Package Image
#
# -> Used to package a new image.
echo '' >>  ${MF}
echo 'do_package()' >>  ${MF}
echo '{' >> ${MF}
if [ ${SUPPORT_RPI} = "N" -a ${SUPPORT_DEBIAN} = "N" ]; then
	if [ ${SUPPORT_RAMDISK}X = "NX" ]; then
		echo -e '\tsudo cp ${BUSYBOX}/_install/*  ${OUTPUT}/rootfs/${ROOTFS_NAME} -raf' >> ${MF}
		if [ ${UBUNTU}X != "24X" ]; then
			echo -e '\tsudo chown root:root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
		else
			echo -e '\tsudo chown root.root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
		fi
		echo -e '\tif [ -f ${OUTPUT}/Hardware/BiscuitOS.img ]; then' >> ${MF}
		echo -e '\t\tmkdir -p ${OUTPUT}/rootfs/tmpfs'>> ${MF}
		echo -e '\t\tsudo mount -t ${FS_TYPE} ${OUTPUT}/Hardware/BiscuitOS.img \' >> ${MF}
		echo -e '\t\t\t\t${OUTPUT}/rootfs/tmpfs/ -o loop' >> ${MF}
		echo -e '\t\tsudo rm -rf ${OUTPUT}/rootfs/tmpfs/*' >> ${MF}
		echo -e '\t\tsudo cp -raf ${OUTPUT}/rootfs/${ROOTFS_NAME}/*  ${OUTPUT}/rootfs/tmpfs/' >> ${MF}
		echo -e '\t\tsudo umount ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		echo -e '\t\trm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		echo -e '\telse' >> ${MF}
		echo -e '\t\tdd if=/dev/zero of=${OUTPUT}/rootfs/ramdisk bs=1M count=${ROOTFS_SIZE}' >> ${MF}
		if [ ${FS_TYPE_TOOLS}X = "mkfs.ext4X" ]; then
			echo -e '\t\t${FS_TYPE_TOOLS} -E lazy_itable_init=1,lazy_journal_init=1 -F ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		else
			echo -e '\t\t${FS_TYPE_TOOLS} -F ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		fi
		echo -e '\t\tmkdir -p ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		echo -e '\t\tsudo mount -t ${FS_TYPE} ${OUTPUT}/rootfs/ramdisk \' >> ${MF}
		echo -e '\t\t              ${OUTPUT}/rootfs/tmpfs/ -o loop' >> ${MF}
		echo -e '\t\tsudo cp -raf ${OUTPUT}/rootfs/${ROOTFS_NAME}/*  ${OUTPUT}/rootfs/tmpfs/' >> ${MF}
		echo -e '\t\tsudo umount ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		[ ${SUPPORT_UBOOT} = "N" ] && echo -e '\t\tmv ${OUTPUT}/rootfs/ramdisk ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
		echo -e '\t\trm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		echo -e '\tfi' >> ${MF}
	else
		echo -e '\tsudo cp ${BUSYBOX}/_install/*  ${OUTPUT}/rootfs/${ROOTFS_NAME} -raf' >> ${MF}
		if [ ${UBUNTU}X != "24X" ]; then
			echo -e '\tsudo chown root:root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
		else
			echo -e '\tsudo chown root.root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
		fi
		echo -e '\tdd if=/dev/zero of=${OUTPUT}/rootfs/ramdisk bs=1M count=${ROOTFS_SIZE}' >> ${MF}
		if [ ${FS_TYPE_TOOLS}X = "mkfs.ext4X" ]; then
			echo -e '\t${FS_TYPE_TOOLS} -E lazy_itable_init=1,lazy_journal_init=1 -F ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		else
			echo -e '\t${FS_TYPE_TOOLS} -F ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		fi
		echo -e '\tmkdir -p ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		echo -e '\tsudo mount -t ${FS_TYPE} ${OUTPUT}/rootfs/ramdisk \' >> ${MF}
		echo -e '\t              ${OUTPUT}/rootfs/tmpfs/ -o loop' >> ${MF}
		echo -e '\tsudo cp -raf ${OUTPUT}/rootfs/${ROOTFS_NAME}/*  ${OUTPUT}/rootfs/tmpfs/' >> ${MF}
		echo -e '\tsudo umount ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		if [ ${SUPPORT_RAMDISK} = "Y" ]; then
			echo -e '\tgzip --best -c ${OUTPUT}/rootfs/ramdisk > ${OUTPUT}/rootfs/ramdisk.gz' >> ${MF}
			if [ ${ARCH_NAME} = "x86" -o ${ARCH_NAME} = "x86_64" ]; then
				echo -e '\tmv ${OUTPUT}/rootfs/ramdisk.gz ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
			
			else
				echo -e '\tmkimage -n "ramdisk" -A arm -O linux -T ramdisk -C gzip \' >> ${MF}
				echo -e '\t        -d ${OUTPUT}/rootfs/ramdisk.gz ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
			fi
			echo -e '\trm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
			echo -e '\trm -rf ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		else
			[ ${SUPPORT_UBOOT} = "N" ] && echo -e '\tmv ${OUTPUT}/rootfs/ramdisk ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
			echo -e '\trm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
		fi
	fi
	## Support UBOOT
	if [ ${SUPPORT_UBOOT} = "Y" ]; then
		echo -e '\t# SDCARD Partition: Bootload + Kernel + rootfs' >> ${MF}
		echo -e '\t#' >> ${MF}
		echo -e '\t# +-----------------+-----------------------+-------------------+' >> ${MF}
		echo -e '\t# | Partition Table | Bootloader(mmcblk0p1) | Rootfs(mmcblk0p2) |' >> ${MF}
		echo -e '\t# +-----------------+-----------------------+-------------------+' >> ${MF}
		echo -e '\t#' >> ${MF}
		echo -e '\t# Header:   ${PART_TAB_SZ}M (Reserve 512 Bytes on legacy fdiks tools)' >> ${MF}
		echo -e '\t# Bootload: ${MMC0P1_SZ}M (Contain Kernel + Uboot)' >> ${MF}
		echo -e '\t# Rootfs:   ${ROOTFS_SIZE}M' >> ${MF}
		echo -e '\tdd bs=1M count=${PART_TAB_SZ} if=/dev/zero of=${OUTPUT}/Hardware/BiscuitOS.img > \' >> ${MF}
		echo -e '\t                /dev/null 2>&1' >> ${MF}
		echo -e '\tdd bs=1M count=${MMC0P1_SZ} if=/dev/zero of=${OUTPUT}/bootloader.img > \' >> ${MF}
		echo -e '\t                /dev/null 2>&1' >> ${MF}
		echo -e '\tsudo mkfs.vfat ${OUTPUT}/bootloader.img > /dev/null 2>&1' >> ${MF}
		echo -e '\tdd bs=1M if=${OUTPUT}/bootloader.img of=${OUTPUT}/Hardware/BiscuitOS.img \' >> ${MF}
		echo -e '\t                conv=notrunc seek=${PART_TAB_SZ} > /dev/null 2>&1' >> ${MF}
		echo -e '\tdd bs=1M if=${OUTPUT}/rootfs/ramdisk of=${OUTPUT}/Hardware/BiscuitOS.img \' >> ${MF}
		echo -e '\t                conv=notrunc seek=${MMC0P1_SEEK} > /dev/null 2>&1' >> ${MF}
		echo -e '\trm -rf ${OUTPUT}/bootloader.img' >> ${MF}
		echo -e '\trm -rf ${OUTPUT}/rootfs/ramdisk' >> ${MF}
		echo -e '\t# Parting Table' >> ${MF}
		echo 'cat <<EOF | fdisk ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
		echo 'n' >> ${MF}
		echo 'p' >> ${MF}
		echo '1' >> ${MF}
		echo '${SD_MMC0_BEG}' >> ${MF}
		echo '${SD_MMC0_END}' >> ${MF}
		echo 'n' >> ${MF}
		echo 'p' >> ${MF}
		echo '2' >> ${MF}
		echo '${SD_MMC1_BEG}' >> ${MF}
		echo '${SD_MMC1_END}' >> ${MF}
		echo 'p' >> ${MF}
		echo 'w' >> ${MF}
		echo 'EOF' >> ${MF}
	fi
elif [ ${SUPPORT_RPI} = "Y" -a ${SUPPORT_DEBIAN} = "N" ]; then
	echo -e '\t# SDCARD Partition: Bootload + Kernel + rootfs' >> ${MF}
	echo -e '\t#' >> ${MF}
	echo -e '\t# +-----------------+-----------------------+-------------------+' >> ${MF}
	echo -e '\t# | Partition Table | Bootloader(mmcblk0p1) | Rootfs(mmcblk0p2) |' >> ${MF}
	echo -e '\t# +-----------------+-----------------------+-------------------+' >> ${MF}
	echo -e '\t#' >> ${MF}
	echo -e '\t# Header:   ${PART_TAB_SZ}M (Reserve 512 Bytes on legacy fdiks tools)' >> ${MF}
	echo -e '\t# Bootload: ${MMC0P1_SZ}M (Contain Kernel + Uboot)' >> ${MF}
	echo -e '\t# Rootfs:   ${ROOTFS_SIZE}M' >> ${MF}
	echo -e '\tsudo dd if=/dev/zero of=${OUTPUT}/Hardware/BiscuitOS.img bs=1M \' >> ${MF}
	echo -e '\t                                count=${SD_SIZE} > /dev/null 2>&1' >> ${MF}
	echo -e '\t# Parting Table' >> ${MF}
	echo 'cat <<EOF | sudo fdisk ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
	echo 'n' >> ${MF}
	echo 'p' >> ${MF}
	echo '1' >> ${MF}
	echo '${SD_MMC0_BEG}' >> ${MF}
	echo '${SD_MMC0_END}' >> ${MF}
	echo 'n' >> ${MF}
	echo 'p' >> ${MF}
	echo '2' >> ${MF}
	echo '${SD_MMC1_BEG}' >> ${MF}
	echo '${SD_MMC1_END}' >> ${MF}
	echo 't' >> ${MF}
	echo '1' >> ${MF}
	echo 'c' >> ${MF}
	echo 't' >> ${MF}
	echo '2' >> ${MF}
	echo '83' >> ${MF}
	echo 'x' >> ${MF}
	echo 'i' >> ${MF}
	echo '0x19911016' >> ${MF}
	echo 'r' >> ${MF}
	echo 'p' >> ${MF}
	echo 'w' >> ${MF}
	echo 'EOF' >> ${MF}
	echo -e '\t# Format Disk' >> ${MF}
	echo -e '\t# --> sudo blkid' >> ${MF}
	echo -e '\t# --> Change LABLE and UUID/PARTUUID' >> ${MF}
	echo -e '\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\tdev=${loopdev#/dev/}' >> ${MF}
	echo -e '\tsudo losetup ${loopdev} ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
	echo -e '\tsudo kpartx -a -v -s ${loopdev}' >> ${MF}
	echo -e '\t# Setup Filesystem' >> ${MF}
	echo -e '\tsudo mkfs.vfat /dev/mapper/${dev}p1' >> ${MF}
	echo -e '\tsudo mkfs.ext4 /dev/mapper/${dev}p2' >> ${MF}
	echo -e '\t# Setup Disk LABLE' >> ${MF}
	echo -e '\techo mtools_skip_check=1 >> ~/.mtoolsrc' >> ${MF}
	echo -e '\tsudo mlabel -i /dev/mapper/${dev}p1 ::BOOT' >> ${MF}
	echo -e '\tsudo e2label /dev/mapper/${dev}p2 BiscuitOS_rootfs' >> ${MF}
	echo -e '\t# Remove virtual mount pointer' >> ${MF}
	echo -e '\tsudo kpartx -d -v ${loopdev}' >> ${MF}
	echo -e '\tsudo losetup -d ${loopdev}' >> ${MF}
	echo '' >> ${MF}
	echo -e '\t# RaspberryPi SD Image' >> ${MF}
	if [ ${SUPPORT_RPI4B} = "Y" ]; then 
		# RaspberryPi 4B
		echo -e '\t_bootloader=${OUTPUT}/package/rpi-4b-bootloader-1.0.0' >> ${MF}
		echo -e '\t_bootloaderfile=rpi-4b-bootloader' >> ${MF}
		echo -e '\t_kernel=kernel7l' >> ${MF}
		echo -e '\t_dtb=bcm2711-rpi-4-b.dtb' >> ${MF}
	else
		# RaspberryPi 3B
		echo -e '\t_bootloader=${OUTPUT}/package/rpi-3b-bootloader-1.0.0' >> ${MF}
		echo -e '\t_bootloaderfile=rpi-3b-bootloader' >> ${MF}
		echo -e '\t_kernel=kernel7' >> ${MF}
		echo -e '\t_dtb=bcm2710-rpi-3-b.dtb' >> ${MF}
	fi
	echo -e '\tif [ ! -d ${_bootloader}/${_bootloaderfile} ]; then' >> ${MF}
	echo -e '\t\tcd ${_bootloader} > /dev/null 2>&1' >> ${MF}
	echo -e '\t\tmake download' >> ${MF}
	echo -e '\t\tmake tar' >> ${MF}
	echo -e '\t\tcd - > /dev/null 2>&1' >> ${MF}
	echo -e '\tfi' >> ${MF}
	echo -e '\t# Mount bootloader partiton' >> ${MF}
	echo -e '\t[ -d ${OUTPUT}/.tmpsd ] && sudo rm -rf ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\tsudo losetup -o `expr ${SD_MMC0_BEG} \* 512` ${loopdev} \' >> ${MF}
	echo -e '\t                                ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
	echo -e '\tsudo mkdir -p ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo mount -o loop,rw ${loopdev} ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\t# bootloader file' >> ${MF}
	echo -e '\tsudo cp -rf ${_bootloader}/${_bootloaderfile}/* ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\t# kernel image and DTB' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/zImage ${OUTPUT}/.tmpsd/${_kernel}.img' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/dts/${_dtb} \' >> ${MF}
	echo -e '\t                                        ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo mkdir -p ${OUTPUT}/.tmpsd/overlays' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/dts/overlays/*.dtb* \' >> ${MF}
	echo -e '\t                                        ${OUTPUT}/.tmpsd/overlays/' >> ${MF}
	echo -e '\tsudo cp ${LINUX_DIR}/${ARCH}/boot/dts/overlays/README \' >> ${MF}
	echo -e '\t                                        ${OUTPUT}/.tmpsd/overlays/' >> ${MF}
	echo -e '\tsudo umount ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo rm -rf ${OUTPUT}/.tmpsd' >> ${MF}
	echo -e '\tsudo losetup -d ${loopdev}' >> ${MF}
	echo -e '\t# Mount rootfs partition' >> ${MF}
	echo -e '\tsudo cp ${BUSYBOX}/_install/*  ${OUTPUT}/rootfs/${ROOTFS_NAME} -raf' >> ${MF}
	if [ ${UBUNTU}X != "24X" ]; then
		echo -e '\tsudo chown root:root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
	else
		echo -e '\tsudo chown root.root ${OUTPUT}/rootfs/${ROOTFS_NAME}/* -R' >> ${MF}
	fi
	echo -e '\tmkdir -p ${OUTPUT}/rootfs/tmpfs' >> ${MF}
	echo -e '\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\tsudo losetup -o `expr ${SD_MMC1_BEG} \* 512` ${loopdev} \' >> ${MF}
	echo -e '\t                                        ${OUTPUT}/Hardware/BiscuitOS.img' >> ${MF}
	echo -e '\tsudo mount -t ext4 ${loopdev} ${OUTPUT}/rootfs/tmpfs/ -o loop' >> ${MF}
	echo -e '\tsudo cp -raf ${OUTPUT}/rootfs/${ROOTFS_NAME}/*  ${OUTPUT}/rootfs/tmpfs/' >> ${MF}
	echo -e '\tsync' >> ${MF}
	echo -e '\tsudo umount ${OUTPUT}/rootfs/tmpfs' >> ${MF}
	echo -e '\trm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
	echo -e '\tsudo losetup -d ${loopdev}' >> ${MF}
else # Qemu Debian
	echo -e '\tif [ ! -f ${OUTPUT}/Hardware/Freeze.img ]; then' >> ${MF}
	echo -e '\t\tsudo dd if=/dev/zero of=${OUTPUT}/Hardware/Freeze.img bs=1M count=${FREEZE_SIZE} > /dev/null 2>&1' >> ${MF}
	echo -e '\t\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\t\tdev=${loopdev#/dev/}' >> ${MF}
	echo -e '\t\tsudo losetup ${loopdev} ${OUTPUT}/Hardware/Freeze.img' >> ${MF}
	echo -e '\t\tsudo mkfs.ext4 ${loopdev}' >> ${MF}
	echo -e '\t\tsudo losetup -d ${loopdev}' >> ${MF}
	echo -e '\tfi' >> ${MF}
	echo -e '\tif [ ! -f ${OUTPUT}/${ROOTFS_NAME}.img ]; then' >> ${MF}
	echo -e '\t\tsudo dd if=/dev/zero of=${OUTPUT}/${ROOTFS_NAME}.img bs=1M count=${ROOTFS_SIZE} > /dev/null 2>&1' >> ${MF}
	echo -e '\t\tloopdev=`sudo losetup -f`' >> ${MF}
	echo -e '\t\tdev=${loopdev#/dev/}' >> ${MF}
	echo -e '\t\tsudo losetup ${loopdev} ${OUTPUT}/${ROOTFS_NAME}.img' >> ${MF}
	echo -e '\t\tsudo mkfs.ext4 ${loopdev}' >> ${MF}
	echo -e '\t\tsudo losetup -d ${loopdev}' >> ${MF}
	echo -e '\t\t[ -d ${OUTPUT}/rootfs/rootfs ] && sudo rm -rf ${OUTPUT}/rootfs/rootfs' >> ${MF}
	echo -e '\t\tsudo mkdir -p ${OUTPUT}/rootfs/rootfs' >> ${MF}
	echo -e '\t\tcd ${OUTPUT}/rootfs/rootfs > /dev/null 2>&1' >> ${MF}
	echo -e '\t\t[ ! -f ${DL}/${DEBIAN_PACKAGE} ] && echo "Buster not found!" && exit -1' >> ${MF}
	echo -e '\t\tsudo cp ${DL}/${DEBIAN_PACKAGE} ${OUTPUT}/rootfs/rootfs' >> ${MF}
	echo -e '\t\tsudo bsdtar -xpf ${DEBIAN_PACKAGE}' >> ${MF}
	echo -e '\t\tsudo rm -rf ${DEBIAN_PACKAGE}' >> ${MF}
	echo -e '\t\tcd - > /dev/null 2>&1' >> ${MF}
	echo -e '\tfi' >> ${MF}
	echo -e '\tsudo mkdir -p ${OUTPUT}/rootfs/tmpfs' >> ${MF}
	echo -e '\tsudo mount -t ${FS_TYPE} ${OUTPUT}/${ROOTFS_NAME}.img \' >> ${MF}
	echo -e '\t\t\t${OUTPUT}/rootfs/tmpfs/ -o loop' >> ${MF}
	echo -e '\tsudo cp -raf ${OUTPUT}/rootfs/rootfs/*  ${OUTPUT}/rootfs/tmpfs/' >> ${MF}
	echo -e '\tsync' >> ${MF}
	echo -e '\tsudo umount ${OUTPUT}/rootfs/tmpfs' >> ${MF}
	echo -e '\tsudo rm -rf ${OUTPUT}/rootfs/tmpfs' >> ${MF}
fi
echo '}' >> ${MF}
echo '' >> ${MF}

if [ ${SUPPORT_FREEZE_DISK} = "Y" ]; then
	# Mount Freeze Image
	echo '' >>  ${MF}
	echo 'do_mount()' >>  ${MF}
	echo '{' >>  ${MF}
	echo -e '\tmkdir -p ${ROOT}/FreezeDir' >>  ${MF}
	echo -e '\tmountpoint -q ${ROOT}/FreezeDir' >>  ${MF}
	echo -e '\t[ $? = 0 ] && echo "FreezeDir has mount!" && exit 0' >>  ${MF}
	echo -e '\t## Mount Image' >>  ${MF}
	echo -e '\tsudo mount -t ${FS_TYPE} ${ROOT}/Hardware/Freeze.img ${ROOT}/FreezeDir -o loop >> /dev/null 2>&1' >>  ${MF}
	if [ ${UBUNTU}X != "24X" ]; then
		echo -e '\tsudo chown ${USER}:${USER} -R ${ROOT}/FreezeDir' >>  ${MF}
	else
		echo -e '\tsudo chown ${USER}.${USER} -R ${ROOT}/FreezeDir' >>  ${MF}
	fi
	echo -e '\techo "=============================================="' >>  ${MF}
	echo -e '\techo "FreezeDisk: ${ROOT}/Hardware/Freeze.img"' >>  ${MF}
	echo -e '\techo "MountDiret: ${ROOT}/FreezeDir"' >>  ${MF}
	echo -e '\techo "=============================================="' >>  ${MF}
	echo '}' >>  ${MF}
	echo '' >>  ${MF}

	# Umount Freeze Image
	echo '' >>  ${MF}
	echo 'do_umount()' >>  ${MF}
	echo '{' >>  ${MF}
	echo -e '\tmountpoint -q ${ROOT}/FreezeDir' >>  ${MF}
	echo -e '\t[ $? = 1 ] && return 0' >>  ${MF}
	echo -e '\tsudo umount ${ROOT}/FreezeDir > /dev/null 2>&1' >>  ${MF}
	echo '}' >>  ${MF}
	echo '' >>  ${MF}
fi

## 
# Command parse
#
echo '# Lunching BiscuitOS' >> ${MF}
echo 'case $1 in' >> ${MF}
if [ ${SUPPORT_UBOOT} = "Y" ]; then
	echo -e '\t"uboot")' >> ${MF}
	echo -e '\t\t# Running uboot' >> ${MF}
	echo -e '\t\tdo_umount' >> ${MF}
	echo -e '\t\tdo_uboot' >> ${MF}
	echo -e '\t\t;;' >> ${MF}
fi
echo -e '\t"pack")' >> ${MF}
echo -e '\t\t# Package BiscuitOS.img' >> ${MF}
[ ${SUPPORT_ONLYRUN} = "N" ] && echo -e '\t\tdo_package' >> ${MF}
[ ${SUPPORT_ONLYRUN} = "Y" ] && echo -e '\t\techo "Packing"' >> ${MF}
echo -e '\t\t;;' >> ${MF}
echo -e '\t"debug")' >> ${MF}
echo -e '\t\t# Debugging BiscuitOS' >> ${MF}
[ ${SUPPORT_FREEZE_DISK} = "Y" ] && echo -e '\t\tdo_umount' >> ${MF}
echo -e '\t\tdo_running debug' >> ${MF}
echo -e '\t\t;;' >> ${MF}
echo -e '\t"net")' >> ${MF}
echo -e '\t\t# Establish Netwroking' >> ${MF}
echo -e '\t\tsudo ${NET_CFG}/bridge.sh' >> ${MF}
echo -e '\t\tsudo cp -rf ${NET_CFG}/qemu-ifup /etc' >> ${MF}
echo -e '\t\tsudo cp -rf ${NET_CFG}/qemu-ifdown /etc' >> ${MF}
[ ${SUPPORT_FREEZE_DISK} = "Y" ] && echo -e '\t\tdo_umount' >> ${MF}
[ ${SUPPORT_FREEZE_DISK} = "Y" ] && echo -e '\t\tdo_running net' >> ${MF}
echo -e '\t\t;;' >> ${MF}
if [ ${SUPPORT_FREEZE_DISK} = "Y" ]; then
	echo -e '\t"mount")' >> ${MF}
	echo -e '\t\t# Mount Freeze Disk' >> ${MF}
	echo -e '\t\tdo_mount' >> ${MF}
	echo -e '\t\t;;' >> ${MF}
	echo -e '\t"umount")' >> ${MF}
	echo -e '\t\t# Umount Freeze Disk' >> ${MF}
	echo -e '\t\tdo_umount' >> ${MF}
	echo -e '\t\t;;' >> ${MF}
fi
if [ ${SUPPORT_BIOS} = "Y" ]; then
	echo -e '\t"bios")' >> ${MF}
	echo -e '\t\t# Build BIOS' >> ${MF}
	echo -e '\t\tdo_running bios' >> ${MF}
	echo -e '\t\t;;' >> ${MF}
fi
if [ ${SUPPORT_DEBUG_BIOS} = "Y" ]; then
	echo -e '\t"bios-debug")' >> ${MF}
	echo -e '\t\t# Debug BIOS' >> ${MF}
	echo -e '\t\tdo_running bios bios-debug' >> ${MF}
	echo -e '\t\t;;' >> ${MF}
fi
echo -e '\t*)' >> ${MF}
echo -e '\t\t# Default Running BiscuitOS' >> ${MF}
[ ${SUPPORT_FREEZE_DISK} = "Y" ] && echo -e '\t\tdo_umount' >> ${MF}
[ ${SUPPORT_UBOOT} = "N" ] && echo -e '\t\tdo_running $1 $2' >> ${MF}
[ ${SUPPORT_UBOOT} = "Y" ] && echo -e '\t\tdo_uboot' >> ${MF}
echo -e '\t\t;;' >> ${MF}
echo -e 'esac' >> ${MF}
chmod 755 ${MF}

######################################################
## Auto create README.md
######################################################
MF=${OUTPUT}/${README_NAME}
[ -f ${MF} ] && rm -rf ${MF}

echo "BiscuitOS ${PROJECT_NAME} Usermanual" >> ${MF}
echo '--------------------------------' >> ${MF}
echo '' >> ${MF}
echo '> - [Build Linux Kernel](#A0)' >> ${MF}
echo '>' >> ${MF}
echo '> - [Build Busybox](#A1)' >> ${MF}
echo '>' >> ${MF}
echo '> - [Re-Build Rootfs](#A2)' >> ${MF}
echo '>' >> ${MF}
if [ ${SUPPORT_FREEZE_DISK} = "Y" ]; then
	echo '> - [Mount a Freeze Disk](#A3)' >> ${MF}
	echo '>' >> ${MF}
	echo '> - [Un-mount a Freeze Disk](#A4)' >> ${MF}
	echo '>' >> ${MF}
fi
echo '> - [Running BiscuitOS](#A5)' >> ${MF}
echo '>' >> ${MF}
echo '> - [Debugging BiscuitOS](#A6)' >> ${MF}
echo '>' >> ${MF}
echo '> - [Running BiscuitOS with NetWorking](#A7)' >> ${MF}

##
# Uboot Configure and Compile
if [ ${SUPPORT_UBOOT} = "Y" ]; then
	echo '>' >> ${MF}
	echo '> - [Build Uboot](#A8)' >> ${MF}
	echo '>' >> ${MF}
	echo '> - [Running Uboot](#A9)' >> ${MF}
	echo '' >> ${MF}
	echo '----------------------------------' >> ${MF}
	echo '<span id="A8"></span>' >> ${MF}
	echo '' >> ${MF}
	echo '## Build Uboot' >> ${MF}
	echo '' >> ${MF}
	echo '```' >> ${MF}
	echo "cd ${OUTPUT}/u-boot/u-boot/" >> ${MF}
	echo "make ARCH=arm clean" >> ${MF}
	[ ${SUPPORT_RPI3B} = "N" ] && echo "make ARCH=arm vexpress_ca9x4_defconfig" >> ${MF}
	[ ${SUPPORT_RPI3B} = "Y" ] && echo "make ARCH=arm rpi_2_defconfig" >> ${MF}
	echo "make ARCH=arm CROSS_COMPILE=${DEF_UBOOT_CROOS}" >> ${MF}
	echo '```' >> ${MF}
	echo '' >> ${MF}
fi

##
# Kernel Configure and Compile

echo '' >> ${MF}
echo '---------------------------------' >> ${MF}
echo '<span id="A0"></span>' >> ${MF}
echo '' >> ${MF}
echo '## Build Linux Kernel' >> ${MF}
echo '' >> ${MF}
echo '```' >> ${MF}
echo "cd ${OUTPUT}/linux/linux"  >> ${MF}
case ${ARCH_NAME} in
	arm)
		[ ${SUPPORT_26X24} = "N" ] && echo "make ARCH=${ARCH_NAME} clean" >> ${MF}
		echo "make ARCH=${ARCH_NAME} ${DEFAULT_CONFIG}" >> ${MF}
		# Kbuild menuconfig
		echo "make ARCH=${ARCH_NAME} menuconfig" >> ${MF}
		echo '' >> ${MF}
		# RamDisk
		if [ ${SUPPORT_RAMDISK} = "Y" -a ${SUPPORT_26X24} = "N" ]; then
			echo '' >> ${MF}
			echo '  General setup --->' >> ${MF}
			echo '        [*]Initial RAM filesystem and RAM disk (initramfs/initrd) support' >> ${MF}
			echo '' >> ${MF}
			echo '  Device Driver --->' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '              <*> RAM block device support' >> ${MF}
			echo "              (${ROOTFS_BLOCKS}) Default RAM disk size" >> ${MF}
			echo '' >> ${MF}
		elif [ ${SUPPORT_RAMDISK} = "Y" -a ${SUPPORT_26X24} = "Y" ]; then
			echo '  Device Driver --->' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '              <*> RAM disk support' >> ${MF}
			echo "              (${ROOTFS_BLOCKS}) Default RAM disk size (kbytes)" >> ${MF}
			echo '' >> ${MF}
		fi 
		# Linux 2.6 Special Configure
		if [ ${SUPPORT_2_X} = "Y" -a ${SUPPORT_26X24} = "N" ]; then
			echo '  Kernel Features --->' >> ${MF}
			echo '        [*] Use the ARM EABI to compile the kernel' >> ${MF}
			echo '' >> ${MF}
		fi
		# EXT3 filesystem Configure
		if [ ${SUPPORT_EXT3} = "Y" ]; then
			echo '  File systems --->' >> ${MF}
			echo '        <*> Ext3 journalling file system support' >> ${MF}
			echo '        [*]   Ext3 extended attributes' >> ${MF}
			echo '' >> ${MF}
		fi
		# Common Configure
		if [ ${SUPPORT_RPI} = "N" -a ${SUPPORT_26X24} = "N" ]; then
			echo '  Enable the block layer --->' >> ${MF}
			echo '        [*] Support for large (2TB+) block devices and files' >> ${MF}
			echo '' >> ${MF}
		fi
		echo "make ARCH=${ARCH_NAME} CROSS_COMPILE=${DEF_KERNEL_CROSS} -j4" >> ${MF}
		echo "make ARCH=${ARCH_NAME} CROSS_COMPILE=${DEF_KERNEL_CROSS} modules -j4" >> ${MF}
		echo "make ARCH=${ARCH_NAME} INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
	arm64)
		echo "make ARCH=${ARCH_NAME} clean" >> ${MF}
		echo "make ARCH=${ARCH_NAME} defconfig" >> ${MF}
		echo "make ARCH=${ARCH_NAME} menuconfig" >> ${MF}
		echo '' >> ${MF}
		# RamDisk
		if [ ${SUPPORT_RAMDISK} = "Y" ]; then
			echo '' >> ${MF}
			echo '  General setup --->' >> ${MF}
			echo '        [*]Initial RAM filesystem and RAM disk (initramfs/initrd) support' >> ${MF}
			echo '' >> ${MF}
			echo '  Device Driver --->' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '              <*> RAM block device support' >> ${MF}
			echo "              (${ROOTFS_BLOCKS}) Default RAM disk size" >> ${MF}
			echo '' >> ${MF}
		fi
		echo '' >> ${MF}
		echo '  [*] Enable loadable module support  --->' >> ${MF}
		echo '' >> ${MF}
		echo '' >> ${MF}
		echo "make ARCH=${ARCH_NAME} CROSS_COMPILE=${DEF_KERNEL_CROSS} Image -j4" >> ${MF}
		echo "make ARCH=${ARCH_NAME} CROSS_COMPILE=${DEF_KERNEL_CROSS} modules -j4" >> ${MF}
		echo "make ARCH=${ARCH_NAME} INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
	riscv32)
		echo "make ARCH=riscv clean" >> ${MF}
		echo "make ARCH=riscv BiscuitOS_riscv32_defconfig" >> ${MF}
		echo '' >> ${MF}
		echo "make ARCH=riscv CROSS_COMPILE=${DEF_KERNEL_CROSS} vmlinux -j4" >> ${MF}
		echo "make ARCH=riscv CROSS_COMPILE=${DEF_KERNEL_CROSS} modules -j4" >> ${MF}
		echo "make ARCH=riscv INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
	riscv64)
		echo "make ARCH=riscv clean" >> ${MF}
		echo "make ARCH=riscv BiscuitOS_riscv64_defconfig" >> ${MF}
		echo '' >> ${MF}
		echo "make ARCH=riscv CROSS_COMPILE=${DEF_KERNEL_CROSS} vmlinux -j4" >> ${MF}
		echo "make ARCH=riscv CROSS_COMPILE=${DEF_KERNEL_CROSS} modules -j4" >> ${MF}
		echo "make ARCH=riscv INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
	x86)
		echo "make ARCH=i386 clean" >> ${MF}
		echo "make ARCH=i386 i386_defconfig" >> ${MF}
		echo "make ARCH=i386 menuconfig" >> ${MF}
		echo '' >> ${MF}
		if [ ${SUPPORT_RAMDISK} = "Y" ]; then
			echo '  General setup --->' >> ${MF}
			echo '        [*]Initial RAM filesystem and RAM disk (initramfs/initrd) support' >> ${MF}
			echo '' >> ${MF}
			echo '  Device Driver --->' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '              <*> RAM block device support' >> ${MF}
			echo "              (${ROOTFS_BLOCKS}) Default RAM disk size" >> ${MF}
		fi
		if [ ${SUPPORT_VIRTIO} = "Y" ]; then
			echo '  Device Drivers --->' >> ${MF}
			echo '        [*] Virtio drivers --->' >> ${MF}
			echo '            <*> PCI driver for virtio devices' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '            <*> Virtio block driver' >> ${MF}
		fi
		if [ ${UBUNTU}X = "22X" ]; then
			echo '  Security options  --->' >> ${MF}
			echo '        [ ] NSA SELinux Support' >> ${MF}
			echo '' >> ${MF}
			echo '' >> ${MF}
			echo 'Patch Modify as follow:' >> ${MF}
			echo '' >> ${MF}
			echo '  vi arch/x86/boot/compressed/pgtable_64.c' >> ${MF}
			echo '    + #ifndef CONFIG_RANDOMIZE_BASE' >> ${MF}
			echo '    unsigned long __force_order;' >> ${MF}
			echo '    -#endif' >> ${MF}
			echo '' >> ${MF}
			echo '  vi tools/objtool/elf.c' >> ${MF}
			echo '    symtab = find_section_by_name(elf, ".symtab");' >> ${MF}
			echo '    if (!symtab) {' >> ${MF}
			echo '    - 	WARN("missing symbol table");' >> ${MF}
			echo '    -	return -1;' >> ${MF}
			echo '    +	return 0;' >> ${MF}
			echo '  }' >> ${MF}
		fi
		echo '' >> ${MF}
		echo "make ARCH=i386 bzImage -j4" >> ${MF}
		echo "make ARCH=i386 modules -j4" >> ${MF}
		echo "make ARCH=i386 INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
	x86_64)
		echo "make ARCH=x86_64 clean" >> ${MF}
		echo "make ARCH=x86_64 x86_64_defconfig" >> ${MF}
		echo "make ARCH=x86_64 menuconfig" >> ${MF}
		echo '' >> ${MF}
		if [ ${SUPPORT_RAMDISK} = "Y" ]; then
			echo '  General setup --->' >> ${MF}
			echo '        [*]Initial RAM filesystem and RAM disk (initramfs/initrd) support' >> ${MF}
			echo '' >> ${MF}
			echo '  Device Driver --->' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '              <*> RAM block device support' >> ${MF}
			echo "              (${ROOTFS_BLOCKS}) Default RAM disk size" >> ${MF}
		fi
		if [ ${SUPPORT_VIRTIO} = "Y" ]; then
			echo '  Device Drivers --->' >> ${MF}
			echo '        [*] Virtio drivers --->' >> ${MF}
			echo '            <*> PCI driver for virtio devices' >> ${MF}
			echo '        [*] Block devices --->' >> ${MF}
			echo '            <*> Virtio block driver' >> ${MF}
		fi
		if [ ${UBUNTU}X = "22X" ]; then
			echo '  Security options  --->' >> ${MF}
			echo '        [ ] NSA SELinux Support' >> ${MF}
			echo '' >> ${MF}
			echo '' >> ${MF}
			echo 'Patch Modify as follow:' >> ${MF}
			echo '' >> ${MF}
			echo '  vi arch/x86/boot/compressed/pgtable_64.c' >> ${MF}
			echo '    + #ifndef CONFIG_RANDOMIZE_BASE' >> ${MF}
			echo '    unsigned long __force_order;' >> ${MF}
			echo '    -#endif' >> ${MF}
			echo '' >> ${MF}
			echo '  vi tools/objtool/elf.c' >> ${MF}
			echo '    symtab = find_section_by_name(elf, ".symtab");' >> ${MF}
			echo '    if (!symtab) {' >> ${MF}
			echo '    - 	WARN("missing symbol table");' >> ${MF}
			echo '    -	return -1;' >> ${MF}
			echo '    +	return 0;' >> ${MF}
			echo '    }' >> ${MF}
		fi
		echo '' >> ${MF}
		echo "make ARCH=x86_64 bzImage -j4" >> ${MF}
		echo "make ARCH=x86_64 modules -j4" >> ${MF}
		echo "make ARCH=x86_64 INSTALL_MOD_PATH=${MODULE_INSTALL_PATH} modules_install" >> ${MF}
	;;
esac
echo '```' >> ${MF}
echo '' >> ${MF}

#############################################
# Busybox
#############################################
README_busybox()
{
cat << EOF >> ${1}
---------------------------------
<span id="A1"></span>

## Build Busybox

\`\`\`
cd ${OUTPUT}/busybox/busybox
make clean
make menuconfig
EOF
if [ ${UBUNTU}X = "22X" -o ${UBUNTU}X = "20X" ]; then
  echo '  Settings --->' >> ${1}
  echo '     [*] Build static binary (no shared libs)' >> ${1}
elif [ ${UBUNTU}X = "24X" ]; then
  echo '  Settings --->' >> ${1}
  echo '     [*] Build static binary (no shared libs)' >> ${1}
  echo '  Networking Utilities --->' >> ${1}
  echo '     [ ] tc (8.3 kb)' >> ${1}
else
  echo '  Busybox Settings --->' >> ${1}
  echo '    Build Options --->' >> ${1}
  echo '      [*] Build BusyBox as a static binary (no shared libs)' >> ${1}
fi
	if [ ${ARCH_NAME}Y = "x86Y" ]; then
		echo '      (-m32 -march=i386 -mtune=i386) Additional CFLAGS' >> ${1}
		echo '      (-m32) Additional LDFLAGS' >> ${1}
		echo '' >> ${1}
		echo "make -j4" >> ${1}
		echo "make install" >> ${1}
		echo '```' >> ${MF}
	elif [ ${ARCH_NAME}Y = "x86_64Y" ]; then
		echo '' >> ${1}
		echo "make -j4" >> ${1}
		echo "make install" >> ${1}
		echo '```' >> ${1}
	else
		echo '' >> ${1}
		echo "make CROSS_COMPILE=${DEF_KERNEL_CROSS} -j4" >> ${1}
		echo '' >> ${1}
		echo "make CROSS_COMPILE=${DEF_KERNEL_CROSS} install" >> ${1}
		echo '```' >> ${1}
	fi
}

##############################################
# Re-build Rootfs
##############################################
README_pack()
{
cat << EOF >> ${1}
---------------------------------
<span id="A2"></span>

## Re-Build Rootfs

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME} pack
\`\`\`
EOF
}

##############################################
# Running Uboot
##############################################
README_uboot()
{
cat << EOF >> ${1}
---------------------------------
<span id="A9"></span>

## Running Uboot

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME} uboot
\`\`\`
EOF
}

##############################################
# Mount/Unmount a Freeze Disk
##############################################
README_mount_freeze()
{
cat << EOF >> ${1}
---------------------------------
<span id="A3"></span>

## Mount a Freeze Disk

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME} mount
cd ${OUTPUT}/FreezeDir
\`\`\`

---------------------------------
<span id="A4"></span>

## Un-mount a Freeze Disk

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME} umount
\`\`\`

EOF
}

###################################################
# Lanuch a Linux Disto
###################################################
README_launch_BiscuitOS()
{
cat << EOF >> ${1}
---------------------------------
<span id="A5"></span>

## Running BiscuitOS

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME}
\`\`\`

If you want exit from BiscuitOS, pls use: Ctrl-A + X

EOF
}

####################################################
# Debug BiscuitOS (Linux/uboot)
#####################################################
# ARM
README_arm_debug()
{
cat << EOF >> ${1}
---------------------------------
<span id="A6"></span>

## Debuging BiscuitOS

> - [Debugging zImage before Relocated](#B0)
>
> - [Debugging zImage After Relocated](#B1)
>
> - [Debugging kernel MMU OFF before start_kernel](#B2)
>
> - [Debugging kernel MMU ON before start_kernel](#B3)
>
> - [Debugging kernel after start_kernel](#B4)

--------------------------------
<span id="B0"></span>

#### Debugging zImage before Relocated

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb -x ${OUTPUT}/package/gdb/gdb_zImage

(gdb) b XXX_bk
(gdb) c
(gdb) info reg
\`\`\`

--------------------------------
<span id="B1"></span>

#### Debugging zImage After Relocated

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb -x ${OUTPUT}/package/gdb/gdb_RzImage

(gdb) b XXX_bk
(gdb) c
(gdb) info reg
\`\`\`

--------------------------------
<span id="B2"></span>

#### Debugging kernel MMU OFF before start_kernel

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb -x ${OUTPUT}/package/gdb/gdb_Image

(gdb) b XXX_bk
(gdb) c
(gdb) info reg
\`\`\`

--------------------------------
<span id="B3"></span>

#### Debugging kernel MMU ON before start_kernel

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb -x ${OUTPUT}/package/gdb/gdb_RImage

(gdb) b XXX_bk
(gdb) c
(gdb) info reg

\`\`\`

--------------------------------
<span id="B4"></span>

#### Debugging kernel after start_kernel

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb ${OUTPUT}/linux/linux/vmlinux -x ${OUTPUT}/package/gdb/gdb_Kernel

(gdb) b XXX_bk
(gdb) c
(gdb) info reg
\`\`\`

EOF
}

# ARM64
README_arm64_debug()
{
cat << EOF >> ${1}
---------------------------------
<span id="A6"></span>

## Debuging BiscuitOS

\`\`\`
> First Terminal

cd ${OUTPUT}
./${RUNSCP_NAME} debug

> Second Terminal

${OUTPUT}/${CROSS_COMPILE}/${CROSS_COMPILE}/bin/${CROSS_COMPILE}-gdb ${OUTPUT}/linux/linux/vmlinux

(gdb) target remote :1234
(gdb) b start_kernel
(gdb) c
\`\`\`

EOF
}

README_debug()
{
	case ${ARCH_NAME} in
		arm)
			README_arm_debug ${1}
		;;
		arm64)
			README_arm64_debug ${1}
		;;
	esac
}

##############################################
# Lanuch BiscuitOS Networking
##############################################
README_networking()
{
cat << EOF >> ${MF}

---------------------------------

## Running BiscuitOS with NetWorking

\`\`\`
cd ${OUTPUT}
./${RUNSCP_NAME} net
\`\`\`

EOF
}

########################################
# List README
########################################

[ ${SUPPORT_BUSYBOX} = "Y" ] && README_busybox ${MF}
README_pack ${MF}
[ ${SUPPORT_FREEZE_DISK} = "Y" ] && README_mount_freeze ${MF}
[ ${SUPPORT_UBOOT} = "Y" ] && README_uboot ${MF}
README_launch_BiscuitOS ${MF}
[ ${SUPPORT_NETWORK} = "Y" ] && README_networking ${MF}
README_debug ${MF}

DEFAULT_SCPFILE=${OUTPUT}/${RUNSCP_NAME}
DEFAULT_IMAGE=${OUTPUT}/Hardware/BiscuitOS.img
CXL_SCPFILE=${OUTPUT}/RunBiscuitOS-CXL.sh
CXL_IMAGE=${OUTPUT}/Hardware/BiscuitOS-CXL.img
[ -f ${CXL_SCPFILE} ] && rm -rf ${CXL_SCPFILE}
[ -f ${CXL_IMAGE} ] && rm -rf ${CXL_IMAGE}
# CXL MULTI QEMU
if [ ${SUPPORT_CXL_HW} = "Y" ]; then
	if [ ${SUPPORT_CXL_TPG_NR} = "10" -o ${SUPPORT_CXL_TPG_NR} = "9" -o ${SUPPORT_CXL_TPG_NR} = "8" -o ${SUPPORT_CXL_TPG_NR} = "7" ]; then
		sed -e 's/BiscuitOS\.img/BiscuitOS-CXL.img/g' -e 's/8888/6666/g' "${DEFAULT_SCPFILE}" > "${CXL_SCPFILE}"
		cp ${CXL_SCPFILE} .TEMP.sh
		grep -v "BiscuitOS-CXL-GPU" ".TEMP.sh" > "${CXL_SCPFILE}"
		rm -rf .TEMP.sh
		[ ! -f ${CXL_IMAGE} ] && cp -rfa ${DEFAULT_IMAGE} ${CXL_IMAGE}
		chmod 755 ${CXL_SCPFILE}
	fi
fi
