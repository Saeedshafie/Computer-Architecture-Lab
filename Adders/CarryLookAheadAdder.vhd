----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:52 04/22/2021 
-- Design Name: 
-- Module Name:    CarryLookAheadAdder - Behavioral 
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

entity CarryLookAheadAdder is
Port ( 	A : in STD_LOGIC_VECTOR (3 downto 0);
			B : in STD_LOGIC_VECTOR (3 downto 0);
			Cin : in STD_LOGIC;
			Sum : out STD_LOGIC_VECTOR (3 downto 0);
			Cout : out STD_LOGIC);
end CarryLookAheadAdder;

architecture gate_level of CarryLookAheadAdder is
Component FullAdder is
	Port ( A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
end Component;

signal c : STD_LOGIC_VECTOR(2 downto 0);
signal P: STD_LOGIC_VECTOR(3 downto 0);


begin
	
	c(1) <= (A(1) AND B(1)) OR ((A(1) XOR B(1)) AND (A(0) AND B(0))) OR ((A(1) XOR B(1)) AND (A(0) XOR B(0)) AND Cin);
	c(0) <= (A(0) AND B(0)) OR ((A(0) xor B(0)) AND Cin);
--	C(1) <= (A(1) AND B(1)) OR (C(0) AND (A(1) XOR B(1)));
	c(2) <= (A(2) AND B(2)) OR (c(1) AND (A(2) XOR B(2)));
	Cout <= (A(3) AND B(3)) OR (c(2) AND (A(3) XOR B(3)));
	
	FA_1 : FullAdder Port Map(A(0),B(0),Cin,Sum(0),P(0));
	FA_2 : FullAdder Port Map(A(1),B(1),c(0),Sum(1),P(1));
	FA_3 : FullAdder Port Map(A(2),B(2),c(1),Sum(2),P(2));
	FA_4 : FullAdder Port Map(A(3),B(3),c(2),Sum(3),P(3));
			

end gate_level;

