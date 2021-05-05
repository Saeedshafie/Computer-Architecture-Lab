library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
		if rising_edge(clk) then
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
				when others =>
						state <= s0;
				end case;
		end if;		
		end process;
		r: process (clk)
		begin
			if rising_edge(clk) then
				if (state = s3 and input = '1') then
				 output <= '1';
				else
				 output <= '0';
				end if;	
			end if;
		end process r;		
					 
			 
	
end Behavioral;

