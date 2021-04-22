# 무엇이든 묶는다! 리스트
vt_1 <- c(1,2,3,4,5)
str(vt_1)
vt_2 <- c(T,F,T,T,F,T)
str(vt_2)

df_1 <- data.frame(name = c('Alice','James','Merry'),
                   age = c(23,41,19))
str(df_1)


# 벡터(vt_1, vt_2),
# 데이터프레임(df_1)
# 함수(sum)을 엮어 var_list 객체 만들기    
var_list = list(vt_1, vt_2, df_1, sum)     ## [ [vt_1],[vt_2],[df_1],[func = sum] ] 
var_list


#-----------------------------------------------------
# list 요소에 이름 지정하기
var_list <- list(v1 = vt_1, v2=vt_2,
                 df1=df_1, function1=sum)
var_list


# list 요소 이름 출력/수정
names(var_list)
names(var_list)[3]
names(var_list) <- c('item1','item2','item3','item4')
names(var_list)

length(var_list)
summary(var_list)


#------------------------------------------------------
# list의 첫 번째 요소에 접근 
var_list[1]
str(var_list[1])             ## 리스트 구조
var_list[[1]]                ## vector로 반환

# list 요소명 확인
names(var_list)
# 접근방법 1
var_list[['item2']]
# 접근방법 2
var_list$item3

# 함수
str(var_list$item4)
var_list$item4(c(10,20,30,40))    # var_list[[4]] = var_list$item4 = sum


#------------------------------------------------------
# 세 번째 요소 변경 (방법1,2,3)
var_list[[3]] <- c(1,2,3,4)
var_list[['item3']] <- c('A','B','C')
var_list$item3 <- c(T,T,F,T,T)


#------------------------------------------------------
# 리스트 요소 삭제
var_list[[1]] <- NULL

# 리스트 요소 추가
name <- c('Alice','James')
age <- c(23,41)
var_list$new_item <- data.frame(name, age)
var_list


#--------------------------------------------
# 리스트 생성 - 지역 4일 평균 온도
korea_temp <- list(경기 = c(-10,2,1,-2),
                   강원 = c(0,-4,-5,-10))
korea_temp

# lapply 함수를 통해 각 지역의 평균 온도 산출
# '경기','강원' 요소 각각에 mean
result_lapply <- lapply(korea_temp, mean)
result_lapply

# lapply 반환 결과 유형 확인 -> 리스트
class(result_lapply)


# sapply 함수를 통해 각 지역의 평균온도 산출
# mean은 평균값을 구하는 함수로 결과값이 1개임
result_sapply = sapply(korea_temp, mean)
result_sapply

# supplt 반환 결과 유형 확인 -> 벡터
class(result_sapply)


#--------------------------------------------------------
# 나만의 함수 만들기
my_fun <- function(i,j){          ## == my_fun <- function(i,j){ (i+j) * 2 }
  result <- (i+j) * 2
  return(result)
}

my_fun(1,2)     ## == 6
class(my_fun)


#--------------------------------------------------------
# 입력 항목
input = c(1,2,3)

# 함수 생성
my_fun2 = function(obj){
  obj =  obj*2
  input <- obj
  return(obj)
}
my_fun2(input)


my_fun2 = function(obj){
  obj =  obj*2
  input <<- obj               ## <<- 를 사용하면 input에도 직접적인 영향 미침
  return(obj)
}
my_fun2(input)
input


#--------------------------------------------------------
# if, else
my_fun3 <- function(score){
  if(score >= 80){
    '합격'
  }else{
    '불합격'
  }
}

my_fun3(70)     ## =='불합격'
my_fun3(80)     ## =='합격'

# ifelse
my_fun4 <- function(score){
  ifelse(score >= 80, '합격','불합격')
}
my_fun4(70)     ## == '불합격'
my_fun4(90)     ## == '합격'

# else if                  
my_fun5 <- function(score){          ## else if 사용할 때, 함수는 차례대로 명령 인식하기 때문에 큰 범위부터 넣어줘야한다.
  if(score >= 80){                   ## ex) if ~ >= 70, else if ~ >= 80  X
    '합격'
  }else if(score >= 75){
    '대기'
  }else{
    '불합격'
  }
}
my_fun5(80)     ## =='합격'
my_fun5(75)     ## =='대기'
my_fun5(60)     ## =='불합격'


