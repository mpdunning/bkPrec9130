TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = bkp

DBD += bkp.dbd

bkp_DBD += base.dbd
bkp_DBD += stream.dbd
bkp_DBD += asyn.dbd
bkp_DBD += asSupport.dbd
bkp_DBD += drvAsynIPPort.dbd

bkp_SRCS += bkp_registerRecordDeviceDriver.cpp
bkp_SRCS_DEFAULT += bkpMain.cpp

bkp_LIBS += asyn
bkp_LIBS += autosave
bkp_LIBS += stream

bkp_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

