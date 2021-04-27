# 표준정규분포표 값 구하기 : pnorm()
# 영어 시험 : mean=600, sd=100, 내 점수 = 800
# 중국어 시험 : mean=50, sd=5, 내 점수 = 65
# 나는 어느 시험에서 등수가 더 높은가?

pnorm(800, mean=600, sd=100, lower.tail = F)

pnorm(65, mean = 50, sd=5, lower.tail = F)

# 결과 : 중국어시험 상위 1.3%
#        영어 시험 상위 2.27%
#        중국어 시험을 상대적으로 더 잘 봤다.


#-------------------------------------------------------------------------------
# A과수원 203.81g ~ 302.9g 사이 선택될 확률
# mean=300, sd=50

pnorm(203.81, mean=300, sd=50, lower.tail = T)   ## = 2.718%

pnorm(302.9, mean=300, sd=50, lower.tail = T)    ## = 52.31%

# 결론 = 203.81g ~ 302.9g 사이 선택될 확률 = 52.31 - 2.71 = 49.6%


#-------------------------------------------------------------------------------
# A과수원에서 상위 10% 지점의 무게
qnorm(0.1, mean=300, sd=50, lower.tail = F)   ## = 364.0776g

# A과수원에서 하위 10%인 지점의 무게
qnorm(0.1, mean=300, sd=50, lower.tail = T)   ## = 235.9224g


#-------------------------------------------------------------------------------
# 중심극한정리
# A반 수학 성적
Aclass = c(10,10,100,100)

# A반 수학 평균
mean(Aclass)                 ## = 55

# A반 수학 성적 히스토그램
hist(Aclass, breaks = 10)

# Aclass Samples Mean 구하기
sample(Aclass, 2, replace=F)
asm = sapply(1:20,
             function(i) mean(sample(Aclass, 2, replace=F)))

# 20번 추출된 표본의 평균 확인
asm

# 표본 평균들의 평균
mean(asm)

# histogram으로 표현
hist(asm)


#-------------------------------------------------------------------------------
# A반 수학 성적 생성(총 300개, 10점/50점/100점 각 100개)
Aclass2 = c(rep(10,100),rep(50,100),rep(100,100))
Aclass2

# A반 수학 평균
mean(Aclass2)

# A반 수학 성적 히스토그램
hist(Aclass2)

# 2행 2열로 그래프 한번에 그리기 위해 설정
par(mfrow=c(2,2))

# 2씩 뽑아 (표본크기2) 10000번 추출 후 평균
asm2 = sapply(1:10000,
              function(i) mean(sample(Aclass2, 2, replace = F)))
hist(asm2, main='표본크기 2')

# 30씩 뽑아 (표본크기30) 10000번 추출 후 평균
asm2 = sapply(1:10000,
              function(i) mean(sample(Aclass2, 30, replace = F)))
hist(asm2, main='표본크기 30')

# 50씩 뽑아 (표본크기50) 10000번 추출 후 평균
asm2 = sapply(1:10000,
              function(i) mean(sample(Aclass2, 50, replace = F)))
hist(asm2, main='표본크기 50')

# 80씩 뽑아 (표본크기30) 10000번 추출 후 평균
asm2 = sapply(1:10000,
              function(i) mean(sample(Aclass2, 80, replace = F)))
hist(asm2, main='표본크기 80')


#-------------------------------------------------------------------------------
# 우연을 재현해 주는 set.seed 함수
# 집합 만들기
groupA <- c(1,2,3,4,5,6,7,8,9,0)

# 1번째 수행
sample(groupA, 4)

# 2번째 수행
sample(groupA, 4)

# 3번째 수행
sample(groupA, 4)

# 1번째 수행 - seed 번호 1234
set.seed(1234)
sample(groupA, 4)

# 2번째 수행 - seed 번호 1234
set.seed(1234)
sample(groupA, 4)

# seed 번호가 같으면 랜덤함수여도 동일한 값이 나온다.


#-------------------------------------------------------------------------------
# 대립가설(alternative hypothesis) : 가설검정에서 연구자의 주장이 담긴 진술
# 귀무가설(null hypothesis) : 가설 검정에서 연구자의 주장에 대한 부정 진술
# P-value : 귀무가설을 지지하는 확률 (낮을 수록 대립가설 채택가능성 높아짐)
cars
str(cars)

summary(lm(cars$speed ~ cars$dist))












































