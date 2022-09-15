
-- pipe || = and
-- "" colunm title
-- '' value in row
-- , separa colunas
-- || cocatena
-- DISTINCTY rm duplicate
-- ORDER BY DESC, ASC
-- commit salva os dados
-- SELECT TEXT FROM V$SQL; powers admnistrator see ALL querys runned
SELECT * FROM tablins;
SELECT nome FROM tablins;
DESCRIBE tablins;
--rotulo / alias / label / literal
SELECT nome, salario, (salario + 100) * 12 "New Salary", TRUNC((salario + 100) / salario,4) || '%' 'Percent' FROM tablins;
SELECT nome || '@fiap.com.br' "email" FROM tablins;
SELECT DISTINCT gerente FROM tablins;
SELECT nome, salario FROM tablins ORDER BY salario DESC, ASC

SELECT * FROM EMP
WHERE deptno = '10';
/*finish with a*/
WHERE deptno = '%A';
/*init with a*/
WHERE deptno = 'A%';

/*1 = x, 2 = '\', 3 = x, random='A'*/
WHERE deptno = '_\_%A%' ESCAPE '\';

WHERE deptno NOT BETWEEN 1000 AND 2000;

WHERE SAL > &VALUE;
WHERE SAL > 2000 AND
    (JOB = 'PRESIDENT' OR
    JOB = 'CLERK');
    
WHERE SAL > 2000
ORDER BY SAL ASC/DESC;

SELECT 'MARIO' FROM DUAL;
SELECT LOWER('MARIO') FROM DUAL;
SELECT UPPER('mArIo') FROM DUAL;
SELECT INITCAP('MARIO KART') FROM DUAL;
SELECT SAL FROM EMP WHERE LOWER(ENAME) = LOWER('blake');
SELECT 'MARIO' || 'KART' FROM DUAL;
SELECT CONCAT (INITCAP('MARIOR '), INITCAP('KART') FROM DUAL)
SELECT SUBSTR('MARIO',1,3) FROM DUAL;
SELECT SUBSTR('MARIO',-1,1) FROM DUAL;
SELECT LENGTH('MARIO KART') FROM DUAL;
SELECT INSTR('MARIO KART', ' ') FROM DUAL;
SELECT INSTR('MARIO KART',(INSTR('MARIO KART', ' ')+1), 4) FROM DUAL;
SELECT LPAD(123,10,'*') FROM DUAL;// substitui cada item por asteristico
