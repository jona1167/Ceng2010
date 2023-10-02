----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/17 20:22:01
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
 Port ( sw : in std_logic_vector (0 downto 0) := "0";
    btnC: in std_logic := '0';
    led: out std_logic_vector (1 downto 0) := "00");
end q1;

architecture Behavioral of q1 is
signal q, nq : std_logic := '0';
begin
process (btnC, sw(0))
begin
    if rising_edge(btnC) then
        q <= sw(0);
        nq <= not sw(0); 
        led(0) <= sw(0);
        led(1) <= not sw(0);
    end if;
end process;

end Behavioral;
