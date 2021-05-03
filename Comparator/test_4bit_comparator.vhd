--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:05 03/11/2021
-- Design Name:   
-- Module Name:   C:/.Xilinx/l/azmemari/lab2/comparator/comparator4bit/test_4bit_comparator.vhd
-- Project Name:  comparator4bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator_4bit
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
 
ENTITY test_4bit_comparator IS
END test_4bit_comparator;
 
ARCHITECTURE behavior OF test_4bit_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator_4bit
    PORT(
         A_top : IN  std_logic_vector(3 downto 0);
         B_top : IN  std_logic_vector(3 downto 0);
         G_top : OUT  std_logic;
         E_top : OUT  std_logic;
         L_top : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_top : std_logic_vector(3 downto 0) := (others => '0');
   signal B_top : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal G_top : std_logic;
   signal E_top : std_logic;
   signal L_top : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator_4bit PORT MAP (
          A_top => A_top,
          B_top => B_top,
          G_top => G_top,
          E_top => E_top,
          L_top => L_top
        );


   -- Stimulus process
   stim_proc: process
   begin		
      A_top <= "1000";
		B_top <= "0111";
		wait for 10 ns;
		
		A_top <= "1010";
		B_top <= "1100";
		wait for 10 ns;
		
		A_top <= "0100";
		B_top <= "0011";
		wait for 10 ns;

		A_top <= "1000";
		B_top <= "1011";
		wait for 10 ns;
		
		A_top <= "0110";
		B_top <= "0101";
		wait for 10 ns;

		A_top <= "1010";
		B_top <= "1010";
		wait for 10 ns;

		A_top <= "1001";
		B_top <= "1001";
		wait for 10 ns;
		
		A_top <= "1101";
		B_top <= "1100";
		wait for 10 ns;

      wait;
   end process;

END;
