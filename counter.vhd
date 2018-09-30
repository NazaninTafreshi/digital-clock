----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:34 05/08/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    generic(n : integer range 0 to 59:=59);
    Port ( clk : in  STD_LOGIC;
			  output : out  integer range 0 to n;
           ready : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is

begin

process(clk)
variable count:integer range 0 to n:=0;
begin
if rising_edge(clk) then
	if(count=n) then
		ready<='1'; 
		count:=0;
	else ready<='0';
		  count:=count+1;
	end if;
	output<=count;
end if;
end process;
end Behavioral;

