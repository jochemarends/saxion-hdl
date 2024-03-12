library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and_gate is
port (
    a, b:   in  std_logic;
    output: out std_logic
);
end and_gate;

architecture arch of and_gate is
begin
    output <= a and b;
end arch;
