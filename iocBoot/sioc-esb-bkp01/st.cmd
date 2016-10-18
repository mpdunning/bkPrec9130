#!../../bin/linux-x86_64/bkp

epicsEnvSet("STREAM_PROTOCOL_PATH", "../../bkpApp/Db:.")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/bkp.dbd"
bkp_registerRecordDeviceDriver pdbbase

epicsEnvSet("P",         "ESB:BKP01")
epicsEnvSet("DESC",      "ESB Test")
epicsEnvSet("PROTOFILE", "bkp.proto")
epicsEnvSet("DELAY0",    "0.1")
epicsEnvSet("DELAY1",    "0.2")
epicsEnvSet("SCAN0",     "5 second")
epicsEnvSet("SCAN1",     "2 second")

drvAsynIPPortConfigure("L0", "ts-esb-12:2103", 0, 0, 0)

#asynSetTraceMask("L0", -1, 0x9)
#asynSetTraceIOMask("L0", -1, 0x2)

dbLoadRecords("db/bkp.db", "IOC=${IOC}, P=$(P), DESC=$(DESC), PROTOFILE=$(PROTOFILE), PORT=L0, DELAY0=$(DELAY0), SCAN0=$(SCAN0), DELAY1=$(DELAY1), SCAN1=$(SCAN1)")
dbLoadRecords("db/asynRecord.db", "P=$(P):, R=asyn, PORT=L0, ADDR=0, OMAX=0, IMAX=0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

