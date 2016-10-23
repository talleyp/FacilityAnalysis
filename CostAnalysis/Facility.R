# Set facility

Wfacility <- sum( c(205,233,208,206,71,265,265,281,286,282,289,289,288,285,276,395) )
Lfacility <- sum( c(328,326,326,372,394,138) )

Wfacility <- round(Wfacility/46,0)
Lfacility <- round(Lfacility/46,0)

# Shredder coords
Wshred <- round(sum(c(282,289,288))/46,0)
Lshred <- round(326/46,0)
shredCorner <- c( round( sum(c(148,180))/46,0), round(sum(c(205,233,208,206,71,265,265,281,286))/46, 0) )

# Sorter coords
Wsort <- round(276/46,0)
Lsort <- round(180/46,0)
sortCorner <- c( round(148/46,0), round(sum(c(205,233,208,206,71,265,265,281,286,282,289,288,285))/46, 0) )

# Combining the office and cage 
Woc <- round(sum(c(71,265,265,281,286,282,289,288,285,276))/46,0)
Loc <- round(138/46, 0)
ocCorner <- c( (Lfacility-round(138/46,0)), round(sum(c(205,233,208,206))/46,0) )

# Single office
Woffice <- round(208/46,0)
Loffice <- round(sum(c(165,138))/46,0)
officeCorner <- c( Lfacility-round((165+138)/46, 0) , round( sum( c(205,233,12)/46), 0) )

# Dock
Wdock <- round(395/46,0)
Ldock <- round(sum( c( 326,372,394,138) )/46, 0)
dockCorner <- c( round( sum( c(328,326))/46, 0), round((Wfacility-Wdock), 0) )

# Bailer
Wbailer <- round(574/46,0)
Lbailer <- round(372/46,0)
bailerCorner <- c( round( sum(c(328,326,326))/46,0), Wfacility-round((395+276+285+288)/46, 0) )

# S & R office
Wsr <- round(sum(233,12)/46,0)
Lsr <- round(148/46,0)
srCorner <- c(1, round(205)/46,0)


# Initilialize facility
facility <- matrix(data=1, nrow = Lfacility, ncol=Wfacility)

# Add static parts
facility[shredCorner[1]:(shredCorner[1]+Lshred), shredCorner[2]:(shredCorner[2]+Wshred)] <- 2
facility[sortCorner[1]:(sortCorner[1]+Lsort), sortCorner[2]:(sortCorner[2]+Wsort)] <- 3
facility[ocCorner[1]:(ocCorner[1]+Loc), ocCorner[2]:(ocCorner[2]+Woc)] <- 4
facility[officeCorner[1]:(officeCorner[1]+Loffice), officeCorner[2]:(officeCorner[2]+Woffice)] <- 5
facility[dockCorner[1]:(dockCorner[1]+Ldock), dockCorner[2]:(dockCorner[2]+Wdock)] <- 6
facility[bailerCorner[1]:(bailerCorner[1]+Lbailer), bailerCorner[2]:(bailerCorner[2]+Wbailer)] <- 7
facility[srCorner[1]:(srCorner[1]+Lsr), srCorner[2]:(srCorner[2]+Wsr)] <- 8

library(plotly)
plot_ly(z = facility, type = "heatmap")
