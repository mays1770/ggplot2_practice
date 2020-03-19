library(readxl)

library(scales)
library(psych)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(grid)
library(showtext)
library(Cairo)
library(readr)

################# Plot1 HBR #################
HBR_CEO_data <- read_excel("C:/_Emory/2&4-675-Data Viz/Assignments/#1-Due Oct 2 Wed/HBR-CEO-data-PV.xlsx")

data<-HBR_CEO_data

# Bar chart and flip the axis
p11<-ggplot(data,aes(x=reorder(data$`CEO NAME`,-data$Rank),data$Pay,fill=data$Category))+
  geom_bar(stat="identity",position='dodge')+
  scale_y_continuous(labels = comma,breaks=seq(0,50000,5000))+
  coord_flip()

# Add themes, title, legends and other annotations
p12<-p11+theme_economist()+
  labs(title='Top 10 US CEO Compensation',x='',y='USD in thousand')+
  theme(legend.position=c(0.91,0.947),legend.title=element_blank(),
        plot.title = element_text(hjust = 0.5))


p12



############### Plot2 Big Mac ################

BigMac <- read_csv("C:/_Emory/2&4-675-Data Viz/Assignments/#1-Due Oct 2 Wed/BigMac.csv", 
                   col_types = cols(date = col_date(format = "%Y/%m/%d")))


# Line, point, setting axis and ticks
p21<-ggplot(BigMac,aes(x=BigMac$date,y=BigMac$FX,
                      group=BigMac$Category,fill=BigMac$Category,
                      color=BigMac$Category))+
  coord_cartesian(ylim=c(0, 8.5))+scale_y_continuous(breaks=seq(0,9,0.5))+
  geom_point(size=1.5)+
  geom_line(size=0.8)
  

# Titles, themes
p22<-p21+theme_stata()+
  labs(title='CNY/USD Exchange Rate',x='',y='CNY per USD')+
  theme(legend.position=c(0.9,0.92),legend.title=element_blank(),
        plot.title = element_text(face='bold',hjust = 0.5))


# Annotations
p23<-p22+annotate("text", x=BigMac$date[6]+53, y=7.2, label="2005-07-21 \n Abolished Yuan-Dollar peg \n Adopted floating rate",fontface='bold')+
  annotate("text", x=BigMac$date[24]+40, y=5.5, label="2015-08-11 \n Improved central parity system \n to better reflect market development",fontface='bold')


  
# Reference line
p24<-p23+geom_vline(xintercept=BigMac$date[6]+53,linetype=2,size=.25,colour="grey")+
  geom_vline(xintercept=BigMac$date[24]+40,linetype=2,size=.25,colour="grey")
  
# Annotations for Stages
  
p25<-p24+annotate("text", x=BigMac$date[3]+60, y=1.5, label="Stage 1",fontface='bold')+
  annotate("text", x=BigMac$date[15]-30, y=1.5, label="Stage 2",fontface='bold')+
  annotate("text", x=BigMac$date[28]+40, y=1.5, label="Stage 3",fontface='bold')

p25
  