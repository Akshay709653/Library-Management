-- ===============================================
-- Library Management System — Table Definitions
-- Created by Akshay — July 2025
-- ===============================================

-- 1 Books Table
CREATE TABLE books (
    book_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    author VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(100) NOT NULL,
    published_year NUMBER(4)
);

-- 2 Book Copies Table (with optional ON DELETE CASCADE)
CREATE TABLE book_copies (
    copy_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    book_id NUMBER NOT NULL,
    status VARCHAR2(20) DEFAULT 'Available' NOT NULL,
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) 
        REFERENCES books(book_id) ON DELETE CASCADE
);

-- 3 Members Table
CREATE TABLE members (
    member_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    contact VARCHAR2(20) NOT NULL,
    join_date DATE DEFAULT SYSDATE NOT NULL
);

-- 4 Issue Transactions Table
/*
Available		The copy is in library and can be issued
Issued			The copy is currently issued to a member
Lost			The copy is marked as lost (by member or library)
Damaged			The copy is damaged, may not be available for issue
Reserved		Reserved by a member (for future feature)
Under Repair	Temporarily unavailable
Returned		The copy is returned by member
*/
CREATE TABLE issue_transactions (
    issue_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    copy_id NUMBER NOT NULL,
    member_id NUMBER NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    CONSTRAINT fk_copy_id FOREIGN KEY (copy_id) 
        REFERENCES book_copies(copy_id),
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
);

-- 5 Return Transactions Table
CREATE TABLE return_transactions (
    return_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    issue_id NUMBER NOT NULL,
    return_date DATE NOT NULL,
    fine_amount NUMBER DEFAULT 0,
    CONSTRAINT fk_issue_id FOREIGN KEY (issue_id) 
        REFERENCES issue_transactions(issue_id)
);
