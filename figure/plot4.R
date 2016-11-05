#reading data and subsetting
x=read.table('household_power_consumption.txt',header=TRUE, sep=';', stringsAsFactors = FALSE)
dataset=subset(x,x$Date=='1/2/2007' | x$Date=='2/2/2007')

#changing class for relevant variables
dataset$Global_active_power=as.numeric(dataset$Global_active_power)
dataset$Time=strptime(paste(dataset$Date, dataset$Time),format="%d/%m/%Y %H:%M")
dataset$Date=as.Date(dataset$Date, format="%d/%m/%Y")
dataset$Global_active_power=as.numeric(dataset$Global_active_power)

#creating png file for plotting
png('plot4.png',width=480,height=480)

#setting par for plotting 4 plots together
par(mfrow=c(2,2))

#ploting time against Global active power
plot(dataset$Time,dataset$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',
     xlab='')

#ploting time against voltage
plot(dataset$Time,dataset$Voltage,xlab='datetime',ylab='Voltage',type='l')

#ploting time against Sub metering 1-3 with legend
plot(dataset$Time,dataset$Sub_metering_1,ylab='Energy sub meeting',type='l',xlab='')
points(dataset$Time,dataset$Sub_metering_2,type='l',col='red')
points(dataset$Time,dataset$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),lty=c(1,1,1))

#plotting time against global reactive power
plot(dataset$Time,dataset$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power'
     ,type='l')

#end off
dev.off()
