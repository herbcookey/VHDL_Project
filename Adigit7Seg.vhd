----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:11 12/04/2019 
-- Design Name: 
-- Module Name:    Adigit7Seg - Behavioral 
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

entity Adigit7Seg is
    Port ( rst : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           seg7 : out  STD_LOGIC_VECTOR (6 downto 0));
end Adigit7Seg;

architecture Behavioral of Adigit7Seg is


begin

	process(rst, stop, btn1, btn2, btn3, btn4)
	begin 
		if (rst = '1') then
			seg7 <= "1111110";
		elsif (stop ='1') then
			seg7 <= "1111110";
		elsif (btn1 = '1') then
			seg7 <= "0110000";
		elsif (btn2 = '1') then
			seg7 <= "1101101";
		elsif (btn3 = '1') then
			seg7 <= "1111001";
		elsif (btn4 = '1') then
			seg7 <= "1110000";
		else
			seg7 <= "1111110";
		end if;
	end process;

end Behavioral;

