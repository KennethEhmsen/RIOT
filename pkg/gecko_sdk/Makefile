PKG_NAME=gecko_sdk
PKG_URL=https://github.com/basilfx/RIOT-gecko-sdk
PKG_VERSION=072be05b468f6ebc9ab41e3027f009b5ac3b86b5
PKG_LICENSE=Zlib

ifneq ($(CPU),efm32)
  $(error This package can only be used with EFM32 CPUs)
endif

ifneq (llvm,$(TOOLCHAIN))
  CFLAGS += -Wno-int-in-bool-context
endif

.PHONY: all

all:
	"$(MAKE)" -C $(PKG_BUILDDIR)/dist

include $(RIOTBASE)/pkg/pkg.mk
