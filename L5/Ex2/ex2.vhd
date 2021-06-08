library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ex2 is
    generic(N : natural := 3);
    Port (
            clk_in  : in STD_LOGIC;
            clk_out : out STD_LOGIC_VECTOR (N-1 downto 0) := (OTHERS => '0')
         );
end ex2;

architecture Behavioral of ex2 is
    BEGIN process(clk_in)
        variable counter        : integer := 0;
        variable clk_prev_value : STD_LOGIC_VECTOR (N-1 downto 0) := (OTHERS => '0');
begin
    if(clk_in'event and clk_in = '1') then
        counter := counter + 1;
        for I in 0 to (N - 1)loop
            if (counter mod(2 ** I) = 0) then
            clk_out(I) <= clk_prev_value(I) xor '1';
            clk_prev_value(I) := clk_prev_value(I) xor '1';
                if (I = (N - 1)) then
                    counter := 0;
                end if;
            end if;
        end loop;
    end if;

end process;
end Behavioral;
