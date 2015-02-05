plot1 <- function(){
  # Start the graph device 480x480px
  png("plot1.png",width=480, height=480)
  par(bg="transparent")
  # Read the data
  datos <- read.table("household_power_consumption.txt",sep=";",nrows=2075260, header=TRUE,stringsAsFactors=FALSE)
  # Filter by the given dates
  datos <- datos[datos$Date=="2/2/2007" | datos$Date=="1/2/2007",]
  #Transform the dates and numbers.
  datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
  datos[,c(3)]<- as.numeric(datos[,c(3)])
  #Plot and save in png
  hist(datos[,3],xlab="Global Active Power (kilowatts)",col="red",main="Global Active Powers")
  dev.off()
}