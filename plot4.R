plot4 <- function(){
  # Start the graph device 480x480px
  png("plot4.png",width=480, height=480)
  par(bg="transparent")
  # Configure 2x2 Graph Canvas
  par(mfrow = c(2, 2))
  # Read the data
  datos <- read.table("household_power_consumption.txt",sep=";",nrows=2075260, header=TRUE,stringsAsFactors=FALSE)
  # Filter by the given dates
  datos <- datos[datos$Date=="2/2/2007" | datos$Date=="1/2/2007",]
  #Transform the dates and numbers. 
  datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
  datos[,c(7)]<- as.numeric(datos[,c(7)])
  datos[,c(8)]<- as.numeric(datos[,c(8)])
  datos[,c(9)]<- as.numeric(datos[,c(9)])
  datos$nueva<- paste(datos$Date,datos$Time)
  datos$nueva <- strptime(datos$nueva,"%Y-%m-%d %H:%M:%S")
  # Graph 1
  plot(datos$nueva,datos$Global_active_power, type="l", xlab="",ylab="Global Active Power")
  # Graph 2
  plot(datos$nueva,datos$Voltage, type="l", xlab="datetime",ylab="Voltage")
  # Graph 3
  plot(datos$nueva,datos[,c(7)],type='n',xlab="",ylab="Energy sub metering")
  lines(datos$nueva,datos[,c(7)])
  lines(datos$nueva,datos[,c(8)],col="red")
  lines(datos$nueva,datos[,c(9)],col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,cex=0.9,bty="n")
  # Graph 4
  plot(datos$nueva,datos$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
 
  dev.off()
}