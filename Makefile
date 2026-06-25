TARGET = GTRemastered
OBJS = main.o hooking.o disc_ident.o exports.o

# DEBUG_LOG=0 -> silent build; DEBUG_LOG=1 -> logged build (boot diagnostics + live-tune changes)
DEBUG_LOG ?= 1
CFLAGS = $(CFLAGS_EXTRA) -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division -fno-builtin -DDEBUG_LOG=$(DEBUG_LOG)
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

# use kernel "libc"
USE_KERNEL_LIBS = 1

LIBS = -lpspsystemctrl_kernel

PSP_FW_VERSION=661

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak
