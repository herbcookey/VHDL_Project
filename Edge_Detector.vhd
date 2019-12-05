----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:20 11/29/2019 
-- Design Name: 
-- Module Name:    Edge_Detector - Behavioral 
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

entity Edge_Detector is
PORT(
    rst : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
	 signal_in: in std_logic;
	 output: out std_logic
    
);

end Edge_Detector;

architecture Behavioral of Edge_Detector is
   signal signal_d:STD_LOGIC;
begin
	process(clk, rst, signal_in)
	begin
 	  if rst = '1' then
	     signal_d <= '0';	
	  elsif clk= '1' and clk'event then
         signal_d<=signal_in;
  	   end if;
	end process;
	output<= (not signal_d) and signal_in; 
end Behavioral;