#---------------------------------------------
# 조건문 : for 반복문
my_fun6 <- function(num){
  for(x in 1:10){
    print(num + x)
  }
}

my_fun6(10)


#---------------------------------------------
# 객체 조회/삭제/저장/불러오기
ls()      ## 조회
rm(list = ls())       ## 전체 객체 삭제 >> rm(list) 형태로 들어가야함/ 1개 이상 삭제 시 리스트형태로 들어가야함.


# 벡터 생성
v_vector <- c(1,2,3,4,5)
# 데이터프레임 생성
v_df <- data.frame(v_vector)
ls()

save(v_df, v_vector, file = 'save_test.rdata')      ## 객체 선택 저장 (파일이름 반드시 지정)
save.image('save_test.rdata')                       ## 객체 전체 저장


rm(v_vector)
v_vector

load('save_test.rdata')       ## 저장된 객체 불러오기

# 메모리 상의 1개 이상의 객체를 삭제
rm(list=c('v_df','v_vector'))

# 저장된 변수 load
load('save_test.rdata')


#------------------------------------------------ (확인만 하자...)
# 현재 작업 폴더 확인
getwd()
# 작업 폴더 변경
setwd('c:/R_Data')


# 작업 폴더 내 파일 조회
# 하위 폴더까지 조회하려면
# recursive = TRUE 옵션 추가
list.files()

# 파일 존재 여부 확인, 
file.exists('test_data.csv')     ## == TRUE
file.exists('한경_신문.csv')     ## == FALSE

# 특정 폴더 내 파일 확인
# - 파일명에 경로까지 모두 출력하고 싶으다면 full.names = T
dir('c:/R_Study')

# 하위 폴더까지 모두 확인하고 싶다면
# recursive = T 옵션 추가
dir('C:/R_Study', recursive = T)


# file.info 반환 결과 구조 확인
file.info('test_data.csv')
file.info(list.files())

str(file.info(list.files()))    ## dataframe

f_info = file.info(list.files())
f_info[, c('size','isdir')]


#-------------------------------------------------
# csv파일 불러오기
csv_test <- read.csv(file = 'csv_test1.csv',
                       header = TRUE,
                       sep =',',
                       stringsAsFactors = FALSE)
str(csv_test)

# as.factor를 활용해 팩터 변환
csv_test$성별 = as.factor(csv_test$성별)
str(csv_test)


# 최초 실행 시 패키지 설치
# install.packages('xlsx')
install.packages('xlsx')

# 패키지 로드
# library(xlsx)


#--------------------------------------------------
csv_URL <- 'http://viewportsizes.com/devices.csv'

my_URL <- read.csv(file = csv_URL, header = T,
                   sep = ',',
                   stringsAsFactors = FALSE)
head(my_URL)
str(my_URL)


#--------------------------------------------------
keyid = 'c1N7z7KEDvTRSI1eJtuHGiVHaOOlF7yuSjsMNvcd5CsskIzYTNbPuki3ImWbHToiVxBnGacopQcmmZrOjpohPg%3D%3D'
url_1 ='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey='
url_2 ='&MobileOS=ETC&MobileApp=AppTest&arrange=A&numOfRows=222&pageNo=1&listYN=Y&eventStartDate=20210101&eventEndDate=20211231'
# url_1 + keyid + url_2


api_url = paste(url_1,keyid,url_2,sep="") 
api_url


#--------------------------------------------------
install.packages(('XML'))
library(XML)

# Open API 호출 주소를 통해 XML을 불러와 parsexml에 담는다.   
# (파싱= 구문 분석, XML 문서를 읽고 해석하여 태그명, 속성명, 속성값 및 엘리먼트 내용을 분리해 주느 프로그램)
parsedXml = xmlParse(api_url)
parsedXml

# XML 중 실제 데이터가 담긴 item 태그만 데이터프레임으로 변환하기 위해
# getNodeSet 함수를 이용해 item 태그만 골라낸다.
rowXml = getNodeSet(parsedXml,'//item')
rowXml

# xmlToDataFrame 함수를 활용해 XML 데이터를 데이터프레임으로 변환
api_data = xmlToDataFrame(rowXml,stringsAsFactors = F)
View(api_data)

write.table(api_data,
            file = 'api_data.csv',
            sep=',',
            col.names=T,
            row.names=F,
            append=F,
            fileEncoding = 'utf-8')
