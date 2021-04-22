# 20210422 미션
# 1. 'cctc_in_seoul.csv'파일을 cctv_seoul 데이터 프레임에 저장
cctv_csv <- read.csv('CCTV_in_Seoul.csv', header = T, sep =',')          ## sep = ','  열 구분 꼭 해주자
cctv_seoul <- data.frame(cctv_csv, stringsAsFactors = F) 
View(cctv_seoul) 
head(cctv_seoul)                                    



# 2. 'population_in_seoul.csv' 파일을
#     pop_seoul 데이터 프레임에 저장
pop_csv <- read.table('population_in_Seoul.csv', header = T, sep =',')

pop_seoul <- data.frame(pop_csv, stringsAsFactors = F)
View(pop_seoul)
head(pop_seoul)



# 3. pop_Seoul에 '자치구','함계_계',
#   '한국인_계','등록외국인_계',
#   'x65세이상고령자' 만 남겨라
head(pop_seoul)
pop_seoul[ , c(-1,-3,-6,-9,-12)] <- NULL   
head(pop_seoul)                                       ##  내 답안 

pop_seoul = pop_seoul[ , c(1,3,6,9,12)]               ##  쌤 답안



# 4. cctv_seoul의 컬럼 이름을
#   '구별','소계','2013년도이전',
#   '2014년','2015년','2016년' 으로 변경
names(cctv_seoul) <- c('구별','소계','2013년도이전',
                          '2014년','2015년','2016년')
names(cctv_seoul)

colnames(cctv_seoul) = names(cctv_seoul)



# 5. cctv_seoul에 '최근증가율' 열 추가
#   (2014 + 2015 + 2016 / 2013년도이전) * 100
cctv_seoul$'최근증가율' <- (cctv_seoul$`2014년` + cctv_seoul$`2015년` + cctv_seoul$`2016년`) / cctv_seoul$`2013년도이전` * 100

View(cctv_seoul)



# 6. pop_seoul의 컬럼 이름을
#   '구별','인구수','내국인','외국인','고령자'로 변경
names(pop_seoul) <- c('구별','인구수','내국인','외국인','고령자')

names(pop_seoul)
pop_seoul


# 7. pop_seoul 컬럼 추가
# 7-1. '외국인비율' 추가
# 7-2. '내국인비율' 추가
# 7-3. '고령자비율' 추가
pop_seoul$'외국인비율' <- (pop_seoul$외국인 / pop_seoul$인구수) * 100
pop_seoul$'내국인비율' <- (pop_seoul$내국인 / pop_seoul$인구수) * 100
pop_seoul$'고령자비율' <- (pop_seoul$고령자 / pop_seoul$인구수) * 100
View(pop_seoul)


# 8. cctv_seoul과 pop_seoul을
#    data_seoul에 합치세요. 기준열은 '구별'
data_seoul <- merge(cctv_seoul, pop_seoul, by = c('구별'))
data_seoul


# 9. pop_seoul에 '합계' 행을 삭제
pop_seoul$'합계' <- NULL


# 10. data_seoul의 '2013년도이전' 컬럼의
#     값이 500보다 작은 값만 출력
View(data_seoul)

data_seoul[data_seoul$`2013년도이전`< 500,]


# 11. data_seoul의 '소계' 컬럼의 값이 1002인
#     행을 출력
data_seoul[data_seoul$소계 == 1002,]




# 12. data_seoul의 2013년도이전, 2014년,
#     2015년, 2016년 컬럼 삭제
data_seoul['2013년도이전'] <- NULL
data_seoul['2014년'] <- NULL
data_seoul['2015년'] <- NULL
data_seoul['2016년'] <- NULL


# 13. 각 구별 CCTV 현황을 바 그래프로
str(cctv_seoul)
as.character(cctv_seoul$구별)
as.numeric(cctv_seoul$소계)

barplot(cctv_seoul$소계,
        names = data_seoul[,1],
        main = '구별 CCTV 현황')


# 14. 각 구별 CCTV 현황을 내림차순으로 정렬 후
#     바 그래프로
ds_sort <- cctv_seoul[order(cctv_seoul[,2], decreasing = T),]
ds_sort

barplot(ds_sort[,2],
        names = ds_sort[,1],
        main = '구별 CCTV 현황')





































