# A 학원은 성적 향상에 도움이 됐을까?
before_study <- c(34,76,76,63,73,75,67,78,81,53,
                  58,81,77,80,43,65,76,63,54,64,
                  85,54,70,71,71,55,40,78,76,100,
                  51,93,64,42,63,61,82,67,98,59,
                  63,84,50,67,80,83,66,86,57,48)

# 학원을 다닌 후의 점수
after_study <- c(74,87,89,98,65,82,70,70,70,84,
                 56,76,72,69,73,61,83,82,89,75,
                 48,72,80,66,82,71,49,54,70,65,
                 74,63,65,101,82,75,62,83,90,76,
                 87,90,78,63,59,79,74,65,77,74)

# boxplot 비교
par(mfrow = c(1,1))
boxplot(before_study, after_study,
        names = c('수강 전','수강 후'),
        horizontal = T)


#-------------------------------------------------------------------------------
# 함수가 30개 미만인 벡터 데이터 생성
shapiro_test_vector <- c(74, 87, 89, 98, 65, 82, 70, 70, 70)

# shapiro-wilk 검정
shapiro.test(shapiro_test_vector)        ## p-value >= 0.05
                                         ## 귀무가설(정규분포를 따른다) = O


#-------------------------------------------------------------------------------
# t-test 검정
# 옵션에 paired / var.equal / alternative
# var.equal 검정 (분산 값이 같으면 TRUE, 다르면 FALSE)
var_test_vector1 <- c(75,67,78,81,53,71,71,55,40,78,76,
                      42,67,98,59,63,84,50,67,80,83)
var_test_vector2 <- c(58,81,77,80,76,63,54,64,85,54,70,
                      71,71,55,40,78,76,100,51,42,63,61,82,57,48)

var.test(var_test_vector1, var_test_vector2)    ## alternative hypothesis(대립가설) : 
                                                ## true ratio of variances is not equal to 1
                                                ## p-value > 0.05  대립가설 기각
                                                ## 귀무가설(분산값이 같다.) = O


#-------------------------------------------------------------------------------
# 수학학원 t-검정 수행 1
t.test(before_study, after_study, paired=TRUE)
# p-value < 0.05
# 대립가설(alternative hypothesis: true difference in means is not equal to 0) = O


# 수학학원 t-검정 수행 2
t.test(before_study, after_study, 
       paired=TRUE,
       alternative = 'less') 
# p-value < 0.05
# 대립가설(alternative hypothesis: true difference in means is less than 0) = O
# x 집단 평균이 y집단평균보다 작다


# 수학학원 t-검정 수행 3
t.test(before_study, after_study, 
       paired=TRUE,
       alternative = 'greater') 
# p-value >= 0.05
# 대립가설(alternative hypothesis: true difference in means is greater than 0) = X
# (x집단 평균이 y집단보다 크다)라는 대립가설 틀림

# 학원수업 수강 후 성적은 향상되었다!!!!!!!


#-------------------------------------------------------------------------------
# 회귀분석
# cars 데이터 확인
# speed : 차속도(단위 mi/h), dist : 제동거리(단위: feet)
str(cars)

# '차속도'에 따른 '제동거리' 회귀분석
lm(formula = dist ~ speed, data = cars)  ## w = 3.932, b = -17.579
lm_result <- lm(formula = dist ~ speed, data = cars)

# 회귀분석 결과 확인 - summary 함수
summary(lm_result)
coef(lm_result)

## 회귀모델 방정식 : dist = 3.932 * speed - 17.579

# 결과값 시각화
plot(cars$speed, cars$dist)
abline(-17.579, 3.932,
       col = 'red')

# 회귀모델의 적합성을 판정할 수 있는 그래프들
par(mfrow = c(2,2))
plot(lm_result)


#-------------------------------------------------------------------------------
# 예측해보기 (predict 함수) - 점 추정 방식
# 예측할 독립변수 데이터프레임 생성
speed = c(50,60,70,80,90,100)
speed_df <- data.frame(speed)

speed_df

