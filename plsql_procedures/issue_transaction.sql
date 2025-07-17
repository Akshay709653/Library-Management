================================================
-- Procedure to Issue book to Member
-- Created by Akshay - July 2025
-- ================================================

CREATE OR REPLACE PROCEDURE issue_book(
    p_bookid    IN NUMBER,
    p_memberid  IN NUMBER,
    p_max       IN NUMBER DEFAULT 5
)
AS
    v_copies_borrowed   NUMBER := 0;
    v_copies_available  NUMBER := 0;
    v_copy_id           NUMBER;
    v_issue_id          issue_transactions.issue_id%TYPE;

    er_borrowed             EXCEPTION;
    er_book_not_available   EXCEPTION;
    er_member_limit_reached EXCEPTION;

BEGIN
    -- Check if Member has already borrowed this Book
    SELECT COUNT(*)
    INTO v_copies_borrowed
    FROM issue_transactions it
    JOIN book_copies bc 
    ON it.copy_id = bc.copy_id
    WHERE bc.book_id = p_bookid
      AND it.member_id = p_memberid
      AND bc.status = 'Issued';

    IF v_copies_borrowed > 0 THEN
        RAISE er_borrowed;
    END IF;

    -- Check if Member has reached borrowing limit
    SELECT COUNT(*)
    INTO v_copies_borrowed
    FROM issue_transactions it
    JOIN book_copies bc 
    ON it.copy_id = bc.copy_id
    WHERE it.member_id = p_memberid
      AND bc.status = 'Issued';

    IF v_copies_borrowed >= p_max THEN
        RAISE er_member_limit_reached;
    END IF;

    -- Check for Available Book Copy
    SELECT COUNT(*), MIN(copy_id)
    INTO v_copies_available, v_copy_id
    FROM book_copies
    WHERE book_id = p_bookid
      AND status = 'Available';

    IF v_copies_available = 0 THEN
        RAISE er_book_not_available;
    END IF;

    -- Insert Issue Transaction
    INSERT INTO issue_transactions (copy_id, member_id, issue_date, due_date)
    VALUES (v_copy_id, p_memberid, SYSDATE, SYSDATE + 14)
    RETURNING issue_id INTO v_issue_id;

    -- Update Book Copy Status
    UPDATE book_copies
    SET status = 'Issued'
    WHERE copy_id = v_copy_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Book Issued Successfully. Issue ID: ' || v_issue_id);

-- Custom Exceptions First
EXCEPTION
    WHEN er_borrowed THEN
        DBMS_OUTPUT.PUT_LINE('Error: Member already has this book issued.');
    WHEN er_member_limit_reached THEN
        DBMS_OUTPUT.PUT_LINE('Error: Member has reached the maximum issue limit.');
    WHEN er_book_not_available THEN
        DBMS_OUTPUT.PUT_LINE('Error: No available copy of this book.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unhandled Error: ' || SQLERRM);
END;
/

