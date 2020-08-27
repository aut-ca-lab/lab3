--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:21:10 08/27/2020
-- Design Name:   
-- Module Name:   E:/Computer Architecture/lab3/tests/q3_mealy_tb.vhd
-- Project Name:  L3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: q3_mealy
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
 
ENTITY q3_mealy_tb IS
END q3_mealy_tb;
 
ARCHITECTURE behavior OF q3_mealy_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT q3_mealy
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         x : IN  std_logic;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal y : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: q3_mealy PORT MAP (
          clock => clock,
          reset => reset,
          x => x,
          y => y
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
      -- hold reset state for 12 ns.
      wait for 12 ns;
		reset <= '1';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '0';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '0';
		
		wait for clock_period;
		x <= '1';
		
		wait for clock_period;
		x <= '1';
		
      wait for clock_period*2;

      finish;
   end process;

END;
