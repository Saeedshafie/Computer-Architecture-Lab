----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:13 04/22/2021 
-- Design Name: 
-- Module Name:    HalfAdder - Behavioral 
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


entity HalfAdder is
	Port ( A : in STD_LOGIC;
			B : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
end HalfAdder;

architecture gate_level of HalfAdder is

begin

	S <= A XOR B ; -- Sum
	Cout <= A AND B ; -- Carry Out

end gate_level;