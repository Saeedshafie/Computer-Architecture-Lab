----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:50 04/11/2021 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAM is
	GENERIC(
			Width : INTEGER := 16; -- Width of the Memor
			CellCount : INTEGER := 256);	-- Memory Cell Count

	Port( 
			--Write_Enable : in STD_LOGIC;
			--Read_Enable : in STD_LOGIC;
			Clock : in STD_LOGIC;
         Address : in  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Address Line
         Reset : in  STD_LOGIC; -- Asynchrounos and Active Low
			Data_In : in  STD_LOGIC_VECTOR(15 DOWNTO 0); -- Input Data
         Data_Out : out  STD_LOGIC_VECTOR(15 DOWNTO 0)); -- OutPut Data
end CAM;


Architecture logic of CAM is
	TYPE memory is array(255 DOWNTO 0) OF STD_LOGIC_VECTOR(15 DOWNTO 0); 	--data type for memory
	SIGNAL CAM :	memory; --memory array
	SIGNAL addr_int	:	INTEGER RANGE 0 TO 255; --internal address register
	SIGNAL match : STD_LOGIC;

begin
	process(Clock , Reset)
	begin
		if(Reset = '0') then
			Data_Out <= "ZZZZZZZZZZZZZZZZ";
			addr_int <= 0;
		elsif(Clock'EVENT and Clock = '1') then
			for I in 0 to 255
			if(match = '1') then
				addr_int <= conv_integer(Address);  
				Data_Out <= CAM(addr_int);			
			else
				CAM(conv_integer(Address)) <= Data_In;
			end if;		
		--	addr_int <= conv_integer(Address);         --store the address in the internal address register
		end if;	
	end Process;
	

	
END logic;
