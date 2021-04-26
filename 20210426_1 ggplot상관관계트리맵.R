# dataframe 생성
bloodType <- c('A','B','A','AB','O',
               'A','O','B','A','O',
               'O','B','O','A','AB',
               'B','O','A','A','B')
name = c("정수병","박성동","박산우","김현수","류성희","전창욱","김소한","백지향","김미성","고희태",
         "강청남","송시현","아련한","고민해","최소한","최두경","전찬경","김아름","홍수태","김영화")
gender = c("남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여")
classDF = data.frame(name, gender, bloodType, stringsAsFactors = F)
head(classDF)

str(classDF)


# ggplot2 패키지 설치
# install.packages('ggplot2')
library('ggplot2') 

classTable = table(classDF[,c(2,3)])
classTable

# 데이터 프레임 변환
classCovDF = as.data.frame(classTable)
classCovDF

# ggplot 함수 실행. aes를 통해 x/y축에 매핑할 데이터 항목을 가정
ggplot(classCovDF, aes(x = bloodType,                    ## << aes 함수 = 시각적 요소와 데이터 항목을 
                       y = Freq))                        ##    연결하는 정보

# 막대차트 만들기  (geom_col y축 지정,   geom_bar)
ggplot(classCovDF, aes(x = bloodType,
                       y = Freq)) + geom_col()

# 막대차트 성별 기준 표시, 성별 기준 점 표시
ggplot(classCovDF, aes(x = bloodType,
                         y = Freq)) +
  geom_col(aes(fill=gender)) +
  geom_point(aes(shape=gender), size = 3)

# 성별기준 선 그래프 작성
ggplot(classCovDF, aes(x = bloodType,
                       y = Freq)) +
  geom_col(aes(fill=gender)) +
  geom_point(aes(shape=gender), size = 3) +
  geom_line(aes(group=gender,
                linetype=gender))

# ggplot 제목 추가하기
ggplot(classCovDF, aes(x = bloodType,
                       y = Freq)) +
  geom_col(aes(fill=gender)) +
  geom_point(aes(shape=gender), size = 3) +
  geom_line(aes(group=gender,
                linetype=gender)) +
  ggtitle("이슬반 혈액형 비율",
          subtitle=("(혈액형/성별 기준)"))

# ggplot x/y축 및 범례 제목 변경
ggplot(classCovDF, aes(x = bloodType,
                       y = Freq)) +
  geom_col(aes(fill=gender)) +                ## 젠더 기준 범례 만듬
  ggtitle("이슬반 혈액형 비율",
          subtitle=("(혈액형/성별 기준)")) +
  labs(x="혈액형", y="인원수", fill="성별")   ## 젠더 기준 범례 제목 변경


# 그래프 객체 생성
BloodbarChart = ggplot(classCovDF, aes(x = bloodType,
                                       y = Freq)) +
  geom_col(aes(fill=gender)) +                
  ggtitle("이슬반 혈액형 비율",
          subtitle=("(혈액형/성별 기준)")) +
  labs(x="혈액형", y="인원수", fill="성별")

# theme_void
BloodbarChart + theme_void()
# theme_dark
BloodbarChart + theme_dark()
# theme_minimal
BloodbarChart + theme_minimal()
# theme_classic
BloodbarChart + theme_classic()


head(classCovDF)  # -> geom_col을 그림 (x,y 지정)
head(classDF)     

# geom_bar를 사용해서 그림 (x만 지정)
ggplot(classDF, aes(x =bloodType,
                    fill=gender)) +
  geom_bar()


#---------------------------------------------
bar_data = classDF[3]
bar_data

# x축에 혈액형을 연결하면 y축은 자동으로 빈도 수를 계산
ggplot(bar_data, aes(x = bloodType)) +
  geom_bar()


#---------------------------------------------
# 시간의 흐름에 따라 그래프 그리기
company = c('A','A','A','A',
            'B','B','B','B')
year = c('1980','1990','2000',
         '2010','1980','1990',
         '2000','2010')
sales = c(2750,2800,2830,
          2840,2760,2765,
          2775,2790)
coSalesDF = data.frame(company,year,sales, stringsAsFactors = F)
head(coSalesDF)
str(coSalesDF)

# 라인차트 생성 - x축은 연도(year), y축은 매출(sales)
ggplot(coSalesDF, aes(x=year, y=sales)) +
  geom_line(aes(group=company))

# size를 옵션으로 선 두께지정
ggplot(coSalesDF, aes(x=year, y=sales)) +
  geom_line(size=2, aes(group=company,
                        color=company))


#-------------------------------------------
# 상관관계 보기
# cars 데이터 구조
str(cars)
head(cars)

# plot(x축 데이터, y축 데이터, 옵션)  << 산점도
plot(cars$speed, cars$dist,
     xlab = "속도",
     ylab = "제동거리")

# 회귀분석 추정치 구하는 함수 : lowess
lines(lowess(cars$speed, cars$dist))

lm(cars$dist ~ cars$speed, data = cars)    


#--------------------------------------------
str(iris)

# 팩터 레벨 확인
levels(iris$Species)

plot(iris)            ## col 별로 다 상관관계 분석해서 그래프로 보여줌

#--------------------------------------------
# 꽃잎(Petal)길이와 너비의 상관계수(r) 산출 : cor 함수
cor(iris$Petal.Length, iris$Petal.Width)       ## 약 0.96
plot(iris$Petal.Width, iris$Petal.Length)      ## 그래프로 확인


#--------------------------------------------
sales_df <- read.csv(file = 'clipboard', header = T, sep = '\t')
str(sales_df)

# 트리맵 라이브러리 설치
# install.packages('treemap')
library('treemap')

# 트리맵 그리기
treemap(sales_df, 
        vSize = 'saleAmt',
        index = c('region','product'),
        title = 'A기업 판매현황'
        )


#---------------------------------------------





























