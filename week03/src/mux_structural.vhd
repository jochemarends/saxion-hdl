use library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_structural is
    port (
        input:   in  std_logic_vector(1 downto 0);
        control: in  std_logic_vector(1 downto 0);
        output:  out std_logic
    );
end mux_structural;

architecture arch of mux_structural is
    component and_gate is
        generic (
            N: natural := 3
        );

        port (
            input:  in  std_logic_vector(N - 1 downto 0);
            output: out std_logic
        );
    end component;

    component or_gate is
        generic (
            N: natural := 4
        );

        port (
            input:  in  std_logic_vector(N - 1 downto 0);
            output: out std_logic
        );
    end component;

    component not_gate is
        port (
            input:  in  std_logic;
            output: out std_logic
        );
    end component;

    signal inv_control: std_logic_vector(1 downto 0);
    signal a, b, c:     std_logic;
begin
    -- for the inverse control
    u1: not_gate port map(control(0), inv_control(0));
    u2: not_gate port map(control(1), inv_control(1));

    -- for intermediate signals
    u3: and_gate port map (input(0) & inv_control(1) & inv_control(0), a);
    u4: and_gate port map (input(1) & inv_control(1) &     control(0), b);
    u5: and_gate port map (input(2) &     control(1) & inv_control(0), c);
    u6: and_gate port map (input(3) &     control(1) &     control(0), d);

    -- disjunct the intermediate signals
    u7: or_gate port map (a, b, c, d, output);
end arch;

