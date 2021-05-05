----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:25 04/04/2021 
-- Design Name: 
-- Module Name:    Sequence_Detector - Behavioral 
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

entity Sequence_Detector is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           din : in  STD_LOGIC;
           dout : out  STD_LOGIC);
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is
type state is (st0, st1, st2, st3, st4, st5);
signal present_state, next_state : state;
begin

--CLK Process
process (clk)
	begin
	if rising_edge(clk) then
		if (rst = '1') then
			present_state <= st0;
		else
			present_state <= next_state;
		end if;
	end if;
end process;

getOut: process(clk, rst)
	begin
	if rising_edge(clk) and rst = '0' then
		if ((present_state = st3 and din = '1') or (present_state = st4 and din = '0')) then
			dout <= '1';
		else
			dout <= '0';
		end if;
	end if;
	end process getOut;		

-- FSM Process
process(present_state, din)
	begin
	--dout <= '0';
	case(present_state) is 
	when st0 =>
		if(din = '0')then
			next_state <= st1;
			--dout <= '0';
		else
			next_state <= st0;
			--dout <= '0';
		end if;
	when st1 =>
		if(din = '1')then
			next_state <= st2;
			--dout <= '0';
		else
			next_state <= st1;
			--dout <= '0';
		end if;
	when st2 =>
		if(din = '0')then
			next_state <= st3;
			--dout <= '0';
		else
			next_state <= st4;
			--dout <= '0';
		end if;
	when st3 =>
		if(din = '0')then
			next_state <= st1;
			--dout <= '0';
		else
			next_state <= st0;
			--dout <= '1';
		end if;
	when st4 =>
		if(din = '1')then
		next_state <= st0;
		--dout <= '0';
		else
		next_state <= st0;
		--dout <= '1';
		end if;
	when others =>
	
	--when st5 =>
		--if(din = '1')then
		--next_state <= st0;
		--dout <= '1';
		--else
		--next_state <= st0;
		--dout <= '1';
		--end if;
	end case;
 end process;
end Behavioral;

