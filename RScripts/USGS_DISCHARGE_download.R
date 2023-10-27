#use this file to download discharge or gage height data off of USGS stations
#Kriddie
#edit 2/18/20

install.packages("dataRetrieval")
library(dataRetrieval)



#select station
USGS_stations <- c(
  "12363000", #USGS 12363000 Flathead River at Columbia Falls MT
  "12358500" #USGS 12358500 M F Flathead River near West Glacier MT
)
station <- USGS_stations[1] #select gage station

#select pCode
#Discharge [ft3/s] pCode = 00060
#Gage height [ft] pCode = 00065
pCode <- "00060"  

#Select time range
start_date <- "2017-02-01"
end_date <- "2017-09-01"


USGS_gauge_data <- readNWISuv(siteNumbers = station,
                              parameterCd = pCode,
                              startDate = start_date,
                              endDate = end_date)

#read out file
#set working directory
station_name <- paste(station, "USGS", sep="")
file_name = paste(station_name, "USGS", start_date, end_date, sep="_")

write.csv(USGS_gauge_data, file=paste(file_name, ".csv", sep=""))
