--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:06 04/22/2021
-- Design Name:   
-- Module Name:   E:/ISE Modules/Aaaz4-Adders/HalfAdder_tb.vhd
-- Project Name:  Aaaz4-Adders
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HalfAdder
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
 
ENTITY HalfAdder_tb IS
END HalfAdder_tb;
 
ARCHITECTURE behavior OF HalfAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HalfAdder
    PORT(  A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
        );
    END COMPONENT;
    
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
	-- Inputs
	signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
 --
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HalfAdder PORT MAP (
			A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Clock process definitions
  -- <clock>_process :process
 --  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
			A <= '0';
			B <= '0';
			 
			wait for 100 ns;
			 
			A <= '1';
			B <= '0';
		
			wait for 100 ns;
			 
			A <= '0';
			B <= '1';

			wait for 100 ns;			 
			A <= '1';
			B <= '1';
			wait for 100 ns;
			 
		

      wait;
   end process;

END;
