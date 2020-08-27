----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:30 08/27/2020 
-- Design Name: 
-- Module Name:    q4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity q4 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           x : in  STD_LOGIC;
           y : out  STD_LOGIC);
end q4;

architecture Behavioral of q4 is
	type state_type is (S0, S1, S2, S3, S4);
	signal state: state_type := S0;
begin

	process (clock, reset)
	begin
		if reset = '0' then
			state <= S0;
		elsif (rising_edge(clock)) then
			case state is
				when S0 =>
					if x = '0' then
						state <= S1;
					else
						state <= S0;
					end if;
				when S1 =>
					if x = '0' then
						state <= S1;
					else
						state <= S2;
					end if;
				when S2 =>
					if x = '0' then
						state <= S3;
					else
						state <= S4;
					end if;
				when S3 =>
					if x = '0' then
						state <= S1;
					else
						state <= S2;
					end if;
				when S4 =>
					if x = '0' then
						state <= S1;
					else
						state <= S0;
					end if;
			end case;
		end if;
	end process;
	
	process (state, x)
	begin
		if (state = S3 and x = '1') or (state = S4 and x = '0') then
			y <= '1';
		else
			y <= '0';
		end if;
	end process;

end Behavioral;

