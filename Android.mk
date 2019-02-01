#
# This empty Android.mk file exists to prevent the build system from
# automatically including any other Android.mk files under this directory.
#

#include $(CLEAR_VARS)
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),x103f)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

WCNSS_CFG_INI := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini
$(WCNSS_CFG_INI): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_cfg.ini Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/$(notdir $@) $@

PERSIST_DICT := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat
$(PERSIST_DICT): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_wlan_dictionary.dat Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

PERSIST_MAC := $(TARGET_OUT_ETC)/firmware/wlan/prima/wlan_mac.bin
$(PERSIST_MAC): $(LOCAL_INSTALLED_MODULE)
	@echo "wlan_mac.bin Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

WLAN_MODULE_SYMLINK := $(TARGET_OUT)/lib/modules/wlan.ko
$(WLAN_MODULE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "wlan.ko module link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib/modules/pronto/pronto_wlan.ko $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_CFG_INI) $(PERSIST_DICT) $(PERSIST_MAC) $(WLAN_MODULE_SYMLINK)

CMN_IMAGES := \
    cmnlib.b00 cmnlib.b01 cmnlib.b02 cmnlib.b03 cmnlib.mdt

CMN_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(CMN_IMAGES)))
$(CMN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CMN firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CMN_SYMLINKS)

KM_IMAGES := \
    keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03 keymaste.mdt

KM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(KM_IMAGES)))
$(KM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Keymaster firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(KM_SYMLINKS)

MBA_IMAGES := mba.mbn

MBA_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MBA_IMAGES)))
$(MBA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MBA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b03 modem.b09 modem.b12 modem.b13 modem.b14 modem.b15 \
    modem.b16 modem.b19 modem.b20 modem.b21 modem.mdt modem_pr

MODEM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

WCNSS_IMAGES := \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.b06 \
    wcnss.b09 wcnss.b10 wcnss.b11 wcnss.b12 wcnss.mdt

WCNSS_FW_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(WCNSS_IMAGES)))
$(WCNSS_FW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_DIC_FIRMWARE) $(WCNSS_INI_FIRMWARE) $(WCNSS_FW_SYMLINKS)

WV_IMAGES := \
    widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.mdt

WV_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(WV_IMAGES)))
$(WV_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Widevine firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WV_SYMLINKS)

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /firmware $@/readonly/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS)

endif
