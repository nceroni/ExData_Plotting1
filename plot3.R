plot3 <- function(){
  # Start the graph device 480x480px
  png("plot3.png",width=480, height=480)
  par(bg="transparent")
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
  # Plot and save to png
  plot(datos$nueva,datos[,c(7)],type='n',xlab="",ylab="Energy sub metering")
  lines(datos$nueva,datos[,c(7)])
  lines(datos$nueva,datos[,c(8)],col="red")
  lines(datos$nueva,datos[,c(9)],col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,cex=0.8)
  dev.off()
}