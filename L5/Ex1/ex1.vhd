library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity hz100_tb is
    Port (
            clk_in  : in  STD_LOGIC;
            out1    : out  STD_LOGIC
         );
end hz100_tb;

architecture Behavioral of hz100_tb is
begin process (clk_in)
    variable clk_prev_value : STD_LOGIC := '1';
begin
    if (clk_in'event and clk_in = '1') then
        out1 <= clk_prev_value;
        clk_prev_value := clk_prev_value xor '1';
    end if;
end process;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity khz11_tb is
    Port (
            clk_in  : in STD_LOGIC;
            out2    : out STD_LOGIC := '0'
         );
end khz11_tb;

architecture Behavioral of khz11_tb is
    BEGIN process(clk_in)
    variable counter        : integer   := 0;
    variable clk_prev_value : STD_LOGIC := '0';
begin
        if( clk_in'event and clk_in = '1') then
            counter := counter + 1;
            if counter = 625000 then
                out2 <= clk_prev_value xor '1';
                clk_prev_value := clk_prev_value xor '1';
                counter := 0;
            end if;
        end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mhz50_tb is
    Port (
            clk_in  : in STD_LOGIC;
            out3    : out STD_LOGIC := '0'
         );
end mhz50_tb;

architecture Behavioral of mhz50_tb is
BEGIN process(clk_in)
    variable counter          : integer   := 0;
    variable clk_prev_value   : STD_LOGIC := '0';
begin
    if( clk_in'event and clk_in = '1') then
        counter := counter + 1;
        if counter = 56818 then
            out3 <= clk_prev_value xor '1';
            clk_prev_value := clk_prev_value xor '1';
            counter := 0;
        end if;
    end if;
end process;
end Behavioral;
