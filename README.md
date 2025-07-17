# 📚 Library Management System — SQL/PLSQL Project

### Author: Akshay Machivale  
### Created: July 2025  
### Encoding: UTF-8  

---

## 📝 Project Overview

This project simulates a basic **Library Management System**, built entirely using **Oracle SQL and PL/SQL**.  
It demonstrates database design, business logic implementation via procedures, fine calculation, and error handling.  

This project is meant for learning purposes and can be used to practice SQL/PLSQL concepts.

---

## 🗂️ Database Structure

| Table Name           | Purpose                                  |
|----------------------|------------------------------------------|
| `books`             | Stores book details                      |
| `book_copies`       | Manages individual book copies and status|
| `members`           | Stores library member details            |
| `issue_transactions`| Logs issued book transactions            |
| `return_transactions`| Records returns and fines                |
| `error_logs`        | Stores error logs from procedures        |

---

## 🛠️ Procedures & Functions Implemented

| Name                        | Purpose                                 |
|------------------------------|-----------------------------------------|
| `issue_book`                | Issues a book to a member with checks  |
| `return_book`               | Handles book return and auto fine calc |
| `return_damaged_or_lost_book`| Processes damaged/lost book return with manual fine |
| `update_book_status`        | Allows manual update of a book copy's status |
| `calculate_fine` (Function) | Calculates fine based on due date      |
| `log_error`                 | Logs errors into `error_logs` table    |

---

## 📄 Book Copy Statuses Used

| Status        | Description                                    |
|---------------|------------------------------------------------|
| `Available`  | Book is in library and can be issued          |
| `Issued`     | Book is issued to a member                    |
| `Lost`       | Marked lost by member or librarian            |
| `Damaged`    | Book is damaged, may not be issued            |
| `Reserved`   | Reserved (planned for future feature)         |
| `Under Repair`| Temporarily unavailable                       |

---

## 🧩 Key Features
- ✅ Book issue with duplicate check and status update  
- ✅ Return with fine calculation based on delay  
- ✅ Manual return handling for lost/damaged books with fines  
- ✅ Error handling and logging using centralized table  
- ✅ Manual status management by librarian  

---

## 🧪 Testing & Usage

- 🗃️ Clone or download this repository  
- ⚙️ Execute SQL scripts in order:
  1. Create Tables  
  2. Insert your own Sample Data (members, books, copies)  
  3. Create Procedures & Functions  
- 📝 Test the procedures using your own test cases  
- 🔎 Check status updates and transactions by querying the tables  

---

## 📢 Note for Testers

> This project does not include fixed sample data to encourage you to test with your own scenarios.  
> You are encouraged to insert test data based on real-world examples like issuing books, returning late, or handling damaged books.  

---

## 🛡️ License  
MIT License — Use freely for educational or personal projects.

---

