

SELECT *FROM tb_SAL_HIS;
----------------------------------------------------
--집계 함수 (다중행 함수)
--여러 행을 묶어서 한번에 함수를 적용
----------------------------------------------------
--COUNT(*) : 조회된 행 갯수( null 포함 갯수 계산)
SELECT
    COUNT(*) "지급 횟수",
    SUM(PAY_AMT) "지급 총액",
    avg(pay_amt) "평균 지급액",
    MAX(PAY_AMT) "최대 지급액",
     MIN(PAY_AMT) "최소 지급액"
FROM tb_sal_his
;
----------------------------------------------------
SELECT
    SUBSTR(emp_nm,1,1)
FROM tb_EMP
;

SELECT
    *
FROM tb_EMP    -- 41행
;

SELECT
 COUNT(*)      --41행
FROM tb_EMP
;

SELECT
 EMP_NM   --41행
FROM tb_EMP
;

SELECT
 COUNT(EMP_NM)   --41행
FROM tb_EMP
;

SELECT
 EMP_NM 
FROM tb_EMP
WHERE EMP_NM LIKE '김%'   --13행
;

SELECT
 COUNT(EMP_NM)
FROM tb_EMP
WHERE EMP_NM LIKE '김%'    --13행
;

SELECT
 direct_manager_emp_no    --41행
FROM tb_EMP
;

SELECT
 count(direct_manager_emp_no)    --40행    --null은 카운트 하지 않음!
FROM tb_EMP
;
CREATE TABLE QUIZ_50(
   COL1 number(10),
   COL2 number(10),
   COL3 number(10)
);

insert into quiz_50 values (10,20,null);
insert into quiz_50 values (15,null,null);
insert into quiz_50 values (50,70,20);

select * from quiz_50;

select sum(col2) from quiz_50;   --90

SELECT
SUM(coL1+col2+coL3)     --140  
FROM quiz_50;
--풀이
-- 1행 => 10+20 + null  = null
-- 2행 => 15+ null+null = null
-- 3행 => 50+70+20     =  140
-------------------------------------------------
SELECT 
        COUNT (EMP_NO) "총 사원수",  --41
        MIN(birth_de)  "회사 최연장자 생일",
        MAX(birth_de) "회사 최연소자 생일"
    FROM tb_emp
    ;
-------------------------------------------------
--GROUP BY : 지정된 컬럼으로 소그룹화 한 후,
--                    각 그룹별로 집계함수를 각각 적용
--부서별로 사원수가 몇명인지 
--부서별로 최연장자의 생일은 언제인지?

SELECT 
  EMP_NO,
  EMP_NM,
  BIRTH_DE,
  DEPT_CD
FROM tb_emp
ORDER BY DEPT_CD;

SELECT 
COUNT(*) " 부서별 사원수"
,DEPT_CD,
MIN(BIRTH_DE) "부서별 최연장자",
MAX(BIRTH_DE) "부서별 최연소자"
FROM TB_EMP
GROUP BY DEPT_CD;

SELECT * FROM TB_SAL_HIS;

SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

--GROUP BY절에 사용한 컬럼만
-- SELECT에서 직접 조회 가능
SELECT 
count(*),EMP_NO
FROM TB_EMP
GROUP BY emp_no
;

SELECT 
    SEX_CD"성별",DEPT_CD"부서",
    COUNT(*)"인원수",MAX(birth_de)"어린녀석"
    FROM TB_EMP
 GROUP BY DEPT_CD,SEX_CD
 ORDER BY DEPT_CD
;

--사원별로 2019년에 급여 평균액, 
-- 최소지급액, 최대지급액 조회
--WHERE절  => 집계전에 먼저 필터링

SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

--WHERE절  => 집계전에 먼저 필터링
-- having : 집계 후 필터링
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt)>= 4000000
ORDER BY emp_no
;
-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
--그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.
SELECT 
    dept_cd,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) AS CNT
    FROM tb_emp
    group by dept_cd
    HAVING COUNT(*) > 1
    order by dept_cd
;

SELECT * FROM tb_sal_his;

-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값)
-- DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_nm DESC
;


SELECT 
    emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름 DESC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC   --숫자 : 속성 순서  dept_cd
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC   --생략 시 ASC(오름차)
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(PAY_AMT)
;

SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;


--null이 제일 크다 (오라클에서는)
SELECT
    emp_nm,
    direct_manager_emp_no
    FROM tb_emp
    order by direct_manager_emp_no  desc
    ;