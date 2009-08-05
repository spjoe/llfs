ifneq ($(KERNELRELEASE),)

#
# Makefile for the linux llfs-filesystem routines.
#

obj-$(CONFIG_LLFS_FS) += llfs.o

llfs-y := balloc.o dir.o file.o fsync.o ialloc.o inode.o \
	  ioctl.o namei.o super.o symlink.o 
# llfs_main.o 

llfs-$(CONFIG_LLFS_FS_XATTR)	 += xattr.o xattr_user.o xattr_trusted.o
llfs-$(CONFIG_LLFS_FS_POSIX_ACL) += acl.o
llfs-$(CONFIG_LLFS_FS_SECURITY)	 += xattr_security.o
llfs-$(CONFIG_LLFS_FS_XIP)	 += xip.o
else

# Normal Makefile

# KERNELDIR := /lib/modules/`uname -r`/build
KERNELDIR := /home/camillo/Studieren/SS09/Projetpraktikum/linux-2.6.30.4
all:
	$(MAKE) -C $(KERNELDIR) M=`pwd` CONFIG_LLFS_FS=m CONFIG_LLFS_FS_XATTR=n CONFIG_LLFS_FS_POSIX_ACL=n CONFIG_LLFS_FS_SECURITY=n CONFIG_LLFS_FS_XIP=n modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=`pwd` modules_install
clean:

	$(MAKE) -C $(KERNELDIR) M=`pwd` clean

endif
