----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:36 11/15/2019 
-- Design Name: 
-- Module Name:    Array8Top - Behavioral 
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

entity Array8Top is
    Port ( BCD0 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD1 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD2 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD3 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD4 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD5 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD6 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD7 : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           SEG_Data : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG_COM : out  STD_LOGIC_VECTOR (7 downto 0));
end Array8Top;

architecture Behavioral of Array8Top is

component SEG7ARRAY_Top
	Port ( BCD7 : in  STD_LOGIC_VECTOR (3 downto 0);
			  BCD6 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD5 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD4 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD3 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD2 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD1 : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  SEL : in STD_LOGIC_VECTOR (2 downto 0);
           SEG_DATA : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG_COM : out  STD_LOGIC_VECTOR (7 downto 0));
           
end component;


component Counter_3bit
	Port ( Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  SCLK : in  STD_LOGIC;
           SEL : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component ClockCounter
	generic (MaxCounter : integer := 50000000);
	Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sclk_out : out  STD_LOGIC);
end component;

signal sel_wire : STD_LOGIC_VECTOR (2 downto 0);
signal sclk_wire : STD_LOGIC; 

begin
										
U1 : SEG7ARRAY_Top port map ( BCD7 => "0000", BCD6 => "0000", BCD5 => "0000", BCD4 => "0000", BCD3 => "0000",
										BCD2 => "0000", BCD1 => BCD1, BCD0 => BCD0, SEL => sel_wire, SEG_DATA => SEG_DATA, 
										SEG_COM => SEG_COM);
										
U2 : ClockCounter Generic map (maxcounter => 50000)
						port map ( rst => rst, clk => clk, sclk_out => sclk_wire);

U3 : Counter_3bit port map ( Reset => rst, CLK => clk, SCLK => sclk_wire, SEL => sel_wire);

end Behavioral;

