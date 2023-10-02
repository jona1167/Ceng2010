----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/24 14:27:10
-- Design Name: 
-- Module Name: q3 - Behavioral
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

entity q3 is
 Port (sw : in std_logic_vector (1 downto 0);
       led : buffer std_logic_vector (1 downto 0));
end q3;

architecture Behavioral of q3 is

begin

led(1) <= sw(1) nand led(0);
led(0) <= sw(0) nand led(1);
end Behavioral;
