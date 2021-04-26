# 최초 실행 시 패키지 설치
install.packages("httr")

# 패키지 로드
library(httr)


#--------------------------------------
# 워드 클라우드 (네이버 openAPI)
url_str <- 'https://openapi.naver.com/v1/search/blog.xml'
searchString <- '?query=코타키나발루'

# UTF-8 인코딩
searchString = iconv(searchString,
                     to = "UTF-8")

# url 인코딩
searchString = URLencode(searchString)
searchString

etcString = "&display=100&start=1&sort=sim"


# URL 조립
reqUrl = paste(url_str, searchString, etcString, sep='')
reqUrl


# client ID 설정
clientId = 'UWHF47Ojv3VPR1mQx_xa'

# client password 설정
clientSecret = 'kvL2c2dFMA'


# GET 함수 호출(인증정보는 add_headers에)
apiResult = GET(reqUrl,
                add_headers('X-Naver-Client-Id' = clientId,
                            'X-Naver-Client-Secret' = clientSecret))

# 호출 결과 조회(응답코드(status)가 200이면 정상)
apiResult

# Open API의 결과 구조 확인
str(apiResult)

# 응답 결과 내용 확인
apiResult$content

# content 요소 확인
str(apiResult$content)


#---------------------------------------------------
# raw형을 문자로 변환
result = rawToChar(apiResult$content)
result

# UTF-8로 변환
Encoding(result) = 'UTF-8'
result[1]

# install.packages('xml2')
library(xml2)
resultdf = read_xml(result)
resultdf


# 문장 정제하기 (gsub 함수)
gsub("ABC", "***", 'ABCabcABC')
gsub("ABC", "", 'ABCabcABC')

# 대소문자를 무시하고 변환
gsub('ABC','***','ABCabcABC', ignore.case = T)

# 벡터 문자열 치환
x = c('ABCabcABC','abcABCabc')
gsub('ABC','***',x)

# b와 n 사이에 문자 1개가 있는 패턴은 ***로 치환
gsub("b.n","***","i love banana")
gsub("b.n","***","i love bㅍnana")

# b 이후 문자가 0개 이상 있고 a로 끝나는 패턴은 ***로 치환
gsub("b.*a", "***", 'i love banana')

# ba와 na는 ***로 치환
gsub("[bn]a", "***", "i love banana")

# 핸드폰 전화번호 패턴 : 010-숫자4개-숫자4개
gsub("010-[0-9]{4}-[0-9]{4}",
     "010-****-****",
     '내 폰 번호는 010-9123-0000')
gsub("010-\\d{4}-\\d{4}",
     '010-****-****',
     '내 폰 번호는 010-9123-0000')


#-----------------------------------------------------------------------
# openAPI 응답 xml 전처리(정규표현식)4
# 변경 전 검색 결과
result

# 검색결과를 변수에 저장
refinedStr = result

# XML 태그를 공란으로 치환
refinedStr = gsub("<(\\/?)(\\w +)*([^<>]*)>",
                  " ", refinedStr)
refinedStr

# 단락을 표현하는 불필요한 문자를 공란으로 치환
refinedStr = gsub("[[:punct:]]"," ", refinedStr)
refinedStr

# 영어 소문자를 공란으로 치환
refinedStr = gsub("[a-z]", " ", refinedStr)
refinedStr

# 숫자를 공란으로 치환
refinedStr = gsub("[0-9]", " ", refinedStr)
refinedStr

# 여러 공란은 한 개의 공란으로 변경
refinedStr = gsub(" +", " ", refinedStr)
refinedStr

# ---------------------------------------------------------------------

# https://m.facebook.com/notes/r-korea-krugkorean-r-user-group/konlp-%EC%84%A4%EC%B9%98-%EC%9D%B4%EC%8A%88-%EA%B3%B5%EC%9C%A0/1847510068715020/
# KoNLP 설치 이슈 공유

# 의존성 패키지 설치
# install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

# github 버전 설치
# install.packages("remotes")

# 64bit 에서만 동작합니다.
# remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

# 패키지 로드
library(KoNLP)

# 단어 추출 테스트
extractNoun("안녕하세요 오늘은 기분 좋은 하루 입니다.")

nouns = extractNoun(refinedStr)
nouns[1:40]

# 길이가 1인 문자를 제외
nouns = nouns[nchar(nouns) > 1]
nouns

# 제외할 특정 단어를 정의
excluNouns = c("코타키나발루","YONG","JUN",
               "JAYDEN","포스팅을", "API","저희",
               "MERDEKA","WISMA")
nouns = nouns [!nouns %in% excluNouns]
nouns

str(nouns)


# 빈도수 (table)를 기준으로 내림차순(decreasing=T) 정렬(sort) ->
# 상위 50개만 추출([1:50])
wordT = sort(table(nouns),
             decreasing = T)[1:50]
wordT


# -------------------------------------------------------------------------
#install.packages('wordcloud2')
library(wordcloud2)

# 워드 클라우드 그리기
wordcloud2(wordT,
           size = 3,
           shape = 'diamond')
