--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:56:00 04/04/2021
-- Design Name:   
-- Module Name:   E:/ISE Modules/Mealy_SD_0101_0110/tb_sequence_detector.vhd
-- Project Name:  Mealy_SD_0101_0110
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sequence_Detector
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
 
ENTITY tb_sequence_detector IS
END tb_sequence_detector;
 
ARCHITECTURE behavior OF tb_sequence_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sequence_Detector
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         din : IN  std_logic;
         dout : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal din : std_logic := '0';

 	--Outputs
   signal dout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sequence_Detector PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns
		
		rst <= '1';
		
		wait for 100 ns;	

		rst <= '0';
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';

		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '1';
		
		wait for 20 ns;
 
		din <= '0';
		
		wait for 20 ns;
 
		din <= '1';
		
      wait;
   end process;

END;
