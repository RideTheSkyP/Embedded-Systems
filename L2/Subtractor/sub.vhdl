library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is
	generic(width : integer := 5);
	port( 
		op 	: in std_logic; 
		a,b : in unsigned(width-1 downto 0); 
		x 	: out unsigned(width-1 downto 0); 
		err : out std_logic
	);
end subtractor;

architecture Behavioral of subtractor is
	component adder
		port(
			i0, i1 	: in std_logic; 
			ci 		: in std_logic; 
			s 		: out std_logic; 
			co 		: out std_logic
		);
	end component; 

	constant zeros		: unsigned(width-1 downto 0) := (others => '0');
	signal carryOuts 	: unsigned(width downto 0) := (others => '0');
	signal tempB 		: unsigned(width-1 downto 0);
	signal answer 		: unsigned(width-1 downto 0);
	
	begin
		tempB <= b xor (not zeros) when op='1' else b;
		
		summator: for i in 0 to width-1 generate
			adderX: adder port map (a(i), tempB(i), carryOuts(i), answer(i), carryOuts(i+1));
		end generate;

		err <= carryOuts(width) when op='0'
			else '0' when ((carryOuts(width))='1' or ((answer+1)=zeros))
			else '1';

		x <= answer when op='0'
			else (answer+1) when (carryOuts(width))='1'
			else zeros;
end Behavioral;
