----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/17 20:45:12
-- Design Name: 
-- Module Name: d2 - Behavioral
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

entity d2 is
--  Port ( );
end d2;


architecture Behavioral of d2 is
    component q2
        Port(
            input: in std_logic;
            output: out std_logic_vector(0 downto 0)
        );
    end component;
    signal e_input, e_output: std_logic;
    signal clk_period : time := 100ns;
begin
    d2c : q2 
    port map(
        input => e_input, output(0) => e_output
    );
    
    clock_process :process begin
        e_input <= '0'; 
        wait for clk_period/2; 
        e_input <= '1'; 
        wait for clk_period/2; 
    end process;
    
end Behavioral;
