library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and_gate is
    generic (
        N: natural := 2
    );

    port (
        input:  in  std_logic_vector(N - 1 downto 0);
        output: out std_logic
    );
end and_gate;

architecture arch of and_gate is
begin
    process (input)
        variable accumulate: std_logic;
    begin
        accumulate := '1';
        for i in input'range loop
            accumulate := accumulate and input(i);
        end loop;
        output <= accumulate;
    end process;
end arch;

