
--테이블 생성
--DEFAULT 1000  => 데이터를 삽입하지 않았을때 1000으로 세팅한다.
CREATE TABLE goods (
 ID NUMBER(6) PRIMARY KEY,
 good_name VARCHAR2(10) NOT NULL,
 PRICE NUMBER(10) DEFAULT 1000,
 REG_DATE DATE
);

--INSERT
--SYSDATE = 현재 시간
INSERT INTO GOODS 
    (Id,good_name, price, reg_date)
    VALUES
     (1,'선풍기',120000,SYSDATE);
--INSERT 날짜는 '' 붙여야함
INSERT INTO GOODS 
    (Id,good_name, price, reg_date)
    VALUES
     (1,'선풍기',120000,'20190213');
     
--INSERT - 2 
INSERT INTO GOODS 
    (Id,good_name, price, reg_date)
    VALUES
     (2,'세탁기',2000000,SYSDATE);
--INSERT - 3      PRICE 없어도 DEFAULT 1000 들어감
     INSERT INTO GOODS 
    (Id,good_name, reg_date)
    VALUES
     (3,'달고나',SYSDATE);
     --INSERT - 4  sysdate안써서  null 들어감
     INSERT INTO GOODS 
    (Id,good_name)
    VALUES
     (4,'계란');
          --INSERT - 5  필드 속성 위치 바꿔도 맞게 써주면 상관없음!
          -- '' 안에 숫자써도 암묵적 형변환 일어남
     INSERT INTO GOODS 
    (good_name,Id, reg_date,price)
    VALUES
     ('점퍼',5,sysdate,'49000');
     --INSERT - 6
     --컬럼명 생략 시 테이블 구조 <<순서대로>> 자동 기입
     INSERT INTO GOODS 
    VALUES
     (6,'노트북',1000000,SYSDATE);
     --UPDATE
     --<<조건 안쓰면>> 전체수정되어버리니 주의
     UPDATE goods
     SET good_name = '에어컨'
     WHERE ID = 1
     ;
     --UPDATE -> 전체 가격 바뀜
     UPDATE goods
     SET PRICE = 99999
     ;
     -- 잘못 입력해도 취소는 가능
     
     --UPDATE 1 -> 전체 가격 바뀜
     UPDATE Tbl_user
     SET age= age+1;
     ;
     --UPDATE 2 - ID값 변경
     UPDATE goods
     SET ID = 11
     WHERE ID =4;
     --UPDATE
     --이거 안됨 -> GOOD_NAME이 NOT NULL 이라서
          UPDATE goods
     SET GOOD_NAME = NULL
     WHERE ID =6;
     --UPDATE 
     --WHERE 절에는 조건 넣기
     UPDATE GOODS
     SET GOOD_NAME = '청바지',
           PRICE = 299000
    WHERE ID = 3;
    
    --DELETE문 (한줄 삭제)
    DELETE FROM GOODS 
    WHERE ID=11;
    
    --DELETE
    --조건 없이 DELETE하면 전체 삭제됨
    -- 다만 이 문법은 복구가 가능함
    DELETE FROM GOODS;
    --복구 불가 삭제 방법
    --굉장히 위험한 명령어 
    TRUNCATE TABLE GOODS;
    --데이터 +테이블 삭제
    -- 가장 위험한 명령어
    DROP TABLE GOODS;
    
    DELETE FROM GOODS
    WHERE ID = 5;
    
     --조회
     SELECT * FROM GOODS;
     
     
     --SELECT 기본
     
     SELECT
     certi_cd,
     certi_nm,
     issue_insti_nm
     FROM tb_certi;
     --순서 바뀌어도 상관없음
     SELECT
     certi_nm,
     certi_cd,
     issue_insti_nm
     FROM tb_certi;
     --DISTINCT : 중복 제거
     -- DISTINCT 위치 에 원래 기본값이 ALL이다~!
     SELECT DISTINCT
        issue_insti_nm
     FROM tb_certi;
     --ALL  :기본값임~!
     SELECT ALL
        issue_insti_nm
     FROM tb_certi;
     
     --모든 태그 조회(순서대로)
     --실무에서는 *을 잘 안쓰고
     --일일이 나열한다.
     SELECT * FROM tb_certi;
     --열 별칭 부여
     --AS 쓰면 속성 이름이 AS 뒤에껄로 바뀐다~!
     -- AS 생략 가능
     -- 쌍따옴표도 생략 가능
     --별칭에 띄어쓰기 있을땐 따옴표 없애지 말자
     select 
     EMP_NM 사원,
     ADDR "거주지 주소"
     FROM TB_EMP;         
     
     --문자열 결합하기
     --'내용' ||  쓰면 앞부분에 결합됨~!
     SELECT 
     '자격증:' || certi_nm AS "자격증 정보"
     FROM tb_certi;
     
     --필드 결합 ,필드 별칭 수정
     SELECT 
     certi_nm || ' (' || issue_insti_nm|| ')' AS "자격증"
     FROM TB_CERTI;
     
     