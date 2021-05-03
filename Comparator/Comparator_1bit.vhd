----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:48 03/11/2021 
-- Design Name: 
-- Module Name:    Comparator_1bit - Behavioral 
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

entity Comparator_1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           g : in  STD_LOGIC;
           e : in  STD_LOGIC;
           l : in  STD_LOGIC;
           Gout : out  STD_LOGIC;
           Eout : out  STD_LOGIC;
           Lout : out  STD_LOGIC);
end Comparator_1bit;

architecture Behavioral of Comparator_1bit is

begin
Eout <= e and (a xnor b);
Gout <= g or (e and (not b) and a);
Lout <= l or (e and (not a) and b);

end Behavioral;

