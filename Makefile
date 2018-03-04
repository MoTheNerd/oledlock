include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OLEDLock
OLEDLock_FILES = Tweak.xm
#OLEDLock_LIBRARIES = inspectivec



include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
