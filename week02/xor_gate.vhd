library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor_gate is
port (
    a, b:   in  std_logic;
    output: out std_logic
);
end xor_gate;

architecture arch of xor_gate is
begin
    output <= a xor b;
end arch;
