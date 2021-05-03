----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:41 04/24/2021 
-- Design Name: 
-- Module Name:    CarrySelectAdder - Behavioral 
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

entity CarrySelectAdder is
Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
		Y : in STD_LOGIC_VECTOR (3 downto 0);
		Cin_top : in STD_LOGIC;
		Sum : out STD_LOGIC_VECTOR (3 downto 0);
		Cout_top : out STD_LOGIC);
end CarrySelectAdder;

architecture gate_level of CarrySelectAdder is

Component FullAdder is
	Port ( A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
end Component;

Component Mux_top is
port(
	A,B : in STD_LOGIC;
	Sel: in STD_LOGIC;
	Z: out STD_LOGIC
);
end Component;

signal Sum1,Sum2,C0,C1: STD_LOGIC_VECTOR( 3 DOWNTO 0);


begin

		FA_1: FullAdder PORT MAP(X(0),Y(0),'0' ,Sum1(0),C0(0));
		FA_2: FullAdder PORT MAP(X(1),Y(1),C0(0),Sum1(1),C0(1));
		FA_3: FullAdder PORT MAP(X(2),Y(2),C0(1),Sum1(2),C0(2));
		FA_4: FullAdder PORT MAP(X(3),Y(3),C0(2),Sum1(3),C0(3));
		 
		FA_5: FullAdder PORT MAP(X(0),Y(0),'1' ,Sum2(0),C1(0));
		FA_6: FullAdder PORT MAP(X(1),Y(1),C1(0),Sum2(1),C1(1));
		FA_7: FullAdder PORT MAP(X(2),Y(2),C1(1),Sum2(2),C1(2));
		FA_8: FullAdder PORT MAP(X(3),Y(3),C1(2),Sum2(3),C1(3));
		 
		MUX1: Mux_top PORT MAP(Sum1(0),Sum2(0),Cin_top,Sum(0));
		MUX2: Mux_top PORT MAP(Sum1(1),Sum2(1),Cin_top,Sum(1));
		MUX3: Mux_top PORT MAP(Sum1(2),Sum2(2),Cin_top,Sum(2));
		MUX4: Mux_top PORT MAP(Sum1(3),Sum2(3),Cin_top,Sum(3));
		 
		MUX5: Mux_top PORT MAP(C0(3),C1(3),Cin_top,Cout_top);



end gate_level;

