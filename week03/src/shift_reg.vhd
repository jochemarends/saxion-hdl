use library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- a right shift register
entity shift_reg is
    generic (
        N: positive := 8
    );

    port (
        input, clock: in  std_logic;
        data:         out std_logic_vector(N - 1 downto 0)
    );
end shift_reg;

architecture arch for shift_reg is
    process (input, clock)
        if rising_edge(clock) then
            -- shift the bit(s) to the right by one position
            -- and copy the input signal to the new bit
            if N > 1 then
                data <= input & data(N - 1 downto 1);
            elsif
                data(0) <= input;
            end if;
        end if;
    end process;
end arch;

shift_reg8: shift_reg 
    port map (
        input => input,
        clock => clock,
        data => data
    );

