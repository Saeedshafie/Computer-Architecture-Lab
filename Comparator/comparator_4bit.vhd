----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:04 03/11/2021 
-- Design Name: 
-- Module Name:    comparator_4bit - Behavioral 
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

entity comparator_4bit is
    Port ( A_top : in  STD_LOGIC_Vector(3 downto 0);
           B_top : in  STD_LOGIC_Vector(3 downto 0);
           G_top : out  STD_LOGIC;
           E_top : out  STD_LOGIC;
           L_top : out  STD_LOGIC);
end comparator_4bit;

architecture Behavioral of comparator_4bit is
signal Gouts: std_logic_vector(2 downto 0);
signal Eouts: std_logic_vector(2 downto 0);
signal Louts: std_logic_vector(2 downto 0);
COMPONENT Comparator_1bit
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		g : IN std_logic;
		e : IN std_logic;
		l : IN std_logic;          
		Gout : OUT std_logic;
		Eout : OUT std_logic;
		Lout : OUT std_logic
		);
	END COMPONENT;
begin
	Comparator_1bit_0: Comparator_1bit PORT MAP(
		a => A_top(3),
		b => B_top(3),
		g => '0',
		e => '1',
		l => '0',
		Gout => Gouts(0),
		Eout => Eouts(0),
		Lout => Louts(0)
	);
	Comparator_1bit_1: Comparator_1bit PORT MAP(
		a => A_top(2),
		b => B_top(2),
		g => Gouts(0),
		e => Eouts(0),
		l => Louts(0),
		Gout => Gouts(1),
		Eout => Eouts(1),
		Lout => Louts(1)
	);
	Comparator_1bit_2: Comparator_1bit PORT MAP(
		a => A_top(1),
		b => B_top(1),
		g => Gouts(1),
		e => Eouts(1),
		l => Louts(1),
		Gout => Gouts(2),
		Eout => Eouts(2),
		Lout => Louts(2)
	);
	Comparator_1bit_3: Comparator_1bit PORT MAP(
		a => A_top(0),
		b => B_top(0),
		g => Gouts(2),
		e => Eouts(2),
		l => Louts(2),
		Gout => G_top,
		Eout => E_top,
		Lout => L_top
	);

end Behavioral;

