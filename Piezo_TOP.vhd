----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:00 11/29/2019 
-- Design Name: 
-- Module Name:    Piezo_TOP - Behavioral 
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

entity Piezo_TOP is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  btn : in  STD_LOGIC;
           piezo : OUT  STD_LOGIC);
end Piezo_TOP;

architecture Behavioral of Piezo_TOP is
component ClockCounter 
	generic (MaxCounter : integer := 50000000 );
   Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sclk_out : out  STD_LOGIC);
end component;
component Edge_Detector 
PORT(
    rst : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
	 signal_in: in std_logic;
	 output: out std_logic);
end component;
component HB_PIANO IS
PORT(
    RESETN : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
	 sclk: in std_logic;
	 btn: in std_logic;
    PIEZO : OUT STD_LOGIC
);
end component;
signal btn_wire : std_logic;
signal sclk_wire : std_logic;
begin
U1 : edge_detector port map (rst => rst, clk => clk, signal_in => btn, output => btn_wire);
U2 : ClockCounter generic map (MaxCounter => 1000000) port map (clk=>clk, reset => rst, sclk_out => sclk_wire);
U3 : HB_Piano port map (RESETN => rst, clk => clk, sclk=> sclk_wire, btn => btn_wire, Piezo => piezo);

end Behavioral;

