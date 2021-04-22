# 평균 구하기
# A식당의 배달시간 벡터 생성
storeA = c(20,21,23,22,26,28,35,35,41,
           42,43,45,44,45,46,47,47,46,
           47,58,58,59,60,56,57,57,80)
mean(storeA)

# B식당의 배달시간 벡터 생성
storeB = c(5,6,11,13,15,16,20,20,21,23,
           22,27,27,30,30,32,36,37,37,40,
           40,43,44,45,51,54,70,600)
mean(storeB)

# 600보다 작은 것만 선택
storeB[storeB < 600]
mean(storeB[storeB < 600])

# 벡터 선언
nums = c(1,5,2,3,1000)

# 평균
mean(nums)

# A식당 사분위수
quantile(storeA)       ## 평균은 storeB가 크지만 사분위수로 봤을 때,
quantile(storeB)       ## 대체로 B상점의 배달 시간이 빠른 것을 알 수 있다.

# boxplot으로 본 storeB
boxplot(storeA, storeB[storeB < 600], names = c('A식당','B식당'),
        main = '식당 배달시간', xlab = '배달시간', ylab = '식당',
        horizontal = T)

# 평균을 추가로 표기
points(c(mean(storeA), mean(storeB)), pch = 2, col = 'red', cex = 3)

#-------------------------------------------------------
# 중간 값
# 1,2,3,5,1000
# 벡터가 홀수 개일 경우 가운데 값인 3이 반환
median(nums)

#1,2,5,1000
# 벡터가 짝수 개일 경우 (n/2번째 수 + n/2 + 1 번째 수) / 2 값이 중간값이다.  median = 3.5
num <- c(1,5,2,1000)
median(num)


#--------------------------------------------------------
# 사분위수
nums = 1:17
nums

# 사분위수는 quantile 함수로 산출
quantile(nums)


#----------------------------------------
# 중간 값이 동일한 집단 만들기
A = c(0,1,1,1,5,9,9,9,10)
B = c(0,4,4,4,5,6,6,6,10)

median(A)
median(B)

quantile(A)
quantile(B)


#----------------------------------------
# boxplot 그래프 그리기
boxNums <- c(21,22,23,24,25)

# 사분위수 확인
quantile(boxNums)

# boxplot 그래프
boxplot(boxNums,
        horizontal = T)

# 이상치 확인
boxNums <- c(16,21,22,23,24,25,30)
quantile(boxNums)
boxplot(boxNums, horizontal = T, 
        pch=19, cex = 1)

# IQR * 2 설정  >>  boxplot 옵션 중 range = 2 사용


#----------------------------------------------
# 분포를 확인하는 그래프 histogram
storeB = c(5,6,11,13,15,16,20,20,21,23,
           22,27,27,30,30,32,36,37,37,40,
           40,43,44,45,51,54,70,600)

storeC <- c(5,5,5,12,10,11,20,20,
            20,20,20,21,20,30,32,
            31,31,31,36,40,40,51,
            61,51,61,61,70)

# hist()   >> breaks 옵션으로 간격설정 가능 (벡터형태로 넣어야함, 기본10)
hist(storeB[storeB < 600], main = 'B식당 배달시간 분포',
     xlab = '배달시간 구간',
     ylab = '건수',
     breaks = c(0:14)*5)
mean(storeB[storeB < 600])
sd(storeB[storeB < 600])    ## mean +- sd   B식당은 15 ~ 45분 이내에 배달된다.

hist(storeC, main = 'C식당 배달시간 분포',
     xlab = '배달시간 구간',
     ylab = '건수',
     breaks = c(0:14)*5)
mean(storeC)
sd(storeC)                  ## mean +- sd   C식당은 11분 ~ 49분 이내에 배달된다.


#-----------------------------------------------------------
# 범주형 데이터 보기
bloodType <- c('A','B','A','AB','O',
               'A','O','B','A','O',
               'O','B','O','A','AB',
               'B','O','A','A','B')
length(bloodType)

# table 함수의 결과 객체 생성
table(bloodType)

table_bloodType <- table(bloodType)
str(table_bloodType)

# table_bloodType 범주 확인
names(table_bloodType)

# Pie 차트 그리기
pie(table_bloodType,
    main = '이슬반 혈액형 분포',
    labels = c('A형','AB형','B형','O형'),
    col = rainbow(10))                     ## 벡터형태로 하나하나 색 넣어도 된다.
text(0.3,0.3,'35%')
text(0.3,-0.3,'30%')
text(-0.4,0.3,'10%')
text(-0.4,-0.3,'25%')


#----------------------------------------------------
# 막대차트(barplot) 그리기
val1 <- c(1,20,30,10,50)
xlab <- c('가','나','다','라','마')

barplot(val1, names = xlab)

barplot(table_bloodType,
        names = c('A형','AB형','B형','O형'),
        main = '이슬반의 혈액형 분포',
        ylab = '학생수',
        xlab = '혈액형',
        col = heat.colors(4))

#----------------------------------------------------
name = c("정수병","박성동","박산우","김현수","류성희","전창욱","김소한","백지향","김미성","고희태",
         "강청남","송시현","아련한","고민해","최소한","최두경","전찬경","김아름","홍수태","김영화")
gender = c("남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여")
classDF = data.frame(name, gender, bloodType, stringsAsFactors = F)
View(classDF)

str(classDF)

head(classDF[,c(2,3)])
table(classDF[,c(2,3)])

addmargins(table(classDF[,c(2,3)]))     ## table 분석자료 + sum까지 추가해줌

# 범례 추가
classTable <- table(classDF[,c(2,3)])  
barplot(table(classDF[,c(2,3)]))
barplot(classTable, legend= T,          ## 범례추가
        ylim = c(0,8),
        col = c('skyblue','lightpink'))

# beside 입력 항목을 활용해 성별을 별도
# 막대로 표기, 범례 영역을 위해 y축 길이를 설정 (ylim)
barplot(classTable, legend= T,          
        ylim = c(0,8),
        col = c('skyblue','lightpink'),
        beside = T)                     






     