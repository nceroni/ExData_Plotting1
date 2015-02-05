plot2 <- function(){
  # Start the graph device 480x480px
  png("plot2.png",width=480, height=480)
  par(bg="transparent")
  # Read the data
  datos <- read.table("household_power_consumption.txt",sep=";",nrows=2075260, header=TRUE,stringsAsFactors=FALSE)
  # Filter by the given dates
  datos <- datos[datos$Date=="2/2/2007" | datos$Date=="1/2/2007",]
  #Transform the dates and numbers.
  datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
  datos[,c(3)]<- as.numeric(datos[,c(3)])
  datos$nueva<- paste(datos$Date,datos$Time)
  datos$nueva <- strptime(datos$nueva,"%Y-%m-%d %H:%M:%S")
  # Plot and save to png
  plot(datos$nueva,datos$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}