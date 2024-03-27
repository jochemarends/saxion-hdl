library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg is
    generic (
        N: positive := 8 
    );

    port (
        D:          in  std_logic_vector(N - 1 downto 0);
        CLK, CLEAR: in  std_logic;
        Q:          out std_logic_vector(N - 1 downto 0)
    );
end reg;

architecture arch of reg is
begin
    process (CLK)
    begin
        if falling_edge(CLK) then
            if CLEAR = '1' then
                Q <= (others => '0');
            else
                Q <= D;
            end if;
        end if;
    end process;
end arch;

