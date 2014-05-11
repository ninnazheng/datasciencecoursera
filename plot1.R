#Using UE edit the dateset,replace commal to space symbol,and named the new
#file "household_power_space.txt",extract the data from the dates 2007-02-01 and 2007-02-02.
household <- read.table("household_power_space.txt",nrows = 2880,skip = 66637)
colnames(household) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Sys.setlocale("LC_TIME", "English")
with(household, hist(Global_active_power,col = "red",xlab = "Global_Active_Power(kilowatts)",main = "Global_Active_Power"))
dev.copy(png, filename="plot1.png", height=480, width=480)
dev.off()
