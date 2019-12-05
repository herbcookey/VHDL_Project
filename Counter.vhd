----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:36 11/08/2019 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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

entity ClockCounter is
	generic (MaxCounter : integer := 50000000 );
   Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sclk_out : out  STD_LOGIC);
end ClockCounter;

architecture Behavioral of ClockCounter is

begin
	process (clk, reset)
	variable counter : integer range 0 to maxcounter -1;
	begin
		if (reset = '1') then
			sclk_out <= '0';
			counter := 0;
		elsif (rising_edge(clk)) then
			if (counter = maxcounter -1) then
			  counter := 0;
			  sclk_out <= '1';
			else
				counter := counter + 1;
				sclk_out <= '0';
			end if;
		end if;
	end process;
end Behavioral;

