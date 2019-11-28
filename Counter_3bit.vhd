----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:30 11/01/2019 
-- Design Name: 
-- Module Name:    Counter_3bit - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_3bit is
    Port ( Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  SCLK : in  STD_LOGIC;
           SEL : out  STD_LOGIC_VECTOR (2 downto 0));
end Counter_3bit;

architecture Behavioral of Counter_3bit is
signal REG : STD_LOGIC_VECTOR (2 downto 0);

begin
	process (CLK, Reset)
	begin
		if (reset = '1') then
			REG <= "000";
		elsif rising_edge(CLK) then
			if SCLK = '1' then
				if REG >= "111" then
					REG <= "000";
				else
					REG <= REG + "001";
				end if;
			end if;
		end if;
	end process;

	SEL <= REG;
end Behavioral;

