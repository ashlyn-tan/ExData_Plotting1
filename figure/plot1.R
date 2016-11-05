#reading data and subsetting
x=read.table('household_power_consumption.txt',header=TRUE, sep=';', stringsAsFactors = FALSE)
dataset=subset(x,x$Date=='1/2/2007' | x$Date=='2/2/2007')

#changing class for relevant variables
dataset$Global_active_power=as.numeric(x$Global_active_power)
dataset$Time=strptime(paste(dataset$Date, dataset$Time),format="%d/%m/%Y %H:%M")
dataset$Date=as.Date(dataset$Date, format="%d/%m/%Y")
dataset$Global_active_power=as.numeric(dataset$Global_active_power)

#creating png file for plotting
png('plot1.png',width=480,height=480)

#plotting histogram of global active power
hist(dataset$Global_active_power,xlab='Global Active Power (kilowatts)',
     ylab='Frequency', main='Global Active Power',col='red')

#end off
dev.off()