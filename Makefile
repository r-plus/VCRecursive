ARCHS = armv7
TARGET = iphone:latest:4.0
include theos/makefiles/common.mk

TWEAK_NAME = VCRecursive
VCRecursive_FILES = Tweak.xm
VCRecursive_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
