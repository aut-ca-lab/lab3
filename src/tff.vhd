----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:44 08/27/2020 
-- Design Name: 
-- Module Name:    tff - Behavioral 
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

entity tff is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           t : in  STD_LOGIC;
           q : inout  STD_LOGIC);
end tff;

architecture Behavioral of tff is

begin
	
	process (clock, reset)
	begin
		if reset = '0' then
			q <= '0';
		elsif (rising_edge(clock)) then
			q <= t xor q;
		end if;		
	end process;

end Behavioral;

