Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 9.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use librayDB;
ERROR 1049 (42000): Unknown database 'libraydb'
mysql> use LibraryDB;
Database changed
mysql> desc tables;
ERROR 1146 (42S02): Table 'librarydb.tables' doesn't exist
mysql> show tables;
+---------------------+
| Tables_in_librarydb |
+---------------------+
| authors             |
| books               |
| loans               |
| members             |
+---------------------+
4 rows in set (0.099 sec)

mysql> desc authors;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| AuthorID | int          | NO   | PRI | NULL    | auto_increment |
| Name     | varchar(100) | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
2 rows in set (0.065 sec)

mysql> INSERT INTO Authors (Name) VALUES
    -> ('R.K. Narayan'),
    -> ('J.K. Rowling'),
    -> ('George Orwell');
Query OK, 3 rows affected (0.045 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desc books;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| BookID   | int          | NO   | PRI | NULL    | auto_increment |
| Title    | varchar(250) | NO   |     | NULL    |                |
| AuthorID | int          | YES  | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.059 sec)

mysql> INSERT INTO Books (Title, AuthorID) VALUES
    -> ('The Guide', 1),
    -> ('Harry Potter and the Philosopher\'s Stone', 2),
    -> ('1984', 3),
    -> ('Untitled Manuscript', NULL);  -- Book without an author yet
Query OK, 4 rows affected (0.058 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc loans;
+------------+------+------+-----+---------+----------------+
| Field      | Type | Null | Key | Default | Extra          |
+------------+------+------+-----+---------+----------------+
| LoanID     | int  | NO   | PRI | NULL    | auto_increment |
| BookID     | int  | YES  | MUL | NULL    |                |
| MemberID   | int  | YES  | MUL | NULL    |                |
| LoanDate   | date | NO   |     | NULL    |                |
| ReturnDate | date | YES  |     | NULL    |                |
+------------+------+------+-----+---------+----------------+
5 rows in set (0.068 sec)

mysql> desc members;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| MemberID | int          | NO   | PRI | NULL    | auto_increment |
| Name     | varchar(100) | NO   |     | NULL    |                |
| JoinDate | date         | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.023 sec)

mysql> INSERT INTO Members (Name, JoinDate) VALUES
    -> ('Amit Sharma', '2024-01-15'),
    -> ('Sanya Mehta', DEFAULT),
    -> ('Rajiv Menon', '2023-11-25');
Query OK, 3 rows affected (0.049 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES
    -> (1, 1, '2024-02-01', '2024-02-15'),
    -> (2, 2, '2024-03-01', NULL),           -- Still borrowed
    -> (3, 3, '2024-04-01', '2024-04-20');
Query OK, 3 rows affected (0.073 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from authors;
+----------+---------------+
| AuthorID | Name          |
+----------+---------------+
|        1 | R.K. Narayan  |
|        2 | Nikhil Gupta  |
|        3 | Jems Goslin   |
|        4 | R.K. Narayan  |
|        5 | J.K. Rowling  |
|        6 | George Orwell |
+----------+---------------+
6 rows in set (0.017 sec)

mysql> select * from books;
+--------+------------------------------------------+----------+
| BookID | Title                                    | AuthorID |
+--------+------------------------------------------+----------+
|      1 | Blackbook                                |        1 |
|      2 | Python                                   |        2 |
|      3 | untitled Manuscript                      |     NULL |
|      4 | The Guide                                |        1 |
|      5 | Harry Potter and the Philosopher's Stone |        2 |
|      6 | 1984                                     |        3 |
|      7 | Untitled Manuscript                      |     NULL |
+--------+------------------------------------------+----------+
7 rows in set (0.009 sec)

mysql> select * from members;
+----------+----------------+------------+
| MemberID | Name           | JoinDate   |
+----------+----------------+------------+
|        1 | Abhishek Mane  | 2024-01-15 |
|        2 | Shankar Mane   | NULL       |
|        3 | Vaibhav Sapate | 2023-11-25 |
|        4 | Amit Sharma    | 2024-01-15 |
|        5 | Sanya Mehta    | NULL       |
|        6 | Rajiv Menon    | 2023-11-25 |
+----------+----------------+------------+
6 rows in set (0.028 sec)

mysql> select * from loans;
+--------+--------+----------+------------+------------+
| LoanID | BookID | MemberID | LoanDate   | ReturnDate |
+--------+--------+----------+------------+------------+
|      1 |      1 |        1 | 2024-02-01 | 2024-02-15 |
|      2 |      2 |        2 | 2024-03-01 | NULL       |
|      3 |      3 |        3 | 2024-04-01 | 2024-04-20 |
|      4 |      1 |        1 | 2024-02-01 | 2024-02-15 |
|      5 |      2 |        2 | 2024-03-01 | NULL       |
|      6 |      3 |        3 | 2024-04-01 | 2024-04-20 |
+--------+--------+----------+------------+------------+
6 rows in set (0.010 sec)

mysql> UPDATE Books
    -> SET AuthorID = 1
    -> WHERE Title = 'Untitled Manuscript';
Query OK, 2 rows affected (0.073 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE Members
    -> SET JoinDate = '2024-06-01'
    -> WHERE Name = 'Sanya Mehta';
Query OK, 1 row affected (0.053 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Books WHERE Title = 'Untitled Manuscript';
+--------+---------------------+----------+
| BookID | Title               | AuthorID |
+--------+---------------------+----------+
|      3 | untitled Manuscript |        1 |
|      7 | Untitled Manuscript |        1 |
+--------+---------------------+----------+
2 rows in set (0.015 sec)

mysql> SELECT * FROM Members WHERE Name = 'Abhishek Mane';
+----------+---------------+------------+
| MemberID | Name          | JoinDate   |
+----------+---------------+------------+
|        1 | Abhishek Mane | 2024-01-15 |
+----------+---------------+------------+
1 row in set (0.012 sec)

mysql> DELETE FROM Loans
    -> WHERE BookID = 3 AND MemberID = 3;
Query OK, 2 rows affected (0.118 sec)

mysql> SELECT * FROM Loans;
+--------+--------+----------+------------+------------+
| LoanID | BookID | MemberID | LoanDate   | ReturnDate |
+--------+--------+----------+------------+------------+
|      1 |      1 |        1 | 2024-02-01 | 2024-02-15 |
|      2 |      2 |        2 | 2024-03-01 | NULL       |
|      4 |      1 |        1 | 2024-02-01 | 2024-02-15 |
|      5 |      2 |        2 | 2024-03-01 | NULL       |
+--------+--------+----------+------------+------------+
4 rows in set (0.012 sec)

mysql> INSERT INTO Books (Title, AuthorID)
    -> VALUES ('Mystery Book', NULL);
Query OK, 1 row affected (0.076 sec)

mysql> SELECT * FROM Books WHERE Title = 'Mystery Book';
+--------+--------------+----------+
| BookID | Title        | AuthorID |
+--------+--------------+----------+
|      8 | Mystery Book |     NULL |
+--------+--------------+----------+
1 row in set (0.010 sec)

mysql>