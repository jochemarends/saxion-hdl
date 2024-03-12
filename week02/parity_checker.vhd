library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity parity_checker is
port (
    data:   in  std_logic_vector(3 downto 0);
    output: out std_logic
);
end parity_checker;

architecture arch of parity_checker is
    component xor_gate is
    port (
        a, b:   in  std_logic;
        output: out std_logic
    );
    end component;
    -- intermediate results
    signal a, b: std_logic;
begin
    u1: xor_gate port map (data(0), data(1), a);
    u2: xor_gate port map (data(2), a, b);
    u3: xor_gate port map (data(3), b, output);
end arch;
