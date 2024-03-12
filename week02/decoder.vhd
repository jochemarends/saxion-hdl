library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder is
port (
    a: in  std_logic_vector(1 downto 0);
    d: out std_logic_vector(3 downto 0)
);
end decoder;

architecture arch of decoder is
begin
    process (a)
    begin
        case a is
            when "00" => d <= "0001";
            when "01" => d <= "0010";
            when "10" => d <= "0100";
            when "11" => d <= "1000";
        end case;
    end process;
end arch;
