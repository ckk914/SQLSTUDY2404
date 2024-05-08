

--------------------------------------------------------------------------------------------
-- 사원의 first_name , employee_id, department_id, department_nm
--------------------------------------------------------------------------------------------
SELECT
     E.employee_id,
     e.first_name,
     department_id,  --식별자 제거
     d.department_name
     FROM employees E
     INNER JOIN departments D
     using (department_id,manager_id)  --using 두개 처리 앞에 식별자 제거 
     order by e.employee_id   --오름차순 정렬
     ;
      -- l l  위아래 같은 상태 
--------------------------------------------------------------------------------------------
     --공통 조인 조건 이 2개인 경우임 .
     SELECT
     E.employee_id,
     e.first_name,
     department_id,
     d.department_name
     FROM employees E
     NATURAL JOIN departments D
     order by e.employee_id   --오름차순 정렬
     ;
--------------------------------------------------------------------------------------------
-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
--------------------------------------------------------------------------------------------
select 
a.first_name,
a.last_name,
a.department_id,
b.department_name
from employees a INNER JOIN departments b
on a.department_id = b.department_id
;
--------------------------------------------------------------------------------------------
-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
--------------------------------------------------------------------------------------------
select 
a.first_name,
a.last_name,
department_id,
b.department_name
from employees a natural JOIN departments b
;
--------------------------------------------------------------------------------------------
-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
--------------------------------------------------------------------------------------------
select 
a.first_name,
a.last_name,
department_id,
b.department_name
from employees a INNER JOIN departments b
using(department_id)
;
--------------------------------------------------------------------------------------------
-- 4. employees테이블과 departments테이블과 locations 테이블을 
--      join하여 employee_id, first_name, department_name, city를 조회하세요
--------------------------------------------------------------------------------------------
SELECT
a.employee_id,
a.first_name,
b.department_name,
c.city
from employees a INNER JOIN departments b
using(department_id)
INNER JOIN locations c
using(location_id)
;
--------------------------------------------------------------------------------------------
-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
--------------------------------------------------------------------------------------------
select 
a.first_name,
a.last_name,
b.job_title
from employees a INNER JOIN jobs b
on a.job_id = b.job_id
;
--------------------------------------------------------------------------------------------
-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
--부서별 : group by 로 구한다~!
--------------------------------------------------------------------------------------------
select 
b.department_name,
MAX(a.salary)
from employees a INNER JOIN departments b
on a.department_id = b.department_id
group by b.department_name;
--------------------------------------------------------------------------------------------
-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
--------------------------------------------------------------------------------------------
select 
a.job_id,
b.job_title,
Avg(a.salary)
from employees a INNER JOIN jobs b
on a.job_id = b.job_id
group by b.job_title,a.job_id
;
--------------------------------------------------------------------------------------------
SELECT 
    E.job_id,
    J.job_title,
    AVG(E.salary)
FROM employees E, jobs J
WHERE E.job_id = J.job_id
GROUP BY E.job_id, J.job_title
;





