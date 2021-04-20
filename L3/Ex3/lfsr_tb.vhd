LIBRARY STD;
use std.textio.all;
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;


entity lfsr_tb is
end lfsr_tb;

ARCHITECTURE behavior of lfsr_tb is
    --UUT
    component lfsr is
		port(
				clk : in  STD_LOGIC;
				q 	: inout  STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
			);
    end component;

    signal clk 	: STD_LOGIC := '0';
    signal q 	: STD_LOGIC_VECTOR(15 downto 0);

    constant clk_period : time := 20 ns;

    BEGIN
        uut: lfsr port map(
			clk => clk,
			q => q
        );

        clk_process: PROCESS
        BEGIN
			clk <= not clk;
    		wait for clk_period/2;
        END PROCESS;

		watch: PROCESS(clk)
		  variable ln: LINE;
		  variable b: STRING(1 to 3);
		BEGIN
		IF rising_edge(clk) THEN
		  for i in 15 downto 0 LOOP
		    b := STD_LOGIC'Image(q(i));
		    WRITE(ln, b(2));
		  END LOOP;
		  WRITELINE(output, ln);
		END IF;
	END PROCESS;
END;