library(ggplot2)
library(gapminder)
library(ggthemes)

View(gapminder)



p1<-ggplot(gapminder,aes(x=log(gdpPercap),y=lifeExp,color=continent))+
  geom_point(aes(size=pop),alpha=0.5)+facet_wrap(~year)

p2<-p1+labs(title="May Shao \nEconomic Development and Life Expenctancey around the World",
            subtitle="Per-capita GDP(Gross domestic product) is given in units of international dollars, a hypothetical unit of currency \nthat has the same purchasing power parity that the U.S. dollar had in the United States in 2005.",
            x="log(GDP per Capita)",y="Life Expectancy(years)")

p3<-p2+theme_few()
  
p4<-p3+scale_colour_manual(aes(color=continent),
                           values=c("#7A1501", "#CF7019", "#7B7000", "#8BAEA2", "#002742"))

p4
