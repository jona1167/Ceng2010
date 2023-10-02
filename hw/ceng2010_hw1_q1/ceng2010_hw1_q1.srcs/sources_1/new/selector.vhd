----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/22 14:58:19
-- Design Name: 
-- Module Name: selector - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity selector is
  Port ( 
  output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";
  input : IN STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000"
  );
end selector;

architecture Behavioral of selector is
 --0-9
begin
process (input)
  begin
    case input is
      when "0000" => output <= "1000000";
      when "0001" => output <= "1111001";
      when "0010" => output <= "0100100";
      when "0011" => output <= "0110000";
      when "0100" => output <= "0011001";
      when "0101" => output <= "0010010";
      when "0110" => output <= "0000010";
      when "0111" => output <= "1111000";
      when "1000" => output <= "0000000";
      when "1001" => output <= "0010000";
      when others => output <= "0000110";
    end case;
  end process;


end Behavioral;
