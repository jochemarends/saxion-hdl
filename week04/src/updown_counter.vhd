library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity updown_counter is
    generic (
        N:    positive := 8
    );

    port (
        clock, reset, dir: in  std_logic;
        count:             out std_logic_vector(N - 1 downto 0)
    );
end updown_counter;

architecture arch of updown_counter is
    signal state: std_logic_vector(N - 1 downto 0);
begin
    process (reset, clock)
    begin
        if reset = '1' then
            state <= (others => '0');
        elsif rising_edge(clock) then
            if dir = '0' then
                state <= state + 1;
            else
                state <= state - 1;
            end if;
        end if;
    end process;

    count <= state;
end arch;

