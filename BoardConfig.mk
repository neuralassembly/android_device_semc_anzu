-include device/semc/msm7x30-common/BoardConfigCommon.mk
-include device/semc/mogami-common/BoardConfigCommon.mk
-include vendor/semc/anzu/BoardConfigVendor.mk

SENSORS_COMPASS_AK8975 := true
SENSORS_ACCEL_BMA150_INPUT := true
SENSORS_ACCEL_BMA250_INPUT := false
SENSORS_PROXIMITY_APDS9700 := true
SENSORS_PRESSURE_BMP180 := false

TARGET_QCOM_HDMI_OUT := false

BOARD_FLASH_BLOCK_SIZE := 2048

TARGET_OTA_ASSERT_DEVICE := LT18i,LT18a,LT15i,LT15a,anzu



# kernel modules for ramdisk
RAMDISK_MODULES = $(addprefix device/semc/anzu/,scsi_wait_scan.ko wl12xx.ko wl12xx_sdio.ko)

PRODUCT_COPY_FILES += $(foreach module,\
        $(RAMDISK_MODULES),\
        $(module):system/lib/modules/$(notdir $(module)))


PRODUCT_COPY_FILES += \
	device/semc/anzu/recovery-dummy.img:recovery.img \


ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/semc/anzu/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
