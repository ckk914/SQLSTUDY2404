--------------------------------------------------------------------------------------------------
-- OUTER JOIN 실습환경 세팅
--2팀 추가
INSERT INTO tb_dept VALUES ('100014', '4차산업혁명팀', '999999');
INSERT INTO tb_dept VALUES ('100015', '포스트코로나팀', '999999');
COMMIT;

SELECT * FROM tb_dept;
--------------------------------------------------------------------------------------------------
ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;
--------------------------------------------------------------------------------------------------
--부서 없는 5명 추가
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '이순신', '19811201', '1', '경기도 용인시 수지구 죽전1동 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '정약용', '19820402', '1', '경기도 고양시 덕양구 화정동 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '박지원', '19850611', '1', '경기도 수원시 팔달구 매탄동 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '장보고', '19870102', '1', '경기도 성남시 분당구 정자동 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '김종서', '19880824', '1', '경기도 고양시 일산서구 백석동 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
--------------------------------------------------------------------------------------------------
SELECT * FROM tb_emp ORDER BY emp_no DESC;
--------------------------------------------------------------------------------------------------
SELECT emp_no, emp_nm, dept_cd 
FROM tb_emp ORDER BY emp_no DESC;
--------------------------------------------------------------------------------------------------
SELECT * FROM tb_dept;
--------------------------------------------------------------------------------------------------
--사원명과 부서명을 조회한다
SELECT
    E.emp_nm,
    D.dept_nm
FROM tb_emp E
INNER JOIN tb_dept D
ON E.dept_cd    = d.dept_cd  --부서가 있는 애들만 조회가 된다~!
;
--------------------------------------------------------------------------------------------------
--회원 (user)과 회원의 주문 내역(order)을 조회
-- # OUTER JOIN (합집합)
-- 1. 조인 조건을 만족하지 않는 행들도 조회할 때 사용하는 조인기법입니다.
-- 2. OUTER조인 연산자 기호는 (+)기호입니다.
--★★ 3. INNER조인은 조인 조건을 만족하지 않으면 해당 행을 조회하지 않습니다
--   그러나 OUTER JOIN은 방향(LEFT, RIGHT, FULL)에 맞게 조건에 매칭되지 
--   않는 행들도 모두 NULL로 처리해서 조회합니다.
--------------------------------------------------------------------------------------------------
-- # LEFT OUTER JOIN (A,B 집합 중 A로 생각하면 됨)
-- 조인되는 왼쪽 테이블은 모두 조회하고, 오른쪽 테이블은 조인조건에 매칭된 것만 조회합니다.

-- 나는 사원정보는 일단 다 보고 싶은데 혹시 부서테이블에서 부서코드가 매칭되면
-- 보너스로 부서이름도 찍어줘라

--step 1=> 프로덕트 곱
--step2 => ★★ 같은 것 쓰고 
--step3 =>  기존 왼쪽 속성 사용해서 적고 조인해서 생긴 속성에는 NULL값 넣기
-------------------------------------------------------------------------------------
SELECT
 *   FROM tb_emp E
    INNER JOIN tb_dept D  
    ON E.dept_cd = D.dept_cd    
;
-------------------------------------------------------------------------------------
--사원명과 부서명 조회 : 사원 정보는 일단 다 조회
SELECT
 E.emp_nm,   
 D.dept_nm
    FROM tb_emp E
    LEFT OUTER JOIN tb_dept D  --왼쪽은 다 보여주고 
    ON E.dept_cd = D.dept_cd    --오른쪽은 조건 만족한 애들만
;
-------------------------------------------------------------------------------------
SELECT
 *   FROM tb_emp E
    LEFT  JOIN tb_dept D  --왼쪽은 다 보여주고   (OUTER 생략 가능)*
    ON E.dept_cd = D.dept_cd    --오른쪽은 조건 만족한 애들만
;
-------------------------------------------------------------------------------------
--오라클 조인 inner join
SELECT
 E.emp_nm,   
 D.dept_nm
    FROM tb_emp E, tb_dept D  
    WHERE E.dept_cd = D.dept_cd    
