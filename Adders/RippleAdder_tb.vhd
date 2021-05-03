--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:28:03 04/22/2021
-- Design Name:   
-- Module Name:   E:/ISE Modules/Aaaz4-Adders/RippleAdder_tb.vhd
-- Project Name:  Aaaz4-Adders
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleAdder
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
 
ENTITY RippleAdder_tb IS
END RippleAdder_tb;
 
ARCHITECTURE behavior OF RippleAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		A <= "0110";
		B <= "1100";
		 
		wait for 100 ns;
		A <= "1111";
		B <= "1100";
		 
		wait for 100 ns;
		A <= "0110";
		B <= "0111";
		 
		wait for 100 ns;
		A <= "0110";
		B <= "1110";

		wait for 100 ns;
		A <= "0111";
		B <= "0110";

		wait for 100 ns;
		A <= "0101";
		B <= "0001";

		wait for 100 ns;
		A <= "1110";
		B <= "1010";
		
		wait for 100 ns;
		A <= "0011";
		B <= "1100";
				 
		wait for 100 ns;
		A <= "1111";
		B <= "1111";

      wait;
   end process;

END;
