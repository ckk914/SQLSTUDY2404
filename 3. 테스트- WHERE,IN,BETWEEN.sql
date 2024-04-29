
--WHERE 조건절
--조회 행을 제한
--PK로 조회하면 1명 나옴
--★ 동등 비교 SQL 에서는 = 한개 쓴다~!
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
    FROM tb_emp
    WHERE EMP_NO = 1000000003;
    
    --비교연산자
    -- <>  , !=  두개는 같은 의미
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
    FROM tb_emp
    WHERE sex_cd <> 1
    ;
    
    SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
    FROM tb_emp
    WHERE birth_de >= '19800101'
       AND birth_de <= 19891231
    ;
    
    --not : 표시된 것의 반대
    SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
    FROM tb_emp
    WHERE  NOT birth_de >= '19800101'
    ;

  --between 연산자   이상 AND 이하
    SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
    FROM tb_emp
    WHERE  birth_de BETWEEN '19900101' AND '19991231'
    ;
    
    --NOT BETWEEN  : ㅇㅇ이 아닌 
    SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
    FROM tb_emp
    WHERE  birth_de not BETWEEN '19900101' AND '19991231'
    ;
    
    --IN연산 : OR 연산
    SELECT 
            emp_no,
            emp_nm,
            dept_cd
    FROM tb_emp
    WHERE dept_cd = 100002 
    OR dept_cd = 100007
    ;
-- IN = OR연산 
SELECT 
            emp_no,
            emp_nm,
            dept_cd
    FROM tb_emp
    WHERE dept_cd IN (100002,100007,100008)
    ;    
    -- NOT IN = NOT OR연산 
SELECT 
            emp_no,
            emp_nm,
            dept_cd
    FROM tb_emp
    WHERE dept_cd NOT IN (100002,100007,100008)
    ;    
    
    --LIKE
    --검색에서 사용
    --와일드카드 매핑(% : 0글자 이상, _ : 딱1글자 )
    
    --주소에 용인이 포함된 사람들 조회
    SELECT
    emp_no, emp_nm, addr
    FROM tb_emp
    WHERE addr like '%용인%'
    ;
    --이름이 이로 시작하는 사람
    -- __ 언더바가 글자수 이 __ 하면 세글자 이_ 하면 2글자
    SELECT
    emp_no, emp_nm, addr
    FROM tb_emp
    WHERE emp_nm like '이__'
    ;

--이름이 심으로 끝나는사람
   SELECT
    emp_no, emp_nm, addr
    FROM tb_emp
    WHERE emp_nm like '%심'
    ;

SELECT
  email
    FROM USER
    WHERE email like '_A%@%'  --두번째 글자가 A
    ;
    
    --성씨가 김씨이면서 
    --부서가 100003,100004 중에 하나면서
    --90년대 생인 사원의 사번, 이름, 생일 , 부서코드를 조회
       SELECT
    emp_no,
    emp_nm,
    birth_de
    ,dept_cd
    FROM tb_emp
    WHERE emp_nm like '김%' 
        AND dept_cd IN(100003,100004)
          AND birth_de BETWEEN '19900101' AND '19991231'
;      


    --WHERE 1=1 (항상 트루) 쓰고 아래 AND로 묶기 
    --주석처리가 편해짐 
       SELECT
    emp_no,
    emp_nm,
    birth_de
    ,dept_cd
    FROM tb_emp
    WHERE 1=1
        AND emp_nm like '김%' 
        AND dept_cd IN(100003,100004)
          AND birth_de BETWEEN '19900101' AND '19991231'
          ;
          
          --★ NULL값 조회
          --반드시 IS NULL로 조회할 것
          --IS NULL : NULL을 조회
          --IS NOT NULL : 널이 아닌 것을 다 조회
        SELECT
            emp_no,
            emp_nm,
            DIRECT_MANAGER_EMP_NO
    FROM tb_emp
        WHERE DIRECT_MANAGER_EMP_NO  IS NOT NULL
        ;
    -- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND 
    (ADDR LIKE '%수원%' 
    OR ADDR LIKE '%일산%')
;


