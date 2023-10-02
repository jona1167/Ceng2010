----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 16:27:41
-- Design Name: 
-- Module Name: q1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity q1 is
  Port ( sw : in std_logic_vector (6 downto 0);
   seg : out std_logic_vector (6 downto 0);
   an : out std_logic_vector (3 downto 0):="0011";
   btnC : in std_logic);
end q1;

architecture Behavioral of q1 is

begin
    seg <= not sw;
    process(btnC)
    variable x : std_logic :='1';
    begin
    if (FALLING_EDGE (btnc)) then
        if (x='0') then
            an<="0011";
           
        else 
            an <="1100";
        end if;
         x := not x;
    end if;
    end process;

end Behavioral;
