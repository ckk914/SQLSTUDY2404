--DDL 정의어 CREATE 테이블 생성
CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25) NOT NULL UNIQUE,
    phone_number VARCHAR2(15),
    hire_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    salary NUMBER(8, 2),
    commission_pct NUMBER(2, 2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);



--------------------------------------------------------------------------------------
--drop : 테이블 제거, 강력한 제거
DROP TABLE TB_EMP_COPY;
--------------------------------------------------------------------------------------
--테이블 복사
CREATE TABLE TB_EMP_COPY AS SELECT *FROM TB_EMP;
--------------------------------------------------------------------------------------
--조회
SELECT * FROM tb_emp_copy;
--------------------------------------------------------------------------------------
--TRUNCATE : 휴지통 비우기 - 구조는 남기고 안에 데이터만 삭제
--                     테이블이 생성된 초기 상태로 돌아간다 
TRUNCATE TABLE TB_EMP_COPY;
--------------------------------------------------------------------------------------
--ALTER문으로 제약조건 추가하기
--stu_num에 깜빡하고 primaryKEY를 안 걸었을때
ALTER TABLE TBL_SCORE 
ADD CONSTRAINT pk_tbl_score 
PRIMARY KEY (stu_num);
--------------------------------------------------------------------------------------
--pk 제거할때
ALTER TABLE tbl_score
DROP CONSTRAINT pk_tbl_score;
--------------------------------------------------------------------------------------

