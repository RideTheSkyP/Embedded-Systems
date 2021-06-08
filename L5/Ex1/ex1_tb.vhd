LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


ENTITY ex1_tb IS
END ex1_tb;

ARCHITECTURE behavior OF ex1_tb IS
    COMPONENT hz100_tb
    PORT(
         clk_in : IN  STD_LOGIC;
         out1   : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT khz11_tb
    PORT(
         clk_in : IN  STD_LOGIC;
         out2   : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT mhz50_tb
    PORT(
         clk_in : IN  STD_LOGIC;
         out3   : OUT STD_LOGIC
        );
    END COMPONENT;

   --Inputs
    signal clk_in : STD_LOGIC := '0';

 	--Outputs
    signal out1 : STD_LOGIC := '0';
    signal out2 : STD_LOGIC := '0';
    signal out3 : STD_LOGIC := '0';

    constant clk_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (uut)
    uut1: hz100_tb PORT MAP (
        clk_in => clk_in,
        out1 => out1
    );

    uut2: khz11_tb PORT MAP (
        clk_in => clk_in,
        out2 => out2
    );

    uut3: mhz50_tb PORT MAP(
        clk_in => clk_in,
        out3 => out3
    );

   -- Clock process definitions
    clk_process : process
        variable wait_done : natural := 0;
    begin
        if wait_done = 0 then
            wait for clk_period * 0.5;
            wait_done := 1;
        end if;

        clk_in <= '1';
        wait for clk_period / 2;
        clk_in <= '0';
        wait for clk_period / 2;
    end process;
END;
