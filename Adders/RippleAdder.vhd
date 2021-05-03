----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:32 04/22/2021 
-- Design Name: 
-- Module Name:    RippleAdder - Behavioral 
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

entity RippleAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end RippleAdder;

architecture Behavioral of RippleAdder is

-- Component Full Adder
Component FullAdder is
	Port ( A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
end Component;

-- Signal Implementation for Mid Level Carry's
Signal c : STD_LOGIC_VECTOR(2 DOWNTO 0);
begin

	FA_1 : FullAdder Port Map(A => A(0),B => B(0),Cin => Cin,S => Sum(0),Cout => c(0));
	FA_2 : FullAdder Port Map(A(1),B(1),c(0),Sum(1),c(1)); -- New Way of Putting Inputs in PortMap
	FA_3 : FullAdder Port Map(A(2),B(2),c(1),Sum(2),c(2));
	FA_4 : FullAdder Port Map(A(3),B(3),c(2),Sum(3),Cout);


end Behavioral;

