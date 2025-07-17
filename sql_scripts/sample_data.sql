-- ================================================
-- Sample Data for Library Management System
-- Created by Akshay — July 2025
-- ================================================

-- 1 Insert Books
INSERT INTO books (title, author, publisher, published_year)
VALUES ('SQL Fundamentals', 'John Smith', 'TechPress', 2019);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('PL/SQL Programming', 'Scott Adams', 'CodeHouse', 2021);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('Oracle Advanced', 'Maria Lee', 'DataWorks', 2020);

--------------------------------------------------

-- 2 Insert Book Copies (for each book)
-- Copies for Book ID 1
INSERT INTO book_copies (book_id, status) VALUES (1, 'Available');
INSERT INTO book_copies (book_id, status) VALUES (1, 'Available');
-- Copies for Book ID 2
INSERT INTO book_copies (book_id, status) VALUES (2, 'Available');
-- Copies for Book ID 3
INSERT INTO book_copies (book_id, status) VALUES (3, 'Available');
INSERT INTO book_copies (book_id, status) VALUES (3, 'Available');
INSERT INTO book_copies (book_id, status) VALUES (3, 'Available');

--------------------------------------------------

-- 3 Insert Members
INSERT INTO members (name, email, contact)
VALUES ('Akshay Machivale', 'akshay@example.com', '9876543210');

INSERT INTO members (name, email, contact)
VALUES ('John Doe', 'john.doe@example.com', '9123456780');

INSERT INTO members (name, email, contact)
VALUES ('Jane Smith', 'jane.smith@example.com', '9012345678');

--------------------------------------------------

-- 4 Extra Books for Sample Data
INSERT INTO books (title, author, publisher, published_year)
VALUES ('Mastering Oracle SQL', 'Alan Beaulieu', 'O''Reilly Media', 2018);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('Effective PL/SQL', 'Steven Feuerstein', 'Oracle Press', 2022);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('Database Design Basics', 'David C. Hay', 'TechWorld', 2017);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('SQL Performance Tuning', 'Dan Tow', 'Apress', 2020);

INSERT INTO books (title, author, publisher, published_year)
VALUES ('Data Modeling Essentials', 'Graeme Simsion', 'Morgan Kaufmann', 2016);

-- Copies for Book ID 4 - Mastering Oracle SQL
INSERT INTO book_copies (book_id, status) VALUES (4, 'Available');
INSERT INTO book_copies (book_id, status) VALUES (4, 'Available');

-- Copies for Book ID 5 - Effective PL/SQL
INSERT INTO book_copies (book_id, status) VALUES (5, 'Available');

-- Copies for Book ID 6 - Database Design Basics
INSERT INTO book_copies (book_id, status) VALUES (6, 'Available');

-- Copies for Book ID 7 - SQL Performance Tuning
INSERT INTO book_copies (book_id, status) VALUES (7, 'Available');
INSERT INTO book_copies (book_id, status) VALUES (7, 'Available');

-- Copies for Book ID 8 - Data Modeling Essentials
INSERT INTO book_copies (book_id, status) VALUES (8, 'Available');

-------------------------------------------------------------------------

-- COMMIT if needed
COMMIT;
