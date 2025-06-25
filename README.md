# 📘 Task 2 – Data Insertion & Null Handling (SQL Developer Internship)

## 📌 Overview
This project is a continuation of the Library Management System database built in Task 1. The objective is to populate the schema using various `DML` operations and to practice handling `NULL` values, `DEFAULT` constraints, and conditional updates/deletions.

---

## 🧾 What’s Included

- Insertions into:
  - `Authors`
  - `Books` (including NULL AuthorID)
  - `Members` (with DEFAULT JoinDate)
  - `Loans` (including a loan with NULL ReturnDate)
- Use of:
  - `INSERT INTO`
  - `UPDATE`
  - `DELETE`
  - `NULL` and `DEFAULT`
- Conditional logic using `WHERE` clause

---

## 🔧 Key Concepts Demonstrated

| Concept                | Example Applied                             |
|------------------------|---------------------------------------------|
| Partial Insert         | `INSERT INTO Books (Title)`                 |
| NULL Handling          | AuthorID set to `NULL`                      |
| DEFAULT Value          | `JoinDate` defaults to `CURRENT_DATE`       |
| UPDATE with Condition  | `UPDATE Members SET JoinDate = ... WHERE`   |
| DELETE with Condition  | `DELETE FROM Loans WHERE BookID = 3`        |

---

## 🧰 Tools Used

- MySQL 9.3 Command Line Client
- GitHub for version control
- DB schema from Task 1

---

## 📁 Files in This Repository

| File Name     | Description                                     |
|---------------|-------------------------------------------------|
| `data.sql`    | SQL script for INSERT, UPDATE, DELETE operations |
| `README.md`   | Documentation for Task 2                        |

---

## 🧪 How to Run

1. Open MySQL 9.3 Command Line Client.
2. Ensure the `LibraryDB` database exists:
   ```sql
   USE LibraryDB;
