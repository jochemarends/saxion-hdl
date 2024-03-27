use library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tristate is
    generic (
        N: natural := 1
    );

    port (
        input:   in  std_logic_vector(N - 1 downto 0);
        control: in  std_logic_vector(N - 1 downto 0);
        output:  out std_logic_vector(N - 1 downto 0);
    );
end tristate;

architecture arch of tristate is
begin
    for i in input'range loop
        output(i) <= a when control(i) = '0' else 'z';
    end loop;
end arch;

tristate8: tristate generic map(N => 8)
    port map (
        input   => input,
        control => control, 
        output  => output
    )
