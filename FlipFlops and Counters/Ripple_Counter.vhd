----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:09 04/04/2021 
-- Design Name: 
-- Module Name:    Ripple_Counter - Behavioral 
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

entity Ripple_Counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dout : inout  STD_LOGIC_VECTOR (3 downto 0));
end Ripple_Counter;

architecture Behavioral of Ripple_Counter is

Component T_FF is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end Component T_FF;

begin

	T_FF0 : T_FF port map (A => '1',B => dout(0),CLK => clk,RESET => rst);
	T_FF1 : T_FF port map (A => '1',B => dout(1),CLK => dout(0),RESET => rst);
	T_FF2 : T_FF port map (A => '1',B => dout(2),CLK => dout(1),RESET => rst);
	T_FF3 : T_FF port map (A => '1',B => dout(3),CLK => dout(2),RESET => rst);
end Behavioral;

