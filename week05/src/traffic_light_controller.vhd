package traffic_light is
    type state is (green, amber, red);
end package traffic_light;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.traffic_light.all;

entity traffic_light_controller is
    port (
        clock:      in  std_logic;
        button:     in  std_logic;

        car:        out state;
        pedestrian: out state

        -- traffic light car
        car_green out std_logic;
        car_amber out std_logic;
        car_red   out std_logic;

        -- traffic light pedestrian
        pedestrian_green out std_logic
        pedestrian_amber out std_logic
        pedestrian_red   out std_logic
    );
end traffic_light_controller;

architecture arch of traffic_light_controller is
    -- use the state of the car light
    signal car_light_state: state := green;
begin
    process (button, clock)
    begin
        if button = '1' and car_light_state = green then
            car_light_state <= amber;
        elsif rising_edge(clock) then
            case car_light_state is
                when amber  => car_light_state <= red;
                when red    => car_light_state <= green;
                when green  => car_light_state <= green;
            end case;
        end if;
    end process;

    car <= car_light_state;

    with car_light_state select pedestrian <=
        red   when green,
        red   when amber,
        green when red;
end arch;

