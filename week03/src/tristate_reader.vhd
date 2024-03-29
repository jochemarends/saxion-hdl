LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
-- Entity name normally the same as file name
ENTITY tristate_reader IS
-- Port declaration - declares module inputs and outputs
PORT( -- Input Signals
A, Control : IN std_logic;
-- Output Signals
-- Use Inout for bidirectional tri-state signals
Tri_out : INOUT std_logic);
END tristate_reader;
-- defines internal module architecture
ARCHITECTURE behavior OF tristate_reader IS
BEGIN
-- Assignment of a 'Z' value generates a tri-state output
Tri_out <= A WHEN Control = '0' ELSE 'Z';
END behavior;
