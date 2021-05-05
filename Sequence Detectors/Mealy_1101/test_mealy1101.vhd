--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:18 04/03/2021
-- Design Name:   
-- Module Name:   C:/.Xilinx/l/azmemari/lab3/q4/mealy/Mealy_1101/test_mealy1101.vhd
-- Project Name:  Mealy_1101
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modu_mealy
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_mealy1101 IS
END test_mealy1101;
 
ARCHITECTURE behavior OF test_mealy1101 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modu_mealy
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: modu_mealy PORT MAP (
          input => input,
          clk => clk,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		wait for clk_period / 2;
		clk <= not clk;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      input <= '0';
		wait for clk_period / 2;
		input <= '0';
		wait for 2 * clk_period;
		input <= '1';
		wait for 15 ns;
		input <= '0';
		wait for clk_period;
		input <= '1';
		wait for 2 * clk_period;
		input <= '0';
		wait for 15 ns;
		input <= '1';

      --wait;
   end process;

END;
