library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- a right shift register
entity shift_reg is
    generic (
        N: positive := 8
    );

    port (
        input, clock: in  std_logic;
        dir:          in  std_logic;
        data:         out std_logic_vector(N - 1 downto 0)
    );
end shift_reg;

architecture arch of shift_reg is
signal internal: std_logic_vector(N -1 downto 0);
begin
    process (input, clock)
	 begin
        if rising_edge(clock) then
            -- shift the bit(s) to the right by one position
            -- and copy the input signal to the new bit
            if N > 1 then
                internal <= input & internal(N - 1 downto 1);
            else
                internal(0) <= input;
            end if;
        end if;
    end process;
	 
	 data <= internal;
end arch;

