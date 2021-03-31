library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor_tb is
end subtractor_tb;

architecture Behavioral of subtractor_tb is

	component subtractor
		generic( width : integer := 5);
		port(
			op : in  std_logic;
			a,b : in unsigned(width-1 downto 0);
			x : out  unsigned(width-1 downto 0);
			err : out  std_logic
		);
	end component;

	signal op : std_logic := '0';
	signal a, b : unsigned(4 downto 0) := (others => '0');
	signal x : unsigned(4 downto 0);
	signal err : std_logic;
BEGIN

	UUT : subtractor generic map (width => 5)
	port map(
		op 	=> op,
		a 	=> a,
		b 	=> b,
		x 	=> x,
		err => err
	);

	process
		begin

		wait for 20 ns;

		op <= '1';
		
		a <= "00000";
		b <= "00000";
		wait for 20 ns;
		
		a <= "11111";
		b <= "11111";
		wait for 20 ns;
		
		a <= "00000";
		b <= "11111";
		wait for 20 ns;
		
		a <= "00001";
		b <= "00100";
		wait for 20 ns;
		
		a <= "10000";
		b <= "00001";
		wait for 20 ns;

		a <= "11100";
		b <= "01011";
		wait for 20 ns;

		op <= '0';
		
		a <= "00000";
		b <= "00000";
		wait for 20 ns;
		
		a <= "11111";
		b <= "11111";
		wait for 20 ns;

		a <= "10101";
		b <= "01010";
		wait for 20 ns;

		wait;
	end process;
end Behavioral;
