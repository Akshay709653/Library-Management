-- ================================================
-- Function: calculate_fine
-- Purpose : Calculates the fine based on due date and return date
-- Author  : Akshay - July 2025
-- ================================================
-- Logic:
--  - If book is returned on or before due date → Fine = 0
--  - Else → Fine = (Days Late) * Fine per Day
--  - Default fine per day is set to ₹10 unless specified
-- ================================================

CREATE OR REPLACE FUNCTION calculate_fine(
    p_due_date      IN DATE,
    p_return_date   IN DATE,
    p_fine_per_day  IN NUMBER DEFAULT 10
) RETURN NUMBER
IS
    v_days_late NUMBER;
BEGIN
    IF p_return_date <= p_due_date THEN
        RETURN 0;
    ELSE
        v_days_late := p_return_date - p_due_date;
        RETURN v_days_late * p_fine_per_day;
    END IF;
END;
/
