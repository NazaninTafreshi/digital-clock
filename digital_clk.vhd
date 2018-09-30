----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:19 05/08/2018 
-- Design Name: 
-- Module Name:    digital_clk - Behavioral 
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

entity digital_clk is
    Port ( m_in : in  integer range 0 to 59 ;
           h_in : in  integer range 0 to 23;
           clk : in  STD_LOGIC;
           alarm_en : out  STD_LOGIC;
			  m_out : out  integer range 0 to 59 ;
           s_out : out  integer range 0 to 59;
           h_out : out  integer range 0 to 23);
end digital_clk;

architecture Behavioral of digital_clk is
 component counter is
    generic(n : integer range 0 to 59:=59);
    Port ( clk : in  STD_LOGIC;
			  output : out  integer range 0 to n;
           ready : out  STD_LOGIC);
end component;
signal sec_ready,min_ready,h_ready:std_logic:='0';
signal min_out,sec_out:integer range 0 to 59 :=0;
signal hour_out:integer range 0 to 23:=0;

begin
process(clk)
begin
if rising_edge(clk) then
	if (min_out=m_in and hour_out=h_in) then 
		alarm_en<='1';
	else
		alarm_en<='0';
	end if;
end if;
end process;
secs:counter generic map (59) port map(clk,sec_out,sec_ready);
mins:counter generic map (59) port map(sec_ready,min_out,min_ready);
hours:counter generic map (23) port map(min_ready,hour_out,h_ready);
m_out<=min_out;
h_out<=hour_out;
s_out<=sec_out;
end Behavioral;

