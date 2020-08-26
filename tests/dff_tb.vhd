--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:54:31 08/26/2020
-- Design Name:   
-- Module Name:   E:/Computer Architecture/L3/tests/dff_tb.vhd
-- Project Name:  L3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dff
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use std.env.finish;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dff_tb IS
END dff_tb;
 
ARCHITECTURE behavior OF dff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dff
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dff PORT MAP (
          clock => clock,
          reset => reset,
          d => d,
          q => q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 15 ns.
      wait for 12 ns;	
		reset <= '1';
		
		wait for 20 ns;
		d <= '1';
		
		wait for 10 ns;
		d <= '0';
		
		wait for 20 ns;
		d <= '1';
		
		wait for 10ns;
		reset <= '0';
		
		wait for 10ns;
		reset <= '1';
		
      wait for clock_period*2;

      finish;
   end process;

END;
