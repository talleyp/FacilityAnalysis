## Create bar graph of inventory 
library(ggplot2)
area <- c("TVs and Monitor","CRT Tubes","CRT Glass","Misc. E-waste","Printers","MC","Other")
perc1 <- c(20.24,53.11,3.15,9.05,3.45,2.66)
percent <- c(perc1,100-sum(perc1))

data <- data.frame(area,percent)

qplot(area,data=data,geom="bar",weight=percent,ylab="",xlab="Percent") + coord_flip()

ggplot(data, aes(x=reorder(area,-percent),y=percent,fill=reorder(area,-percent))) + geom_bar(stat='identity') + 
  labs(y="Percent",x="",title="RecycleForce Inventory Breakdown") + 
  geom_text(data=data, aes(x=reorder(area,-percent),y=percent,label=percent),colour="black",size=3, hjust=1) +
  coord_flip() + theme(legend.position="none",axis.text.y=element_text(color="black",size=10)) + 
  scale_fill_brewer(palette="Spectral")
ggsave("inventoryBreakdown.png")
