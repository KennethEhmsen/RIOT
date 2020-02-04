# Find the header file that should exist if the CPU is supported. Only headers
# for supported boards are included, but to support another CPU, it should be
# as easy as adding the header file only.
EFM32_HEADER = $(wildcard $(RIOTCPU)/efm32/families/$(CPU_FAM)/include/vendor/$(CPU_MODEL).h)

ifeq (,$(EFM32_HEADER))
  $(error Header file for $(CPU_MODEL) is missing)
endif

# Include family-specific CPU information. This file contains one line per
# CPU_MODEL that includes additional information, such as flash and memory
# sized and supported features.
include $(RIOTCPU)/efm32/families/$(CPU_FAM)/efm32-info.mk

EFM32_INFO = $(EFM32_INFO_$(CPU_MODEL))

ifeq (,$(EFM32_INFO))
  $(error Family-specific information for $(CPU_MODEL) is missing)
endif

# Parse the information into EFM32 specific variables. They are specific to the
# EFM32 CPU only, and should not be used outside this module.
EFM32_FAMILY = $(word 1, $(EFM32_INFO))
EFM32_SERIES = $(word 2, $(EFM32_INFO))
EFM32_ARCHITECTURE = $(word 3, $(EFM32_INFO))

EFM32_FLASH_START = $(word 4, $(EFM32_INFO))
EFM32_FLASH_SIZE = $(word 5, $(EFM32_INFO))
EFM32_SRAM_START = $(word 6, $(EFM32_INFO))
EFM32_SRAM_SIZE = $(word 7, $(EFM32_INFO))

EFM32_CRYPTO = $(word 8, $(EFM32_INFO))
EFM32_TRNG = $(word 9, $(EFM32_INFO))
EFM32_RADIO = $(word 10, $(EFM32_INFO))
