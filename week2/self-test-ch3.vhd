ARCHITECTURE x OF gate_network IS
BEGIN
    -- concurrent assignment statements operate in parallel
    -- D(1) selects bit 1 of standard logic vector D
    X <= A AND NOT(B OR C) AND (D(1) XOR D(2));
    -- Process must declare a sensitivity list
    -- Sensitivity list includes all signals which can change the outputs
    PROCESS (A,B,C,D)
    BEGIN
        -- Statements inside a process execute in sequential order
        Y <= A AND NOT(B OR C) AND (D(1) XOR D(2));
    END PROCESS;
END x;

