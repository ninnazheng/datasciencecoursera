#Using UE edit the dateset,replace commal to space symbol,and named the new
#file "household_power_space.txt",extract the data from the dates 2007-02-01 and 2007-02-02.
household <- read.table("household_power_space.txt",nrows = 2880,skip = 66637)
colnames(household) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household$Date <- strptime(as.character(household$Date),"%d/%m/%Y")
plot(household$Global_active_power,type = 'l',xaxt="n",ylab = "Global_Active_Power(kilowatts)",xlab = " ")
Sys.setlocale("LC_TIME", "English")
weekday <- format.Date(household$Date,"%a")
axis(1,at = c(1,1441,2881),labels = c(weekday[1],weekday[1441],"Sat"))
dev.copy(png, filename="plot2.png", height=480, width=480)
dev.off()