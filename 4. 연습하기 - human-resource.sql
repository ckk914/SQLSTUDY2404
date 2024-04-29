
SELECT * FROM employees;

-- 실습 1 
-- 1. employees테이블에서 first_name, last_name, salary를 조회하세요.
 SELECT first_name, last_name, salary FROM employees;
-- 2. departments테이블에서 department_id, department_name, manager_id, location_id를 조회하세요.
  SELECT department_id, department_name, manager_id, location_id FROM departments;
-- 3. employees테이블에서 first_name의 별칭을 '이름', salary의 별칭을 '급여'로 조회하세요.
SELECT first_name AS "이름",
            SALARY AS "급여"
            FROM employees;
            
-- 4. employees테이블의 사원정보를 first_name + last_name + '의 급여는 $' + salary + '입니다.' 의 형태로 연결하여 '사원정보' 라는 별칭을 부여하여 하나의 컬럼으로 조회하세요.
  SELECT 
  first_name || last_name|| '의 급여는'||salary||'입니다' as"사원정보"
   FROM employees;
-- 5. employees테이블에서 department_id를 중복을 제거하여 조회하세요.
        SELECT DISTINCT
        department_id
        FROM employees;
-- 실습 2
-- 1. employees테이블에서 job_id가 'IT_PROG'인 사원의 first_name, job_id, department_id를 조회하세요.
SELECT first_name, job_id, department_id
FROM employees
WHERE job_id= 'IT_PROG'
;
-- 2. employees테이블에서 last_name이 'King'인 사원의 first_name, last_name, hire_date를 조회하세요.
SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name= 'King'
;
-- 3. employees테이블에서 salary가 15000보다 크거나 같은 사원의 first_name, salary, hire_date를 조회하세요.
SELECT first_name, salary, hire_date
FROM employees
WHERE salary >=15000
;
-- 4. employees테이블에서 salary가 10000과 12000 사이에 있는 사원의 first_name, salary를 조회하세요.
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000
;
-- 5. employees테이블에서 manager_id가 101, 102, 103중에 속하는 사원의 first_name, salary, manager_id를 조회하세요.
SELECT first_name, salary, manager_id
FROM employees
WHERE manager_id IN (101,102,103)
;
-- 6. employees테이블에서 job_id가 'IT_PROG', 'FI_MGR'중에 포함되지 않는 사원의 first_name, job_id를 조회하세요.
SELECT first_name, job_id
FROM employees
WHERE job_id != 'IT_PROG' AND Job_id != 'FI_MGR'
;
-- 7. employees테이블에서 job_id가 'IT'로 시작하는 사원의 first_name, last_name, job_id를 조회하세요.
SELECT first_name, job_id
FROM employees
WHERE job_id like 'IT%'
;
-- 8. employees테이블에서 email의 두번째 글자가 A인 사원의 first_name, email을 조회하세요.
SELECT first_name, email
FROM employees
WHERE email like '_A%'
;
-- 9. employees테이블에서 manager_id가 null인 사원의 first_name, manager_id를 조회하세요.
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL
;
-- 10. employees테이블에서 commission_pct가 null이 아닌 사원의 first_name, job_id, commission_pct를 조회하세요.
SELECT first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
;
-- 11. employees테이블에서 job_id가 'IT_PROG'이고 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 5000
;
— 12. employees테이블에서 job_id가 'IT_PROG'이거나 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' OR salary >= 5000
;
— 13. employees테이블에서 job_id가 'IT_PROG'이거나 'FI_MGR'이면서 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT first_name, job_id, salary
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'FI_MGR') AND salary >= 5000
;