install.packages("tidyverse")
#install_github("tidyverse")
library(tidyverse)

#variables (in the columns) and observations (in the rows)
heartds<-read.csv(file.choose())
head(heartds)
names(heartds)
dim(heartds)
summary(heartds$ï..age)
str(heartds)

#scatter plot
ggplot(data = heartds) + 
  geom_point(mapping = aes(x = heartds$chol, y = heartds$trestbps))

#scatter plot using color
ggplot(data = heartds) + 
  geom_point(mapping = aes(x = heartds$chol, y = heartds$trestbps, color = heartds$cp))
#scatter plot using size
ggplot(data = heartds) + 
  geom_point(mapping = aes(x = heartds$chol, y = heartds$trestbps, size = heartds$cp))
#scatter plot using alpha 
ggplot(data = heartds) + 
  geom_point(mapping = aes(x = heartds$chol, y = heartds$trestbps, alpha    = heartds$cp))
#facets, subplots that each display one subset of the data.
ggplot(data = heartds) + 
  geom_point(mapping = aes(x = heartds$chol, y = heartds$trestbps))+
 facet_wrap(~cp , nrow = 2)
#geom_smooth() will draw a line between two columns
ggplot(data = heartds) + 
  geom_smooth(mapping = aes(x = heartds$trestbps, y = heartds$chol))
#geom_smooth() will draw a line with point
ggplot(data = heartds,mapping = aes(x = heartds$trestbps, y = heartds$chol)) + 
  geom_point()+
  geom_smooth()
#geom_smooth()  with filter method
ggplot(data = heartds,mapping = aes(x = heartds$trestbps, y = heartds$chol)) + 
  geom_point()+
  geom_smooth(data=filter(heartds,cp==0))

#geom_smooth() will draw a different line, with a different linetype, for each unique value of the variable that you map to linetype.
ggplot(data = heartds) + 
  geom_smooth(mapping = aes(x = heartds$trestbps, y = heartds$chol , linetype = heartds$slope))
rlang::last_error()
#basic bar chart, as drawn with geom_bar()
ggplot(data = heartds) +
  geom_bar(mapping = aes(x=heartds$cp))

#basic bar chart, as drawn with geom_bar()
ggplot(data = heartds) +
  geom_bar(mapping = aes(x=heartds$cp, fill = "red")) 
#geom_boxplot()
ggplot(data = heartds) +
  geom_boxplot(mapping = aes(x=heartds$ï..age))
###############################
#data transformation 

reason00<- filter(heartds,sex==1,cp==0)
reason00

reason1_2<-filter(heartds,cp%in%c(1,2))
reason1_2

arrange(heartds,cp,chol)
arrange(heartds,desc(cp))
select(heartds,cp,chol)
select(heartds,-(cp:chol))
mutate(heartds,temprate=heartds$trestbps-94)
transmute(heartds,temprate=heartds$trestbps-94)
       