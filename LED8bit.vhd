----------------------------------------------------------------------------------
-- Company: 대구대학교
-- Engineer: 신동현
-- 
-- Create Date:    16:16:46 12/05/2019 
-- Design Name: 
-- Module Name:    LED8bit - Behavioral 
-- Project Name: 팀프로젝트
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

entity LED8bit is
    Port ( sclk : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end LED8bit;

architecture Behavioral of LED8bit is
signal clk_cnt : integer range 0 to 8;

begin

	process(sclk, clk, rst)
	begin
		if (rst = '1') then
			LED <= "00000000";
		elsif (clk'event and clk ='1') then
			if (sclk = '1') then
				if (clk_cnt>=8) then
					clk_cnt<= 0;
				else
					clk_cnt<=clk_cnt+1;
				end if;
			end if;
		end if;
	case clk_cnt is
		when 0=> led <="10000000";
		when 1=> led <="01000000";
		when 2=> led <="00100000";
		when 3=> led <="00010000";
		when 4=> led <="00001000";
		when 5=> led <="00000100";
		when 6=> led <="00000010";
		when 7=> led <="00000001";
		when others => led <="00000000";
	end case;			
	end process;
end Behavioral;

