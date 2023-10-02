----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/17 20:27:16
-- Design Name: 
-- Module Name: q2 - Behavioral
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

entity q2 is
 Port (input: in std_logic := '0';
        output: out std_logic_vector(0 downto 0):= "0" );
end q2;

architecture Behavioral of q2 is
component q1
        Port(
            sw : in std_logic_vector (0 downto 0);
            btnC: in std_logic;
            led: out std_logic_vector (1 downto 0)
        );
    end component;
    signal a : std_logic := '0';
begin
df: q1
    port map(
       sw(0) => a, btnC => input,
       led(0) => output(0), led(1) => a
    );

end Behavioral;
