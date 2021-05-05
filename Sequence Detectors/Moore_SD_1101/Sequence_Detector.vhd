library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sequence_Detector is
port (
	clock: in std_logic; 
	reset: in std_logic; 
	sequence_in: in std_logic; -- binary sequence input
	detector_out: out std_logic 
);
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is
	type State is (Zero, One, OneOne, OneOneZero, OneOneZeroOne);
	Signal current_state, next_state: State;

begin
	-- Clock Process
	process(clock,reset)
	begin
		if(reset='1') then
			current_state <= Zero;
		elsif(rising_edge(clock)) then
			current_state <= next_state;
		end if;
	end process;
	-- FSM Process
	process(current_state,sequence_in)
	begin
	case(current_state) is
			when Zero =>
				if(sequence_in='1') then
					-- 1
					next_state <= One;
				else
					next_state <= Zero;
				end if;
			when One =>
				if(sequence_in='1') then
					-- "11"
					next_state <= OneOne;
				else
					next_state <= One;
				end if;  
			when OneOne => 
				if(sequence_in='0') then
					-- "110"
					next_state <= OneOneZero;
				else
					next_state <= One;
				end if;  
			when OneOneZero =>
				if(sequence_in='1') then
					-- "1101"
					next_state <= OneOneZeroOne;
				else
					next_state <= Zero;
				end if; 
			when OneOneZeroOne =>
				if(sequence_in='1') then
					next_state <= One;
				else
					next_state <= Zero;
				end if;
	end case;
end process;
-- Output
process(current_state)
begin 
 case current_state is
 when Zero =>
  detector_out <= '0';
 when One =>
  detector_out <= '0'; 
 when OneOne => 
  detector_out <= '0'; 
 when OneOneZero =>
  detector_out <= '0'; 
 when OneOneZeroOne =>
  detector_out <= '1';
 end case;
end process;
end Behavioral;