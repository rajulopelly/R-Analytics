create table worker(
worker_id int not null PRIMARY KEY ,
first_name varchar(25),
last_nameb char(25),
salary int,
joiningdate datetime,
department char(25)
);

select [dbo].[Split_On_Upper_Case](ENAME) from [dbo].[EMP]

select*from [dbo].[EMP] where job in('SALESMAN','MANAGER')

select job,sal,deptno from [dbo].[EMP] where sal between 1500 and 2600

select* from EMP
select [DEPTNO],count(*) from emp group by deptno

select distinct([DEPTNO]),[DEPTNO] from EMP

select [DEPTNO],sum(sal) from emp group by [DEPTNO]

select [DEPTNO],avg(sal) from emp group by DEPTNO order by avg(SAL)

select min(sal),max(sal) from emp where deptno=30 group by job

select [DEPTNO],count(DEPTNO) from[dbo].[EMP] group by [DEPTNO] having COUNT([DEPTNO])>3

select [DEPTNO],avg(sal) from [dbo].[EMP] group by deptno having avg(sal)>1000

select [DEPTNO],avg(sal) from [dbo].[EMP] where JOB='CLERK' group by deptno

 create table raju(
 a varchar(221),
 id int not null unique,
 primary key(id)


 select [dbo].[Dept].[DEPTNO],[dbo].[Dept].[LOC],[dbo].[EMP].[JOB],[dbo].[EMP].[SAL] 
 from [dbo].[Dept],[dbo].[EMP]
 where [dbo].[Dept].[DEPTNO]=[dbo].[EMP].[DEPTNO] 

 select [dbo].[EMP].EMPNO,[dbo].[EMP].DEPTNO,[dbo].[EMP].DEPTNO,[dbo].[Dept].DEPTNO,[dbo].[Dept].DNAME,[dbo].[Dept].LOC
 from [dbo].[Dept],[dbo].[EMP]
 where [dbo].[Dept].[DEPTNO]=[dbo].[EMP].[DEPTNO] and [JOB]='CLERK'

 select [EMPNO],ename,[SAL],JOB from [dbo].[EMP] where job='MANAGER'

 select e.ename 'empname', m.ename 'manager name' 
 from emp e, emp m
 where e.mgr=m.empno


select e.[EMPNO],e.[JOB],e.[SAL],d.[DEPTNO],d.[DNAME],d.[LOC] 
from emp e right join dept d 
on(e.DEPTNO=d.DEPTNO)


select[dbo].[Dept].DNAME,[dbo].[Dept].DEPTNO,[dbo].[EMP].ENAME,[dbo].[EMP].JOB,[dbo].[EMP].SAL
from [dbo].[Dept] left join [dbo].[EMP]
on([dbo].[Dept].DEPTNO=[dbo].[EMP].DEPTNO)

select [EMPNO],[ENAME],[SAL],[JOB] from [dbo].[EMP] where sal<(select sal from emp where ename='turner') and JOB='clerk'

select [DEPTNO],[ENAME],[JOB] from emp where DEPTNO=(select [DEPTNO] from emp where ename='ford') and 
job in (select job from emp where deptno=(select DEPTNO from dept where dname='sales'))

select [ENAME],[JOB],min([SAL]) from [dbo].[EMP] where sal=(select min(sal) from emp)

select [EMPNO],[SAL][DEPTNO]from[dbo].[EMP] where sal in (select min(sal) from emp group by deptno)
 
select [JOB],[SAL],[ENAME] from emp where sal in (select min(sal) from emp where job='clerk')

select [JOB],[SAL],[ENAME] from emp where sal>any (select sal from emp where  job='MANAGER')

select [JOB],[SAL],[ENAME] from emp where sal<some(select sal from emp where  job='SALESMAN')

select [JOB],[SAL],[ENAME] from emp where sal<any(select sal from emp where  job='SALESMAN')

select [SAL],[DEPTNO],[ENAME] 
from emp 
where deptno in (select deptno from emp group by deptno)
and sal in (select max(sal) from emp group by deptno) and deptno<>10

select [EMPNO],[JOB],[SAL],[DEPTNO] from emp where deptno in (select deptno from emp group by deptno)and sal in
(select max(sal) from emp group by deptno) and deptno<>10



select e.empcount,d.deptcount from(select count(*) empcount from emp)e,(select count(*) deptcount from dept)d

select ename,sal,(select max(sal) from emp) "org total sal" from emp

select a.deptno "department number",
(a.numemp/b.totalcount)*100 "%employees",
(a.salsum/b.totalsal)*100 "%salary"
from (select deptno,count(*) numemp,sum(sal) salsum from group by dept no)a,(select count(*) totalcount,sum(sal) totalsal from emp)b

select[EMPNO],[ENAME],[JOB],[SAL],[DEPTNO] from emp where deptno=10 and exists (select count(*) from emp where deptno=10
and job='analyst' )

select job from EMP where deptno=10 minus select job from emp where deptno=20

create user userA identified by raju123
grant connect to userA

select [ENAME],[JOB],[SAL],
sal*0.12+sal*0.35+sal*0.25 gross from [dbo].[EMP]


select [ENAME],[JOB],[SAL],sal/sum(sal)*100 salary
from emp ,(select salary from emp) 
group by deptno, salary from [dbo].[EMP]


SELECT [EMPNO],[JOB],[SAL],[DEPTNO] FROM EMP CONNECT BY PRIOR EMPNO=MGR

SELECT  [EMPNO],[JOB],[SAL],[DEPTNO] FROM EMP 
START WITH JOB='PRESIDENT'

select [DEPTNO],[JOB],sum(sal) from EMP group by cube(deptno,job)


select [DEPTNO],[JOB],sal from EMP

select [EMPNO],[ENAME],[JOB] from emp where [JOB]='MANAGER'





