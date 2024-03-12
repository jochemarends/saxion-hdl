library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
port (
    a, b:  in  std_logic_vector(2 downto 0);
    sum:   out std_logic_vector(2 downto 0);
    carry: out std_logic
);
end adder;

architecture arch of adder is
begin
    process (a, b)
    -- intermediate carry
    variable int_carry: std_logic;
    begin
        -- reset carry
        int_carry := '0';

        for i in 0 to a'length-1 loop
            -- set sum bit
            if (a(i) = '0' and b(i) = '0' and int_carry = '1')
            or (a(i) = '0' and b(i) = '1' and int_carry = '0')
            or (a(i) = '1' and b(i) = '0' and int_carry = '0')
            or (a(i) = '1' and b(i) = '1' and int_carry = '1') then
                sum(i) <= '1';
            else
                sum(i) <= '0';
            end if;

            -- determine carry out
            if (a(i) = '0' and b(i) = '1' and int_carry = '1')
            or (a(i) = '1' and b(i) = '1' and int_carry = '0')
            or (a(i) = '1' and b(i) = '0' and int_carry = '1')
            or (a(i) = '1' and b(i) = '1' and int_carry = '1') then
                int_carry := '1';
            else
                int_carry := '0';
            end if;
        end loop;

        -- set final carry out
        carry <= int_carry;
    end process;
end arch;
