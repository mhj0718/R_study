# 팩터로 변환할 문자 벡터
v_character <- c('사과','복숭아','사과',
                 '오렌지','사과','오렌지',
                 '복숭아')
v_character

# factor 함수로 팩터를 생성
v_factor <- factor(v_character, 
                   levels = c('사과','복숭아'))    
v_factor

v_factor <- factor(v_character, levels = c('복숭아','오렌지','사과'))  ## levels로 순서지정 가능
v_factor

# 생성된 팩터 출력
v_factor


# 등급을 나타내는 문자 벡터
ex_label =c('하하','중하','중','중상','상상')

# 서열형 데이터 팩터 생성
# (ordered=T 서열형 팩터 생성)
ordered_factor <- factor(ex_label, levels = c('하하','중하','중','중상','상상'), ordered = T)
ordered_factor

# 숫자 벡터
v_num <- c(1000,2000,1000,2000,3000,2000,3000)

# 숫자 벡터를 팩터로 변환 
v_num_factor <- factor(v_num)
v_num_factor

# 팩터->숫자 벡터로 변환
as.numeric(v_num_factor)

# 팩터->문자 벡터로 변환
v_char <- as.character(v_num_factor)

# 문자 벡터->숫자 벡터로 변환
v_num <- as.numeric(v_char)
v_num


ex_trans <- c(1,0,1,0,0,0)

# 문자 타입 변환
as.character(ex_trans)

# 논리 타입으로 변환 / 논리 타입에서는 0은 FALSE, 1은 TRUE
as.logical(ex_trans)


# 벡터 인덱싱 (특정요소 선택하기기)
# 벡터 생성
t_vector <- c(11,12,13,14,15,16,17,18,19,20)
t_vector

t_vector[3]  ## = 13
t_vector[c(3,4,6)]    ## = 13, 14, 16
t_vector[c(-3,-4,-6)]     ## 13, 14, 16 빼고 출력
t_vector[c(1:5)]    ## 1 ~ 5까지 뽑아줘


# 연속된 벡터 생성
seq_vector <- c(1:10)
seq_vector

seq_vector <- c(51:100)
seq_vector[30:40]  ## 30번째 ~ 40번째까지 출력해라


# seq함수
# from : 시작숫자, to : 종료숫자,
# by : 건너뛸 숫자

# 10 ~ 20까지 2씩 커지는 숫자 생성
seq(10,20,by = 2)

# 20 ~ 10까지 2씩 작아지는 숫자 생성
seq(20,10, by = -2)

# 1 ~ 30까지 3씩 커지는 숫자 생성
seq(1,30,by = 3)


# 백터 생성
t_vector <- c(11,12,13,14,15)

# 3번째 요소 선택
# 선택할 요소의 위치에는 TRUE
# 선택하지 않을 요소의 위치에는 FALSE를 지정
logical_idx <- c(F,F,T,F,F)

# TRUE로 설정된 3번쨰 요소만 출력됨
t_vector[logical_idx]


# 논리연산
t_vector
t_vector < 13
t_vector[t_vector < 13]   # 요소 중 13보다 작은 요소만 출력
t_vector[t_vector <= 13]  # 요소 중 13보다 작거나 같은 요소 출력
t_vector[t_vector >= 13]  # 요소 중 13보다 크거나 같은 요소 출력


# 백터 값 수정
vector_m <- c(1,2,3,4,5)
vector_m[3] <- 10
vector_m[c(2,4)] <- 9
vector_m[vector_m > 5] <- 3
vector_m[2:5] <- 0
vector_m[1:length(vector_m)] <- 0   ## 벡터의 길이를 모를 때, length 함수를 쓰면 된다...!



# 벡터 값 추가
v_add <- c(1,2,3,4,5)
v_add

v_add = c(0,v_add)
v_add

v_add = c(c(-1,-2),v_add)
v_add

v_add  = c(v_add,c(6,7,8))
v_add

v_add = c(v_add, 9:10)
v_add



# 3개의 벡터를 엮어(combine) 하나의 벡터를 형성
t_add1 <- c(1,2,3)
t_add2 <- c(4,5,6)
t_add3 <- c(7,8,9)

new_add <- c(t_add1,t_add2,t_add3)
new_add

## 문자열 벡터도 엮을 수 있다.
vector_a <- c('A','B','C','F')
vector_b <- c('D','E')

vector_c <- c(vector_a, vector_b)
vector_c

## append 함수
vector_c <- append(vector_a, vector_b, 3)    ### vector_a 3번째 뒤에 vector_b를 넣어줌
vector_c


#--------------------------------------
t_vector = 11:20
t_vector

# 1,3,5,6번째 요소 선택
t_vector[c(1,3,5,6)]

# 1,3,5,6번째 요소 제외하고 선택
t_vector[c(-1,-3,-5,-6)]
t_vector[-length(t_vector)]   ## 마지막 제외하고 추출



# 2,3번째 항목이 TRUE로 설정된 논리 벡터 생성
logical_var <- c(FALSE,TRUE,TRUE,
                 FALSE,FALSE)

!logical_var

# 벡터 생성
v_str = c('첫째','둘째','셋째','넷째','다섯째')
v_str[logical_var]
v_str[!logical_var]


# 벡터의 연산
a = 3
b = 5
a+b
a-b
a*b
a/b

# 벡터 생성 (길이가 같은)
a <- c(1,2,3,4)
b <- c(5,6,7,8)

# 더하기 / 빼기 / 곱하기 / 나누기
c = a + b
c = a - b
c = a * b
c = a / b

# 길이가 다른 벡터끼리의 연산 (배수일 때만 가능)
a <- c(1,2,3,4)
b <- c(1,2)
c = a+ b           # b >> 1,2,1,2 로 a와 더해진다 

