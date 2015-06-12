LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE                  := kexec_kdump_static
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include
LOCAL_SRC_FILES               := kdump/kdump.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES        := libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE      := kexec_libutil_kt
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES  := $(LOCAL_PATH)/util_lib/include
LOCAL_SRC_FILES   := util_lib/compute_ip_checksum.c util_lib/sha256.c
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE                  := kexec_kexec_static
LOCAL_MODULE_TAGS             := optional
LOCAL_CFLAGS                  += -Wno-format-security
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include \
                                 $(LOCAL_PATH)/util_lib/include \
                                 $(LOCAL_PATH)/kexec/arch/i386/include \
                                 external/zlib
LOCAL_SRC_FILES               := kexec/kexec.c \
                                 kexec/ifdown.c \
                                 kexec/kexec-elf.c \
                                 kexec/arch_init.c \
                                 kexec/kexec-elf-exec.c \
                                 kexec/kexec-elf-core.c \
                                 kexec/kexec-elf-rel.c \
                                 kexec/kexec-elf-boot.c \
                                 kexec/kexec-iomem.c \
                                 kexec/phys_to_virt.c \
                                 kexec/firmware_memmap.c \
                                 kexec/crashdump.c \
                                 kexec/crashdump-xen.c \
                                 kexec/phys_arch.c \
                                 kexec/lzma.c \
                                 kexec/zlib.c \
                                 kexec/proc_iomem.c \
                                 kexec/virt_to_phys.c \
                                 kexec/add_segment.c \
                                 kexec/add_buffer.c \
                                 kexec/arch_reuse_initrd.c \
                                 kexec/arch/i386/kexec-elf-rel-x86.c \
                                 kexec/arch/i386/kexec-nbi.c \
                                 kexec/arch/i386/crashdump-x86.c \
                                 kexec/arch/i386/kexec-beoboot-x86.c \
                                 kexec/arch/i386/kexec-elf-x86.c \
                                 kexec/arch/i386/kexec-x86-common.c \
                                 kexec/arch/i386/x86-linux-setup.c \
                                 kexec/arch/i386/kexec-bzImage.c \
                                 kexec/arch/i386/kexec-multiboot-x86.c \
                                 kexec/arch/i386/kexec-x86.c \
                                 kexec/kexec-uImage.c \
                                 kexec/purgatory.c

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES        := kexec_libutil_kt libz libc
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_EXECUTABLES_UNSTRIPPED)
include $(BUILD_EXECUTABLE)
