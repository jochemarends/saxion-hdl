library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity not_gate is
    port (
        input:  in  std_logic;
        output: out std_logic
    );
end not_gate;

architecture arch of not_gate is
begin
    output <= not input;
end arch;

