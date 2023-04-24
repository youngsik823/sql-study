SELECT * FROM tb_emp;
-- 테이블(엔터티) 생성
-- 성적정보 저장 테이블

CREATE TABLE tbl_score (
	name VARCHAR2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK (kor > 0 AND kor <= 100),
	eng NUMBER(3) NOT NULL CHECK (eng > 0 AND eng <= 100),
	math NUMBER(3) NOT NULL CHECK (math > 0 AND math <= 100),
	total NUMBER(3) NULL,
	avarage NUMBER(5, 2),
	grade CHAR(1),
	stu_num NUMBER(6),
	--PK 거는법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)
);

-- 테이블 생성 후 PK 적용하기
ALTER TABLE tbl_score
ADD CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num);

-- 컬럼 추가하기
ALTER TABLE TBL_SCORE 
ADD (sci NUMBER(3) NOT NULL);

-- 컬럼 제거하기
ALTER TABLE TBL_SCORE 
DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE TB_EMP_COPY 
AS SELECT * FROM TB_EMP;

-- 복사 테이블 조회
SELECT * FROM TB_EMP_COPY;
SELECT * FROM TB_EMP;

-- drop table
DROP TABLE TB_EMP_COPY;

-- truncate table
-- 구조는 냅두고 내부 데이터만 전체 삭제
TRUNCATE TABLE TB_EMP_COPY;

-- 예시테이블
CREATE TABLE goods (
	id NUMBER(6) PRIMARY KEY,
	g_name VARCHAR2(10) NOT NULL,
	price NUMBER(10) DEFAULT 1000,
	reg_date DATE 
);



-- INSERT 
INSERT INTO goods (id, g_name, price, reg_date)
VALUES (1, '선풍기', '120000', SYSDATE);

INSERT INTO goods (id, g_name, reg_date)
VALUES (2, '달고나', SYSDATE);

-- 컬럼 쓰는게 좋다.
INSERT INTO goods (g_name, id, price)
VALUES ('후리', 3, 500);

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함.
-- 이거 절때 쓰지마!
INSERT INTO goods
VALUES (4, '세탁기', 10000, SYSDATE);

INSERT INTO goods (g_name, id, price)
VALUES 
	('후리1', 5, 500),
	('후리2', 6, 1500),
	('후리3', 7, 5300);


-- 수정 UPDATE 
UPDATE goods 
SET g_name = '냉장고'
WHERE id = 3;

UPDATE goods 
SET g_name = '콜라', price = 3000
WHERE id = 2;

-- 모든 price가 9999가 된다.
UPDATE goods 
SET price = 9999;


-- 행을 삭제 DELETE 
DELETE FROM goods
WHERE id = 3;


-- 모든 행 삭제
DELETE FROM goods;


-- SELECT 조회
SELECT 
		CERTI_CD 
		,CERTI_NM 
		, ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT ALL 
		CERTI_NM 
		, ISSUE_INSTI_NM
FROM TB_CERTI;

-- 중복 제거 distinct
SELECT DISTINCT 
		ISSUE_INSTI_NM
FROM TB_CERTI;

-- 모든 컬럼 조회
-- 실무에서는 사용하지 마세요
SELECT 
	*
FROM TB_CERTI;

-- 열 별칭 부여 (alias)
-- AS는 생략가능

SELECT 
	EMP_NM AS "사원명", -- 띄어쓰기 없으면 ""생략 가능
	ADDR AS "주소"
FROM TB_EMP; 

-- 문자열 연결하기
-- 오라클은 문자열을 || 로 이어지게 한다
SELECT 
	CERTI_NM || '(' || ISSUE_INSTI_NM || ')' AS "자격증 정보" 
FROM TB_CERTI;


SELECT * FROM goods;

