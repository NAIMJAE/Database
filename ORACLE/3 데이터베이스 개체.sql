/*
    ��¥ : 2024/03/06
    �̸� : ������
    ���� : 3. �����ͺ��̽� ��ü
*/

-- �ǽ� 3-1 : ������ �ð� ��ȸ
-- ��ü ���� ��ȸ
SELECT * FROM DIC;

-- ���̺� ��ȸ (���� ����� ����)
SELECT TABLE_NAME FROM USER_TABLES;

-- ��ü ���̺� ��ȸ (���� ����� ����)
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- ��ü ���̺� ��ȸ (system �����ڸ� ����)
SELECT * FROM DBA_TABLES;

-- ��ü ����� ��ȸ(system �����ڸ� ����)
SELECT * FROM DBA_USERS;