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
use IEEE.Std_Logic_arith.all;

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
    constant y_length : integer := L;                 -- 변환할 std_logic_vector의 크기 지정
    variable result2: std_logic_vector ( y_length-1 downto 0); -- 지정한 크기의 vector 변수 지정
    variable y2: integer := Y;                        -- 입력한 integer를 y2 변수로 지정
    variable y_div, y_eq, y_res: integer := 0 ;       -- 몫,곱,나머지를 위한 변수를 지정, 초기화
    begin
      if ( y2 >= 0) then                                -- 입력이 0보다 클 때 수행
          for i in 0 to y_length-1 loop                 -- 지정한 크기 만큼 반복 수행
            y_div := y2 / 2;                            -- 입력을 2로 나눔
            y_eq := y_div * 2;                          -- 2로 나눈 몫에 2를 곱하고
            y_res := y2 - y_eq;                         -- 원래의 값에서 빼서 나머지를 구함
            if (y_res >= 1) then                        -- 나머지가 1이면
              result2(i) := '1';                        --  std_logic_vector에 1을 입력
            else
              result2(i) := '0';                        --  std_logic_vector에 0을 입력
            end if;
            y2 := y2 / 2;                               -- 입력 값을 2로 나누고 위로 반복
          end loop;
      else
          for i in y_length-1 downto 0 loop             -- 입력이 0보다 작으면 모든 값을 0으로 지정
            result2(i) := '0';
          end loop;
      end if;
      return result2;  
  end conv_vector;
     
  begin
  output <= conv_vector(input_i,8);
end conv_vec;
