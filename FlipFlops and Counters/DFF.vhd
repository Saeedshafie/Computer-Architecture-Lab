----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:25 03/26/2021 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC;
			  Async_Reset: in STD_LOGIC;
           CLK : in  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
	process(CLK , Async_Reset)
	begin
		if(Async_Reset = '0') then
			B <= '0';
		elsif rising_edge(CLK) then
			B <= A;
		end if;
	end process;
end Behavioral;

