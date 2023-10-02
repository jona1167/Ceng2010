----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/22 15:03:41
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
  Port ( 
    clk, btnC : IN std_logic ;
    an_in : IN std_logic_vector  (3 DOWNTO 0) := "1111";
    BCD_in : IN std_logic_vector (3 DOWNTO 0) := "0000";
    seg : OUT std_logic_vector (6 DOWNTO 0) := "1111111";
    an : OUT std_logic_vector (3 DOWNTO 0) := "1111"
    );
end display;

architecture Behavioral of display is
component selector
    port (
      output : out std_logic_vector (6 downto 0);
      input : in std_logic_vector (3 downto 0)
    );
  end component;

  signal seg_out : std_logic_vector (6 downto 0) := "0000000";



begin
ss : selector PORT MAP(
    output => seg_out, input => BCD_in
  );

  --  anode 
  an_proc : process (clk, btnC, an_in)
  begin
    if btnC = '1' then
      an <= "0000";
    elsif  rising_edge(clk) then
    --on an 1111
      an <= an_in;
    end if;
  end process;
--seg 
 seg_proc : process (clk, btnC, seg_out)
  begin
    if btnC = '1' then
      seg <= "1000000";
    elsif  rising_edge(clk) then
    --on seg 0000000
      seg <= seg_out;
    end if;
  end process;
end Behavioral;
