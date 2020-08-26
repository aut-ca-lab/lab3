----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:17 08/27/2020 
-- Design Name: 
-- Module Name:    ripple_counter - Behavioral 
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

entity ripple_counter is
    Port ( clock : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end ripple_counter;

architecture Behavioral of ripple_counter is
	component tff is
		 Port ( clock : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  t : in  STD_LOGIC;
				  q : out  STD_LOGIC;
				  not_q : out  STD_LOGIC);
	end component tff;
	signal int : std_logic_vector(2 downto 0);
begin

t0: tff port map(clock => clock, reset => reset, t => '1', q => q(0), not_q => int(0));
t1: tff port map(clock => int(0), reset => reset, t => '1', q => q(1), not_q => int(1));
t2: tff port map(clock => int(1), reset => reset, t => '1', q => q(2), not_q => int(2));
t3: tff port map(clock => int(2), reset => reset, t => '1', q => q(3), not_q => open);

end Behavioral;

