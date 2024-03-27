library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decade_counter is
    port (
        clock: in  std_logic;
        count: out std_logic_vector(3 downto 0)
    );
end decade_counter;

architecture arch of decade_counter is
    signal state: std_logic_vector(3 downto 0);
begin
    process (clock)
    begin
        if rising_edge(clock) then
            if state < 10 then
                state <= state + 1;
            else
                state <= (others => '0');
            end if;
        end if;
    end process;

    count <= state;
end arch;

