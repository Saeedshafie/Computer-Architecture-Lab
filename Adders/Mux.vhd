----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:42 04/22/2021 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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
 
entity Mux_top is
port(
	A,B : in STD_LOGIC;
	Sel: in STD_LOGIC;
	Z: out STD_LOGIC
);
end Mux_top;
 
architecture gate_level of Mux_top is
begin
	process(A,B,Sel)
	begin
		if Sel = '0' then
			Z <= A;
		else
			Z <= B;
		end if;
	end process;
end gate_level;

