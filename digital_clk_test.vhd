--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:16:26 05/10/2018
-- Design Name:   
-- Module Name:   F:/fpgaProject/digital_clk/digital_clk_test.vhd
-- Project Name:  digital_clk
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: digital_clk
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY digital_clk_test IS
END digital_clk_test;
 
ARCHITECTURE behavior OF digital_clk_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT digital_clk
    PORT(
         m_in : IN  integer range 0 to 59;
         h_in : IN  integer range 0 to 23;
         clk : IN  std_logic;
         alarm_en : OUT  std_logic;
         m_out : OUT  integer range 0 to 59;
         s_out : OUT  integer range 0 to 59;
         h_out : OUT  integer range 0 to 23
        );
    END COMPONENT;
    

   --Inputs
   signal m_in : integer range 0 to 59 := 0;
   signal h_in :  integer range 0 to 23 := 0;
   signal clk : std_logic := '0';
   

 	--Outputs
   signal m_out : integer range 0 to 59 ;
   signal s_out : integer range 0 to 59;
   signal h_out : integer range 0 to 23;
   signal alarm_en : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: digital_clk PORT MAP (
          m_in => m_in,
          h_in => h_in,
          clk => clk,
          alarm_en => alarm_en,
          m_out => m_out,
          s_out => s_out,
          h_out => h_out
        );

  clk<= not clk after 0.5s;
  m_in<=4 ;
  h_in<=1 ;
END;