;
------------------------------------------------------------------------------
--오라클 조인
-- LEFT : 오른쪽에 (+)를 붙임
-- RIGHT : 왼쪽에 (+)를 붙임
-- FULL: 지원하지 않음
   --(+)가 붙으면 표준 조인에서 ON절에 위치하는 조건
------------------------------------------------------------------------------
--오라클 LEFT JOIN
SELECT
 E.emp_nm,   
 D.dept_nm
    FROM tb_emp E, tb_dept D  
    WHERE E.dept_cd = D.dept_cd (+)    -- 조건절에 (+) 붙인다 
;                                      -- 적용 하고 싶은 곳 반대로 붙인다. 
                                       -- 오른쪽에 붙였으면 left join
------------------------------------------------------------------------------
-- # RIGHT OUTER JOIN  (A,B 집합 중 B로 생각하면 됨)
-- 조인되는 오른쪽 테이블은 모두 조회하고, 왼쪽 테이블은 조건에 매칭된것만 조회
-- 나는 모든 부서정보를 조회하고 싶은데 혹시 부서코드가 일치하는 사원이 있으면 함께 조회해줘
------------------------------------------------------------------------------
SELECT
    E.emp_nm,
    D.dept_nm
FROM tb_emp E
RIGHT OUTER JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
;
-------------------------------------------
--null	포스트코로나팀  이름 없는 부서 2개 조회됨*
--null	4차산업혁명팀
-------------------------------------------
SELECT
    *
FROM tb_emp E
RIGHT OUTER JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
;
-------------------------------------------
-- 오라클 RIGHTER JOIN
SELECT
    *
FROM tb_emp E, tb_dept D 
WHERE E.dept_cd (+) = D.dept_cd
;
-------------------------------------------
-- #FULL OUTER JOIN  (집합 기준 A,B 전체)
-- - 왼쪽 조인테이블, 오른쪽 조인테이블을 모두 보여주고 매칭되면
--   매칭데이터까지 합쳐서 보여줌
SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
FULL OUTER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
ORDER BY A.emp_no 
;
-----------------------------------------------------------------------------
--사원이 46명 , 부서가 16개
-- 부서에 소속된 사원이 41명 
-- 사원이 존재하는 부서 14개
--INNER JOIN의 결과 : 41건
--LEFT JOIN 결과 : INNER 41 + 부서 없는애들 5명 = 46건
--RIGHT JOIN 결과:INNER 41 + 사원없는 부서2 = 43건 
--FULL JOIN  결과 : INNER 41 + 5 + 2 = 48건
-----------------------------------------------------------------------------
-- # SELF JOIN
-- 1. 하나의 테이블에서 자기 자신의 테이블끼리 조인하는 기법입니다.
-- 2. 자기 자신 테이블에서 pk와 fk로 동등조인합니다.
-----------------------------------------------------------------------------
-- 예)직속상사 사번 옆에 이름을 찍기 위해 self 조인 필요~!
SELECT 
    A.emp_no "사원번호",
    A.emp_nm "사원명",
    A.addr "사원주소",
    A.direct_manager_emp_no "직속 상사 사번",
    B.emp_nm "상사명",
    B.addr "상사주소"
FROM tb_emp A
INNER JOIN tb_emp B
ON a.direct_manager_emp_no = b.emp_no
ORDER BY A.emp_no
;
-----------------------------------------------------------------------------
--상사 없는 애들도 찍는 법
SELECT 
    A.emp_no "사원번호",
    A.emp_nm "사원명",
    A.addr "사원주소",
    A.direct_manager_emp_no "직속 상사 사번",
    B.emp_nm "상사명",
    B.addr "상사주소"
FROM tb_emp A
LEFT JOIN tb_emp B
ON a.direct_manager_emp_no = b.emp_no
ORDER BY A.emp_no
;
-----------------------------------------------------------------------------
-- 모든 데이터 필터링은 DB이다.!
-----------------------------------------------------------------------------
