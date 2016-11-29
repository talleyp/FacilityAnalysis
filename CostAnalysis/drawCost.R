library(reshape2)
library(ggplot2)
library(RColorBrewer)



heatPlot <- function(data, title, file){
  longData <- melt(data)
  myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")), space="Lab")
  zp1 <- ggplot(longData,
                aes(x = Var2, y = Var1, fill = value))
  zp1 <- zp1 + geom_tile()
  zp1 <- zp1 + scale_fill_gradientn(colours = myPalette(100))
  zp1 <- zp1 + scale_x_discrete(expand = c(0, 0))
  zp1 <- zp1 + scale_y_discrete(expand = c(0, 0))
  zp1 <- zp1 + coord_equal()
  zp1 <- zp1 + theme_bw()
  zp1 <- zp1 + ggtitle(title)  + labs(x = "Width", y = "Length")
  ggsave(file)
  hist(data[,1])
  print(zp1)
}
rotate <- function(x) apply(t(x),1,rev)

nochange <- as.matrix(read.table("costNoChange.csv", sep=","))
nochange <- rotate(nochange)
heatPlot(log(nochange), "No Change", "costsNoChange.png")

flip <- as.matrix(read.table("costFlipWS.csv", sep=","))
flip <- rotate(flip)
heatPlot(log(flip), "Flipped Workstation", "FlippedWorkstation.png")

fullchange <- as.matrix(read.table("costFullChange.csv", sep=","))
fullchange <- rotate(fullchange)
heatPlot(log(fullchange), "Complete Alteration", "completChange.png")

king <- as.matrix(read.table("costKing.csv", sep=","))
king <- rotate(king)
heatPlot(log(king), "King Alteration", "kingChange.png")
