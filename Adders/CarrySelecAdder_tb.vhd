--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:04:02 04/24/2021
-- Design Name:   
-- Module Name:   E:/ISE Modules/Aaaz4-Adders/CarrySelecAdder_tb.vhd
-- Project Name:  Aaaz4-Adders
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySelectAdder
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
 
ENTITY CarrySelecAdder_tb IS
END CarrySelecAdder_tb;
 
ARCHITECTURE behavior OF CarrySelecAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySelectAdder
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : IN  std_logic_vector(3 downto 0);
         Cin_top : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         Cout_top : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal Y : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin_top : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cout_top : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySelectAdder PORT MAP (
          X => X,
          Y => Y,
          Cin_top => Cin_top,
          Sum => Sum,
          Cout_top => Cout_top
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
		X <= "1011";
		Y <= "1111";
		
		wait for 100 ns;
		X <= "1010";
		Y <= "0110";
		
		wait for 100 ns;
		X <= "1100";
		Y <= "1001";
		
		wait for 100 ns;
		X <= "0101";
		Y <= "1111";
		
		wait for 100 ns;
		X <= "0001";
		Y <= "1010";
		 
		wait for 100 ns;
		X <= "0111";
		Y <= "1111";

      wait;
   end process;

END;
