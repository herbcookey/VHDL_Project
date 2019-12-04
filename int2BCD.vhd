----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:40 12/04/2019 
-- Design Name: 
-- Module Name:    int2BCD - Behavioral 
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

entity conv is
    Port ( input_i : in  integer;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end conv;

architecture conv_vec of conv is

function conv_vector (Y, L: INTEGER) return std_logic_vector is
    constant y_length : integer := L;                 -- ��ȯ�� std_logic_vector�� ũ�� ����
    variable result2: std_logic_vector ( y_length-1 downto 0); -- ������ ũ���� vector ���� ����
    variable y2: integer := Y;                        -- �Է��� integer�� y2 ������ ����
    variable y_div, y_eq, y_res: integer := 0 ;       -- ��,��,�������� ���� ������ ����, �ʱ�ȭ
    begin
      if ( y2 >= 0) then                                -- �Է��� 0���� Ŭ �� ����
          for i in 0 to y_length-1 loop                 -- ������ ũ�� ��ŭ �ݺ� ����
            y_div := y2 / 2;                            -- �Է��� 2�� ����
            y_eq := y_div * 2;                          -- 2�� ���� �� 2�� ���ϰ�
            y_res := y2 - y_eq;                         -- ������ ������ ���� �������� ����
            if (y_res >= 1) then                        -- �������� 1�̸�
              result2(i) := '1';                        --  std_logic_vector�� 1�� �Է�
            else
              result2(i) := '0';                        --  std_logic_vector�� 0�� �Է�
            end if;
            y2 := y2 / 2;                               -- �Է� ���� 2�� ������ ���� �ݺ�
          end loop;
      else
          for i in y_length-1 downto 0 loop             -- �Է��� 0���� ������ ��� ���� 0���� ����
            result2(i) := '0';
          end loop;
      end if;
      return result2;  
  end conv_vector;
     
  begin
  output <= conv_vector(input_i,8);
end conv_vec;