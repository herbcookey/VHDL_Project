----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:56 10/25/2019 
-- Design Name: 
-- Module Name:    MUX8 - Behavioral 
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

entity MUX8 is
    Port ( BCD7 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD6 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD5 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD4 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD3 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD2 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD1 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD0 : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (2 downto 0);
			  SEG_COM : out STD_LOGIC_VECTOR (7 downto 0);
           BCD_OUT : out  STD_LOGIC_VECTOR (3 downto 0));
end MUX8;

architecture Behavioral of MUX8 is

begin
	process(BCD7, BCD6, BCD5, BCD4, BCD3, BCD2, BCD1, BCD0, SEL)
	begin
	case (SEL) is
		when "000" => BCD_OUT <= BCD0;
		when "001" => BCD_OUT <= BCD1;
		when "010" => BCD_OUT <= BCD2;
		when "011" => BCD_OUT <= BCD3;
		when "100" => BCD_OUT <= BCD4;
		when "101" => BCD_OUT <= BCD5;
		when "110" => BCD_OUT <= BCD6;
		when "111" => BCD_OUT <= BCD7;
		when others => null;
	end case;
	end process;

	SEG_COM <= "01111111" when SEL = "000" ELSE
						"10111111" when SEL = "001" ELSE
						"11011111" when SEL = "010" ELSE
						"11101111" when SEL = "011" ELSE
						"11110111" when SEL = "100" ELSE
						"11111011" when SEL = "101" ELSE
						"11111101" when SEL = "110" ELSE
						"11111110" when SEL = "111" ELSE
						"11111111";
				  
	
end Behavioral;

