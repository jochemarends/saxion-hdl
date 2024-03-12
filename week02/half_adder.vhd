library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity half_adder is
port (
    a, b:  in  std_logic;
    sum:   out std_logic;
    carry: out std_logic
);
end half_adder;

architecture arch of half_adder is
    component and_gate is
    port (
        a, b:   in  std_logic;
        output: out std_logic
    );
    end component;

    component xor_gate is
    port (
        a, b:   in  std_logic;
        output: out std_logic
    );
    end component;
begin
    u1: xor_gate port map (a, b, sum);
    u2: and_gate port map (a, b, carry);
end arch;
