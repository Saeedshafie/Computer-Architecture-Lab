----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:45 04/03/2021 
-- Design Name: 
-- Module Name:    modu_mealy - Behavioral 
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

entity modu_mealy is
    Port ( input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC);
end modu_mealy;

architecture Behavioral of modu_mealy is
	type state_t is (s0 , s1 , s2, s3);
	signal state : state_t := s0;
begin
	process (clk)
		begin
			if rising_edge (clk) then
				case state is 
					when s0 =>
						if (input = '1') then 
							state <= s1;
						else
							state <= s0;
						end if;	
					when s1 =>
						if (input = '1') then 
							state <= s2;
						else
							state <= s0;
						end if;	
					when s2 =>
						if (input = '1') then 
							state <= s2;
						else
							state <= s3;
						end if;	
					when s3 =>
						if (input = '1') then 
							state <= s1;
						else
							state <= s0;
						end if;
				end case;
			end if;
		end process;
	output <= '0' when state = s0 else
	          '0' when state = s1 else
	          '0' when state = s2 else
	          '0' when (state = s3 and input = '0') else
	          '1' when (state = s3 and input = '1');
	
end Behavioral;

