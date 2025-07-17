-- ================================================
-- Procedure: return_damaged_or_lost_book
-- Purpose  : Process return of damaged/lost books with manual fine
-- Author   : Akshay - July 2025
-- ================================================

CREATE OR REPLACE PROCEDURE return_damaged_or_lost_book(
    p_issue_id     IN NUMBER,
    p_return_date  IN DATE,
    p_status       IN VARCHAR2,
    p_fine_amount  IN NUMBER
)
AS
    v_copy_id   NUMBER;
    v_due_date  DATE;
BEGIN
    -- 1. Fetch Copy ID and Due Date from issue_transactions
    SELECT copy_id, due_date
    INTO v_copy_id, v_due_date
    FROM issue_transactions
    WHERE issue_id = p_issue_id;

    -- 2. Insert into return_transactions with manual fine
    INSERT INTO return_transactions (issue_id, return_date, fine_amount)
    VALUES (p_issue_id, p_return_date, p_fine_amount);

    -- 3. Update book_copies status to Damaged/Lost
    UPDATE book_copies
    SET status = p_status
    WHERE copy_id = v_copy_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Book marked as ' || p_status || ' with fine ₹' || p_fine_amount);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Issue transaction not found.');
        log_error('return_damaged_or_lost_book', 'No issue found for ID: ' || p_issue_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unhandled Error: ' || SQLERRM);
        log_error('return_damaged_or_lost_book', SQLERRM);
END;
/
