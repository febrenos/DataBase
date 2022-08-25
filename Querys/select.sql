SELECT * FROM EMP
WHERE deptno = '10';
/*finish with a*/
WHERE deptno = '%A';
/*init with a*/
WHERE deptno = 'A%';

/*1 = x, 2 = '\', 3 = x, random='A'*/
WHERE deptno = '_\_%A%' ESCAPE '\';

WHERE deptno NOT BETWEEN 1000 AND 2000;

/*solicit value*/
WHERE SAL > &VALUE;

WHERE SAL > 2000 AND
    (JOB = 'PRESIDENT' OR
    JOB = 'CLERK');
    
WHERE SAL > 2000
ORDER BY SAL ASC/DESC;
