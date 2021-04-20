# 여러 성질
love_num <- 1
love_str <- '안녕하세요'
love_vec <- c(1,1,1,1)
love_fun <- print

# str함수를 사용해서 성질 파악
str(love_num)
str(love_str)
str(love_vec)
str(love_fun)



# B는 A로부터 지정된 객체
A = 1
B = A
print(A)
print(B)

A = 9
print(A)    # A = 9
print(B)    # B = 1  >>> 각 개체는 독립적이다....! 위에서 A=B 지정했다고 자동으로 바뀌지 않는다

# 생성된 벡터 값 확인(벡터 안의 형태는 다 같아야한다)
vec_t = c(1,2,3,4)

# 생성된 벡터의 값 확인
vec_t

# 벡터 정보 확인 - 길이가 4인 숫자 벡터
str(vec_t)

# 벡터의 길이 확인 - 반복문에서 자주 활용
length(vec_t)

# 벡터를 생성할 때, 문자와 숫자 혼용 시 다 문자로 변환함
vec_t = c(1,'hi',2)
vec_t                
str(vec_t)


# 1로 선언
scalar_item <- 1

# 객체 값 추력
scalar_item

# 1을 요소로 가지는 길이가 1인 벡터 선언
vector_item <- c(1)
vector_item

# identical은 두 객체가 같은지 확인하는 함수
identical(scalar_item, vector_item)     ## 1 = c(1)

# 숫자형 벡터 - 양수, 음수, 소수점 모두 하나의 벡터에 담을 수 있다.
numeric_vector <- c(1, 1.0, -1, -0.5)
numeric_vector

# numeric_vector의 타입 확인
mode(numeric_vector)
str(numeric_vector)    ## 소수점이나 숫자를 같다고 인식 2 = 2.0


# 숫자 벡터 선언
n_vector = c(1,2,3,4,5,6,7,8,9)

# 최솟값
min(n_vector)

# 최댓값
max(n_vector)

# 평균
mean(n_vector)

# 중앙값
median(n_vector)

# 합계
sum(n_vector)


# Inf와 NaN이 포함된 벡터 만들기
c_vector = c(1/0,2/2, -2/2, 1/0, 0/0)
c_vector


# TRUE = T = 1, FALSE = F =0 으로 설정
ex_logical_1 = c(TRUE, FALSE, TRUE, FALSE)
ex_logical_1
mode(ex_logical_1)

# 따옴표를 붙이면 문자열이 된다.
ex_logical_3 <- c('true', 'false','true','false')
ex_logical_3
mode(ex_logical_3)

# 논리 벡터 -TRUE, FALSe, T, F 모두 가능
ex_logical = c(TRUE, T, FALSE, F)
ex_logical

# ! 기호를 이용해 TRUE는 FALSE로
# FALSE는 TRUE로 변환
!ex_logical

# as.logical: logical 변수로 형변환
ex_logical = as.logical(c(0,-1,1,100,0))
ex_logical

# FALSE는 0, TRUE는 1로 변환
as.numeric(ex_logical)


# 문자열 벡터 생성
v_character = c('문자열1','문자열2', 'A', '1')
v_character
mode(v_character)


# 문자 개수 출력
nchar(c('f123','f124','f125','f126'))

# 문자열 자르기 - n번째 ~ m번째까지 자르기
substr("123456",2,4)
substr(c('f123','f124','f125','f126'),2,4)

# 특정 문자로 데이터 나누기 
# - split에 정의한 구분자를 기준으로
# 문자열을 나누어 벡터로 변환
strsplit('2014/11/22', split='/')

# 문자열 합치기
# 합칠 때 문자열 사이의 문자느 sep에 정의
# sep를 정의하지 않으면 문자열 사이에
# 공백을 붙여 합침
paste("50 = ", "30 + ", "20", sep = "")
paste("50 = ", "30 + ", "20")           # sep 기본옵션 한 칸 띄우기

paste("50 = ", "30 + ", "20", sep = "☆")
paste('2021','04','19', sep ='.')

# 소문자 변환
tolower("AbasQWEmmweQVDVD")

# 대문자 변환
toupper("AbasQWEmmweQVDVD")


# factor로 변환할 문자 벡터
v_character = c('사과','복숭아',
                '사과','오렌지',
                '사과','오렌지','복숭아','사과')
v_character

# factor 함수로 팩터를 생성 : 문자에 해당하는 숫자를 지정
v_factor <- factor(v_character)
v_factor         
mode(v_factor)

# 객체 정보 확인
str(v_factor) 
v_factor

# 팩터르 문자 벡터로 변환
v_factor_to_char = as.character(v_factor)
v_factor_to_char

# 팩터를 숫자 벡터로 변환
v_factor_to_num = as.numeric(v_factor)
v_factor_to_num
