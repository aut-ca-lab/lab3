--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:25:28 08/27/2020
-- Design Name:   
-- Module Name:   E:/Computer Architecture/L3/tests/tff_tb.vhd
-- Project Name:  L3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tff
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
 
ENTITY tff_tb IS
END tff_tb;
 
ARCHITECTURE behavior OF tff_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tff
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         t : IN  std_logic;
         q : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal t : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tff PORT MAP (
          clock => clock,
          reset => reset,
          t => t,
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
		t <= '1';
		
		wait for clock_period*4;
		t <= '0';
		
		wait for 20 ns;
		t <= '1';
		
		wait for 10ns;
		reset <= '0';
		
		wait for 10ns;
		reset <= '1';
		
      wait for clock_period*2;

      finish;
   end process;

END;
