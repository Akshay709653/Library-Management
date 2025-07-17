-- ================================================
-- Procedure: return_book
-- Purpose  : Handles book return, calculates fine, updates records
-- Author   : Akshay - July 2025
-- ================================================

CREATE OR REPLACE PROCEDURE return_book(
    p_issue_id     IN NUMBER,
    p_return_date  IN DATE,
    p_fine_per_day IN NUMBER DEFAULT 10
)
AS
    v_due_date  DATE;
    v_copy_id   NUMBER;
    v_fine      NUMBER;
BEGIN
    -- 1. Check if Issue Transaction exists and fetch due_date, copy_id
    SELECT due_date, copy_id
    INTO v_due_date, v_copy_id
    FROM issue_transactions
    WHERE issue_id = p_issue_id;

    -- 2. Calculate Fine using your function
    v_fine := calculate_fine(v_due_date, p_return_date, p_fine_per_day);

    -- 3. Insert record into return_transactions
    INSERT INTO return_transactions (issue_id, return_date, fine_amount)
    VALUES (p_issue_id, p_return_date, v_fine);

    -- 4. Update book_copies status to 'Available'
    UPDATE book_copies
    SET status = 'Available'
    WHERE copy_id = v_copy_id;

    -- 5. Commit
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Book returned successfully. Fine: ' || v_fine);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No such issue transaction found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unhandled Error: ' || SQLERRM);
END;
/
