----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:12 03/26/2021 
-- Design Name: 
-- Module Name:    T_FF - Behavioral 
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

entity T_FF is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end T_FF;

architecture Behavioral of T_FF is
signal tmp : STD_LOGIC;
begin
	process (CLK , RESET)
	begin
		if(RESET = '1') then
			tmp <= '0';
		elsif rising_edge (CLK) then
			if( A = '0')then
				tmp <= tmp;
			else
				tmp <= not (tmp);
			end if;
		end if;
	end process;
	B <= tmp;
	
	
	-- Implementation without Process
	--architecture rtl of tff is begin
   -- q <= '0' when reset = '1' else
   --     not q when rising_egde(clk) and t = '1';
	
end Behavioral;

