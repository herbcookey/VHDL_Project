----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:33 11/22/2019 
-- Design Name: 
-- Module Name:    Count - Behavioral 
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

entity BitCounter is
generic (MinVal: integer := 0;
			MaxVal: integer := 99);
    Port ( Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  sclk : in STD_LOGIC;
           outvalue : out integer range MinVal to MaxVal);
end Bitcounter;

architecture Behavioral of BitCounter is
signal UDcounter : integer range MinVal to MaxVal;


begin
	process(rst, clk, sclk, up, down)
	begin
		if (rst='1') then
		UDcounter <= 0;
		elsif(clk'event and clk='1') then
			if sclk = '1' then
				if (up = '1') then
				UDcounter <= UDcounter + 1;
					if (UDcounter >= MaxVal) then
					UDcounter <= MinVal;
					end if;
				elsif (down = '1') then
				UDcounter <= UDcounter - 1;
					if (UDcounter <= MinVal) then
					UDcounter <= MaxVal;
					end if;
				end if;
			end if;
	end if;
	end process;
outvalue <= UDcounter;
end Behavioral;

