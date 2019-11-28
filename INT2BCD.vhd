----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:04 11/22/2019 
-- Design Name: 
-- Module Name:    INT2BCD - Behavioral 
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
USE ieee.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INT2BCD is
    Port ( rst : in STD_LOGIC;
			  int_value : in integer range 0 to 99;
			  BCD_10 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD_01 : out  STD_LOGIC_VECTOR (3 downto 0));
end INT2BCD;

architecture Behavioral of INT2BCD is
signal Dec_10, Dec_01 : integer range 0 to 9;

begin
	process (rst, int_value)
	begin
		if (rst = '1') then Dec_10 <= 0; Dec_01 <= 0;
		elsif (int_value >= 90) then Dec_10 <= 9; Dec_01 <= int_value - 90;
		elsif (int_value >= 80) then Dec_10 <= 8; Dec_01 <= int_value - 80;
		elsif (int_value >= 70) then Dec_10 <= 7; Dec_01 <= int_value - 70;
		elsif (int_value >= 60) then Dec_10 <= 6; Dec_01 <= int_value - 60;
		elsif (int_value >= 50) then Dec_10 <= 5; Dec_01 <= int_value - 50;
		elsif (int_value >= 40) then Dec_10 <= 4; Dec_01 <= int_value - 40;
		elsif (int_value >= 30) then Dec_10 <= 3; Dec_01 <= int_value - 30;
		elsif (int_value >= 20) then Dec_10 <= 2; Dec_01 <= int_value - 20;
		elsif (int_value >= 10) then Dec_10 <= 1; Dec_01 <= int_value - 10;
		else Dec_10 <= 0; Dec_01 <= int_value;
		end if;
	end process;
	BCD_10 <= conv_std_logic_vector (Dec_10, 4);
	BCD_01 <= conv_std_logic_vector (Dec_01, 4);
end Behavioral;

