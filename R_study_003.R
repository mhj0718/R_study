# data.frame 함수
id = c('F1','F2','F3')
name = c('김가수','박인호','고소미')
age = c(32,28,22)
isMarried = c(T,T,F)

df <- data.frame(id, name, age, isMarried, stringsAsFactors = FALSE)  ## 행 idx 기본적으로 부여
View(df)   ## 바로 보여주는 함수

str(df)    ## 문자열은 기본적으로 factor로 바꿈 / 
           ## stringAsFactors = FALSE 함수 사용하면 문자열 그대로 들어감 


df2 <- data.frame(name = c('김기수','문창렬','김나미'),   ## data.frame 함수 안에서 벡터설정도 가능
                  age = c(19,29,39),
                  isMarried = c(F,F,T),
                  stringsAsFactors = FALSE)
str(df2)


#-------------------------------------------------
df
df[2]      ## n번째 column을 출력
df[2,3]    ## 2행 3열
df[c(2,3),c(2,4)]   ## 2,3열 중 2,4행 출력력
df[,3]              ## [,3] : 전체 행 중 3열 출력,  [3,] : 3행 전체열 출력


# name과 age 열 출력
df[,c('name','age')]

# $ 사용
df$id
df$name
df$age
df$isMarried

sum(df$age)

df$age[2:3]


# iris 기본제공 dataframe
str(iris)

# 총 행/열 갯수
nrow(iris)
ncol(iris)
str(iris)

# head & tail
head(iris,3)    ## head에서부터 3개줄까지 보여줘 (기본은 6줄)
tail(iris,3)    ## tail에서부터 3개줄까지 보여줘 (기본은 6줄)

#-----------------------------
summary(iris)    ## 평균과 중앙값이 비슷한 분포가 잘 분포되어있는 그래프이다.
                 ## summary <- min, max, mean, median(2Q), 1Q, 3Q
View(iris)

# iris에서 sepal.Length가 7보다 큰 데이터 조회
# (열벡터)를 입력하지 않으면 전체 열이 조회된다.
subset(iris, Sepal.Length > 7)    ## subset : dataset를 sub(나눈다)
subset(iris, Sepal.Length > 7 & Petal.Length <= 6.5)
subset(iris, Sepal.Length > 5.800 & Sepal.Length <= 6.4)


# Sepal.Length와 species 열만 보기(열 위치로 지정)
subset(iris, Sepal.Length > 7.2 & Petal.Length <=6.5, c(1,5))
# Sepal.Length와 species 열만 보기(열 이름으로 지정)
subset(iris, Sepal.Length > 7.2 & Petal.Length <=6.5, c('Sepal.Length','Species'))

# Sepla.Length가 7보다 크거나 Petal.Length가 6.6보다 크거나 같은 것
subset(iris, Sepal.Length > 7 | Petal.Length >=6.5)


View(subset(iris, Species == 'setosa'))    ## '같다'라는 연산자 == 
nrow(subset(iris, Species == 'setosa'))
summary(subset(iris, Species == 'setosa'))
summary(subset(iris, Species == 'setosa',c('Sepal.Length')))

# 입력 항목명을 명시하지 않고 호출하기 - 입력 항목의 순서가 중요
subset(iris, Sepal.Length ==7.2, c('Species','Sepal.Length'))
subset(Sepal.Length ==7.2, iris, c('Species','Sepal.Length'))    ## 함수 내 입력 순서 바뀌면 실행x


# 입력 변수명을 명시하고 호출하기 - 순서가 바뀌어도 출력이 됨
subset(subset = (Sepal.Length ==7.2), x = iris, select = c('Species','Sepal.Length'))



#---------------------------------------
# ex_df를 만들 벡터 생성
name <- c('김가수','박인호','어만데','이기성')
age <- c(23,28,15,22)
weight <- c(67,75,73,80)

# ex_df 생성
ex_df = data.frame(name,age,weight)

ex_df[,]   ##  == ex_df
ex_df[c(1,2),c('name','age')]
ex_df[c('1','2'),c('name','weight')]    ## c('1','2')  idx이름으로 부름
ex_df[c(1,2),c('name','weight')]        ## c(1,2)  1,2번째 행에서 ~ 

ex_df[c(T,T,F,T),c(T,T,F)]     ## logical 벡터로도 인덱싱 가능



#----------------------------------------
ex_df$age > 25
ex_df[ex_df$age > 25,]

longley
str(longley)

# 여러 조건 식으로 데이터를 추출
longley[longley$GNP > 200 &
        longley$Population >=109 &
        longley$Year > 1960 &
        longley$Employed > 50,]

# 합계 - 명시적으로 데이터 프레임명 지정
sum(longley$GNP + longley$GNP.deflator + longley$Unemployed + longley$Population)

# attach 함수 - R객체 탐색 경로에 longley 추가
attach(longley)
# 'longley $' 사용하지 않고 조건 검색 가능 (잘 사용하지 않음,
# 같은 열이름이 다른 객체에도 있을 수 있으니까)
longley[GNP > 200 & Population >= 109 & Year > 1960 & Employed > 50, ]

sum(GNP + Population + Year + Employed)

# detach - R 객체 탐색 경로에 longley 제거
detach(longley)

