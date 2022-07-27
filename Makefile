HOST ?= 0
KILL ?= 0

ifeq ($(HOST),0)
	THEOS_DEVICE_IP =
else ifeq ($(HOST),1)
	THEOS_DEVICE_IP =
else
	THEOS_DEVICE_IP = 127.0.0.1
	export THEOS_DEVICE_PORT = 2222
endif

DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

export ARCHS = arm64 arm64e
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
export TARGET = iphone:clang:latest:13.0

SUBPROJECTS += Tweak Prefs

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

ifeq ($(KILL),0)
after-install::
	install.exec "killall -9 SpringBoard"
else
after-install::
	install.exec "killall -9 Preferences"
endif