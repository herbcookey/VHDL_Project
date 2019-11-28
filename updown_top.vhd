----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:42 11/22/2019 
-- Design Name: 
-- Module Name:    updown_top - Behavioral 
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

entity updown_top is
    Port ( Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           SEG_Data : out  STD_LOGIC_VECTOR (7 downto 0);
           SEG_Com : out  STD_LOGIC_VECTOR (7 downto 0));
end updown_top;

architecture Behavioral of updown_top is

component Array8Top
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
end component;

component INT2BCD
	Port ( rst : in STD_LOGIC;
			  int_value : in integer range 0 to 99;
			  BCD_10 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD_01 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component ClockCounter 
generic (MaxCounter : integer := 50000000);
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sclk_out : out  STD_LOGIC);
end component;

component BitCounter
generic (MinVal: integer := 0;
			MaxVal: integer := 99);
    Port ( Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  sclk : in STD_LOGIC;
           outvalue : out integer range MinVal to MaxVal);
end component;

signal clk_wire : STD_LOGIC;
signal int_wire : integer;
signal BCD10_wire : STD_LOGIC_VECTOR (3 downto 0);
signal BCD01_wire : STD_LOGIC_VECTOR (3 downto 0);

begin

U1 : ClockCounter Generic map ( MaxCounter => 50000000 )
						port map ( rst => rst, clk => clk, sclk_out => clk_wire);
						
U2 : BitCounter Generic map ( MinVal => 0, MaxVal => 99)
					 port map ( Up => Up, Down => Down, clk => clk, rst => rst, sclk => clk_wire, outValue => int_wire);
					 
U3 : INT2BCD port map ( int_value => int_wire, rst => rst, BCD_10 => BCD10_wire, BCD_01 => BCD01_wire);

U4 : Array8Top port map ( BCD7 => "0000", BCD6 => "0000", BCD5 => "0000", BCD4 => "0000", BCD3 => "0000",
										BCD2 => "0000", BCD1 => BCD10_wire, BCD0 => BCD01_wire, clk => clk, rst => rst, SEG_DATA => SEG_DATA, 
										SEG_COM => SEG_COM);



end Behavioral;