# 칼럼 두 개 추출 시 데이터 타입 확인 (데이터프레임 형태로 추출)
str(longley[,c('GNP','Year')])             
# 칼럼 한 개 추출 시 데이터 타입 확인 (벡터형태로 추출)
str(longley[,c('GNP')])    ## != str(longley[2])
# drop 옵션 사용 시 데이터 타입 확인 (drop = FALSE로 데이터프레임 유지)
str(longley[,c('GNP'), drop = FALSE]) 


#---------------------------------------------
# SQL로 데이터프레임 검색하기
install.packages('sqldf')
library(sqldf)

## GNP,Year,Emloyed를 longley에서 추출, 조건(GNP > 400)
sqldf('select GNP, Year, Employed from longley where GNP > 400')            
## Year, sum(GNP)를 longley에서 추출, 조건(Year > 1960, 년도별로 묶어서
sqldf('select Year, sum(GNP) from longley where Year > 1960 group by Year') 



# 정렬
name <- c('김가수','박인호','어만데','이기성')
age <- c(23,28,15,22)
weight <- c(67,75,73,80)

ex_df <- data.frame(name,age,weight)
ex_df[c(1,2,4),]
ex_df[c(4,2,1),]

# 나이를 기준으로 오름차순 정렬
ex_df[order(ex_df$age),]    ## order 기본 오름차순
# 나이를 기준으로 내림차순 정렬
ex_df[order(ex_df$age, decreasing = TRUE),] 


#---------------------------------------
alpha <- c('A','C','F','B','E','D')
alpha

# order 함수는 정렬된 위치벡터 산출
order(alpha)                       ##  -> 1 4 2 6 5 3 

# order 함수로 알파벳 순서
alpha[order(alpha)]
alpha[order(alpha, decreasing = T)]

# sort 함수는 벡터 자체를 반환
sort(alpha)
sort(alpha, decreasing = T)


#----------------------------------------
dept <- c('개발부','개발부','개발부','개발부','영업부','영업부','영업부','영업부')
position <- c('과장','과장','차장','차장','과장','과장','차장','차장')
name <- c('김가윤','고동산','박기성','이소균','황가인','최유리','김재석','유상균')
salary <- c(5400,5100,7500,7300,4900,5500,6000,6700)
worktime <- c(15,18,10,12,17,20,8,9)

com_data <- data.frame(dept,position,name,salary,worktime,stringsAsFactors = F)   ## stringAsFactors 확인 필수 
str(com_data)

# 부서별 급여의 평균
# arggregate(집계할 열 - 집계 기준 열, 집계할 데이터프레임, 집계함수)
aggregate(salary ~ dept, com_data, mean)

# 부서별 급여 및 근무시간 평균
aggregate(cbind(worktime,salary) ~ dept, com_data, mean)    ## cbind 집계할 열이 다수일 경우

# 부서 & 직급별 급여 평균
aggregate(salary ~ dept + position, com_data, mean)         ## 집계 기준열이 다수 '+'로 연결



#----------------------------------------
# edit 함수로 값 수정
ex_df_m <- edit(ex_df)
ex_df_m



#----------------------------------------
df <- ex_df[,]

df[1,2] <- 100        ## 김가수의 나이 변환

df$age = df$age * 2
df[df$weight > 70, c(1,2,3)]
df[df$weight > 70, c(3)] <- 70
df[df$weight <= 70, c('weight')] <- 0
df



#----------------------------------------
head(iris)
str(iris)

# 열 추가
iris$new_column <- "신규열"
head(iris)

iris$new_column <- NULL
head(iris)

# iris에서 1,2,3열을 삭제한 결과를 new_iris에 저장
new_iris <- iris[,-c(1,2,3)]
head(new_iris)


#-----------------------------------------
# NA를 포함하는 벡터 생성
ex_na <- c(1,2,NA,NA,3)
ex_na

sum(ex_na)   ## NA는 계산에는 포함이 된다 (NA를 무슨 값으로 정할지는 데이터분석가의 재량)

# NA를 제외하고 계산하려면 별도 옵션을 지정해야 함 (na.rm = T, rm = remove)
sum(ex_na, na.rm = TRUE)

# NULL을 포함하는 벡터 생성
ex_null <- c(1,2,NULL,NULL, 3)
sum(ex_null)                 ## NULL은 계산에 포함되지 않는다.

# 3번째 5번째 요소로 NA를 넣음
ex_cc <- c(1,2,NA,4,NA)

# NA가 있는 값는 FALSE 반환
complete.cases(ex_cc)

# ex_df를 만들 벡터 생성
id <- c('F1','F2','F3',NA)
name <- c('김가수',NA,'어만데','이기성')
age <- c(23,28,15,22)
weight <- c(67,75,73,80)

ex_nadf <- data.frame(id,name,age,weight)
ex_nadf

# complete.cases - 행 단위 검증, 데이터프레임인 경우 한 행의 모든 값에 NA가 없어야 TRUE 반환
# 아래의 결과는 1행과 3행은 NA가 없고, 2행과 4행에는 NA가 있음 (TRUE, FALSE, TRUE, FALSE)
complete.cases(ex_nadf)

ex_nadf <- ex_nadf[complete.cases(ex_nadf),]     ## NA가 있는 행을 삭제한 데이터프레임 생성
ex_nadf
