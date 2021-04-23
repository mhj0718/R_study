park_in_seoul <- read.csv('전국도시공원정보표준데이터.csv', header = T, sep=',')
View(park_in_seoul)







# 서울 인구 데이터 처리
pop_seoul <- read.table('구별서울인구데이터.csv', header=T, sep=',')
View(pop_seoul)
str(pop_seoul)

pop_gu <- pop_seoul[c(-1,-2),c(2,4)]
View(pop_gu)

pop_gu$인구 <- as.character(pop_gu$인구)
pop_gu$인구 <- as.integer(pop_gu$인구)

pop_gu$인구 <- pop_gu$인구 / 1000


getwd()

write.table(pop_gu, 'pop_gu.csv', sep=',',
            col.name = T,
            row.name = F,
            fileEncoding = 'utf-8')




# 구별공원의 수

park_data = read.csv(file="전국도시공원정보표준데이터.csv",
                     header=T,
                     sep=",",
                     stringsAsFactor=F)

park_seoul = park_data[,c(3,5)]
head(park_seoul)
str(park_seoul)

# install.packages("stringr")
# library(stringr)

str_count(park_seoul, "서울특별시") # 서울에 있는 공원의 총 개수 1847
sum(str_count(park_seoul, "서울"))

str_count(park_seoul, "종로구") # 40
str_count(park_seoul, "서울특별시 중구") # 35
str_count(park_seoul, "용산구") # 42
str_count(park_seoul, "서울특별시 성동구") #47
str_count(park_seoul, "광진구") #40
str_count(park_seoul, "동대문구") #43
str_count(park_seoul, "중랑구") #54
str_count(park_seoul, "성북구") #49
str_count(park_seoul, "강북구") #45
str_count(park_seoul, "도봉구") #71
str_count(park_seoul, "노원구") #169
str_count(park_seoul, "은평구") #98
str_count(park_seoul, "서대문구") #54
str_count(park_seoul, "마포구") #84
str_count(park_seoul, "양천구") #96
str_count(park_seoul, "강서구") #214
str_count(park_seoul, "구로구") #49
str_count(park_seoul, "금천구") #51
str_count(park_seoul, "영등포구") #44
str_count(park_seoul, "동작구") #52
str_count(park_seoul, "관악구") #61
str_count(park_seoul, "서초구") #114
str_count(park_seoul, "강남구") #134
str_count(park_seoul, "송파구") #159
str_count(park_seoul, "강동구") #74


구별 = c("종로구","중구","용산구","성동구","광진구","동대문구",
       "중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구",
       "마포구","양천구","강서구","구로구","금천구","영등포구",
       "동작구","관악구","서초구","강남구","송파구","강동구")
공원수 = c(40,35,42,47,40,
        43,54,49,45,71,
        169,98,54,84,96,
        214,49,51,44,52,
        61,114,134,159,74)

park_real = data.frame(구별, 공원수)
View(park_real)


# 구별 공원의 수 데이터 처리

park_real <- park_real[c(order(park_real$공원수,decreasing=T)),]

park_sort<- park_real
 

write.table(park_sort, 'park_sort.csv', col.names = T, row.names=F, fileEncoding = 'utf-8')

barplot(park_real$공원수, ylim = c(0,250),
        main = '서울시 구별 공원 수',
        names =c("강서구", "노원구", 
                 "송파구", 
                 "강남구", 
                 "서초구", 
                 "은평구",
                 "양천구",
                 "마포구",
                 "강동구",
                 "도봉구",
                 "관악구",
                 "중랑구" ,
                 "서대문구", 
                 "동작구",
                 "금천구",
                 "성북구", 
                 "구로구", 
                 "성동구", 
                 "강북구",
                 "영등포구", 
                 "동대문구", 
                 "용산구", 
                 "종로구",
                 "광진구", 
                 "종로구", 
                 "중구"))

View(park_sort)
View(park_real)





# 구별 인구 천명당 공원 갯수 데이터

park_per <- round(park_real$공원수 / (pop_gu$인구 / 10), 2)

View(park_per)


park_per2 <- data.frame(구별, park_per)

View(park_per2)

write.table(park_per2, 'park_per2.csv', col.names = T, row.names = F, fileEncoding = 'utf-8')



# 데이터 취합
names(pop_gu) <- c('구별', '인구 수(만명)')
names(park_per2)
names(pop_gu)
names(park_real)
pop_gu$`인구 수(만명)` <- pop_gu$`인구 수(만명)` / 10
pop_gu

park_last <- merge(park_real, pop_gu, by = c('구별'))

park_GG <- merge(park_last, park_per2, by = c('구별'))

names(park_GG$park_per) <- '만명당공원수'

colnames(park_GG)[4] <- '만명당공원수'


View(park_GG)
write.table(park_GG, 'park_GG.csv', col.names = T, row.names = F, fileEncoding = 'utf-8')

# 정렬
park_graph <- park_GG[order(park_GG$공원수, decreasing = T),]
View(park_graph)






write.table(park_graph, 'park_graph.csv', col.names = T, row.names = F, sep=',')








install.packages('tidyverse')
library('tidyverse')


names(park_graph)[3] <- '만명기준인구수'


# 구별 공원수 시각화 코드
ggplot(data = park_graph,
       aes(x=공원수,
           y=reorder(구별,공원수)))+geom_col(stat = 'identity')+
  ggtitle('서울시 구별 공원 수') + 
  theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))




# 서울 구별 인구수 시각화
# install.packages('ggplot2')
# library(ggplot2)

ggplot(data = park_graph,
       aes(x=만명기준인구수, y=reorder(구별,만명기준인구수)))+geom_bar(stat ='identity')+
  ggtitle('서울시 인구수(만명)')+ 
  theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))
   


# 만명당 공원 갯수

ggplot(data = park_graph,
       aes(x=reorder(구별,-만명당공원수), y=만명당공원수))+ geom_col() +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +  
  ggtitle('구별 만명당 공원 수')+ theme(plot.title = element_text(family = "serif", 
  face = "bold", hjust = 0.5, size = 15, color = "darkblue"))
       
