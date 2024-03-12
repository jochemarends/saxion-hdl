library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dec_7seg is 
port (
    data:                in  std_logic_vector(3 downto 0);
    a, b, c, d, e, f, g: out std_logic
);
end dec_7seg;

architecture arch of dec_7seg is
signal segments : std_logic_vector(6 downto 0);
begin
    process (data)
    begin
        case digit is
            when "0000" => segments <= "1111110"; 
            when "0001" => segments <= "0110000"; 
            when "0010" => segments <= "1101101";
            when "0011" => segments <= "1111001";
            when "0100" => segments <= "0110011";
            when "0101" => segments <= "1011011";
            when "0110" => segments <= "1011111";
            when "0111" => segments <= "1110000";
            when "1000" => segments <= "1111111";
            when "1001" => segments <= "1111011";
            when "1010" => segments <= "1110111";
            when "1011" => segments <= "0011111";
            when "1100" => segments <= "1001110";
            when "1101" => segments <= "0111101";
            when "1110" => segments <= "1001111";
            when "1111" => segments <= "1000111";
            when others => segments <= "0111110";
        end case;
    end process;
    a <= not segments(6); 
    b <= not segments(5); 
    c <= not segments(4); 
    d <= not segments(3); 
    e <= not segments(2); 
    f <= not segments(1); 
    g <= not segments(0);
end arch;
