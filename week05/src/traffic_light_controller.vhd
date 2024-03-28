library ieee;
use ieee.std_logic_1164.all;


entity traffic_light_controller is
    port (
        clock:            in  std_logic;
        button:           in  std_logic;

        -- traffic light car
        car_green:        out std_logic;
        car_amber:        out std_logic;
        car_red:          out std_logic;

        -- traffic light pedestrian
        pedestrian_green: out std_logic;
        pedestrian_amber: out std_logic;
        pedestrian_red:   out std_logic
    );
end traffic_light_controller;

architecture arch of traffic_light_controller is
    type light_state is (green, amber, red);
	 
     -- for shorter if-else statements
	 function iif (condition: boolean; when_true, when_false: std_logic) return std_logic is
	 begin
	    if condition then
            return when_true;
        else
            return when_false;
        end if;
	 end function;

    -- only track the state of the car light
    signal car_light_state: light_state := green;
begin
    process (clock)
    begin
        if rising_edge(clock) then
            -- only check for button press upon rising edge of clock
            if button = '1' and car_light_state = green then
                car_light_state <= amber;
            else
                -- advance to next state
                case car_light_state is
                    when amber  => car_light_state <= red;
                    when red    => car_light_state <= green;
                    when green  => car_light_state <= green;
                end case;
            end if;
        end if;
    end process;

    process (car_light_state)
    begin
        -- the car light
        car_green <= iif(car_light_state = green, '1', '0');
        car_amber <= iif(car_light_state = amber, '1', '0');
        car_red   <= iif(car_light_state = red  , '1', '0');

        -- the pedestrian light (does not use amber)
        pedestrian_green <= iif(car_light_state  = red, '1', '0');
        pedestrian_amber <= '0';
        pedestrian_red   <= iif(car_light_state /= red, '1', '0');
    end process;
end arch;