# 예측 - 점 추정 방식(interval 옵션을 생략하면 점 추정 방식을 적용)
predict(lm_result, speed_df)

# predict 결괏값 SET
predict_dist <- predict(lm_result, speed_df)

str(predict_dist)

# cbind로 speed 값 + 예측 dist 결합
cbind(speed_df, predict_dist)


#-------------------------------------------------------------------------------
# 예측해보기 (predict 함수) - 구간 추정 방식
# 모델계수에 대한 불확실성을 감안한 구간 추정(confidence) / 신뢰구간 95%
predict_dist2 <- predict(lm_result, speed_df, interval = 'confidence', level=0.95)

predict_dist2

# 입력값과 함께 보기
cbind(speed_df, predict_dist2)

# 값 해석 (speed = 60인 경우)
## 점 추정방식 = 218.3654 feet
## 구간 추정방식 = 180.8489 ~ 255.8820 feet


#-------------------------------------------------------------------------------
# 예측해보기 (predict 함수) - prediction 불확실성 + 결괏값 오차 감안한 구간 추정 / 신뢰구간 95%
predict_dist3 <- predict(lm_result, speed_df, interval = 'prediction', level=0.95)
predict_dist3

# 입력값과 함께 보기
cbind(speed_df, predict_dist3)

# prediction은 오차까지 감안하기 때문에 confidence보다 더 넓은 구간 예측
## confidence : speed=60 일때, 180.8489 ~ 255.8820 feet
## prediction : speed=60 일때, 169.7474 ~ 266.9834 feet


#-------------------------------------------------------------------------------
# csv 데이터 가져오기
purifier_df <- read.csv('clipboard',header = T, sep='\t', stringsAsFactors = F)
View(purifier_df)
str(purifier_df)


# AS시간 과 총정수기대여수 산점도
par(mfrow=c(1,2))
plot(purifier_df$purifier, purifier_df$as_time, 
     xlab = '총정수기대여수',
     ylab = 'AS시간')

# AS시간 과 노후정수기대여수 산점도
plot(purifier_df$old_purifier, purifier_df$as_time, 
     xlab = '노후정수기대여수',
     ylab = 'AS시간')

# 상관계수 r 산출
cor(purifier_df$purifier, purifier_df$as_time)      ## = 0.91
cor(purifier_df$old_purifier, purifier_df$as_time)  ## = 0.87

# 양의 상관관계가 있다는 것을 알 수있다.

#-------------------------------------------------------------------------------
# 정수기 AS기사는 몇 명 정도가 적당할까?
summary(purifier_df)

# 독립변수들 사이 상관성 제거
cor((purifier_df$purifier-purifier_df$old_purifier), purifier_df$old_purifier)    ## 0.11 으로 상관관계 없음

# 독립변수 = 10년 미만 정수기 / 10년 이상 노후 정수기
# 종속변수 = 당월 AS에 소요된 시간
purifier_df$new_purifier <- purifier_df$purifier-purifier_df$old_purifier
head(purifier_df)

lm_result <- lm(as_time ~ new_purifier + old_purifier, data = purifier_df)
lm_result
summary(lm_result)
coef(lm_result)

# 회귀식 : AS시간 = 0.0881 * (10년 이하 정수기 대여수) + 0.2397 * (10년 이상 정수기 대여수) + 193.7
# 월말 최종 대여수 : 300,000대 / 노후 70,000대

# 예측할 독립변수 값
input_predict <- data.frame(new_purifier = 230000, old_purifier = 70000)
input_predict

# 점 추정치 예측
predict_as_time <- predict(lm_result, input_predict)
predict_as_time

# AS기사 1명이 한 달간 처리하는 AS시간 = 8시간 * 20일
predict_as_time / 160

# 총 234명의 AS기사가 필요하다

# 구간 추정치 예측
predict_as_time <- predict(lm_result, input_predict, interval = 'confidence', level=0.95)
predict_as_time

predict_as_time / 160

# 최소 233명 ~ 최대 235명 필요하다







