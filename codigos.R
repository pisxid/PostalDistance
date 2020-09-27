#Se cargan las librerías necesarias.
library(ggmap)
library(readxl)
library(dplyr)


cps2<- read.csv(file = "C:/Users/USUARIO/Desktop/c_p.csv")


print(cps2$d_estado[1])

key<-"YOURKEY"
register_google(key = key)
                

res <- matrix(0, nrow = 196, ncol = 3)
colnames(res) <- c("C_P","LAT","LNG")




for(i in 1:dim(cps2)[1]) {
  d=geocode(paste(cps2$ï..id_codigo[i],cps2$D_mnpio[i],cps2$d_estado[i],sep=" "))
  print(d$lat)
  print(d$lon)
  res[i,1] <- cps2$ï..id_codigo[i]
  res[i,2] <- d$lat
  res[i,3] <- d$lon
  
}


write.csv(res, "C:/Users/USUARIO/Desktop/res.csv")

