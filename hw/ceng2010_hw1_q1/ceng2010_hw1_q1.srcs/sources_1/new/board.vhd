----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/22 15:09:50
-- Design Name: 
-- Module Name: board - Behavioral
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

entity board is
  Port (
   clk, btnC : IN STD_LOGIC;
   seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
   an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
   BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
   );
end board;

architecture Behavioral of board is
component display
        port (
            clk, btnC : in std_logic;
            an_in : in std_logic_vector (3 downto 0) := "1111";
            BCD_in : in std_logic_vector (3 downto 0) := "0000";
            seg : out std_logic_vector (6 downto 0) := "1111111";
            an : out std_logic_vector (3 downto 0) := "1111"
        );
    end component;
    

    -- srefresh mechanism
    signal one_second_counter : std_logic_vector (27 downto 0);
    signal refresh_counter : std_logic_vector (19 downto 0);
    signal LED_activating_counter : std_logic_vector(1 downto 0);


    -- component 
    signal an_active : std_logic_vector(3 downto 0) := "0000";
    signal BCD_active : std_logic_vector (3 downto 0) := "0000";
begin
dd: display port map(
clk => clk, btnC => btnC, seg => seg, an => an, an_in => an_active, BCD_in => BCD_active
);
-- clock 
    process (clk, btnC)
    begin
        if (btnC = '1') then
            refresh_counter <= (others => '0');
        elsif (rising_edge(clk)) then
            refresh_counter <= refresh_counter + 1;
        end if;
    end process;
LED_activating_counter <= refresh_counter(19 DOWNTO 18);

 -- node display
    LED_disp_proc : PROCESS (LED_activating_counter, BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3)
    BEGIN
        CASE LED_activating_counter IS
            WHEN "00" =>
                -- -- activate LED1 and Deactivate LED2, LED3, LED4
                an_active <= "1110";
                BCD_active <= BCD_in_0;
            WHEN "01" =>
                -- activate LED2 and Deactivate LED1, LED3, LED4
                an_active <= "1101";
                BCD_active <= BCD_in_1;
            WHEN "10" =>
                -- activate LED3 and Deactivate LED2, LED1, LED4
                an_active <= "1011";
                BCD_active <= BCD_in_2;
            WHEN "11" =>
                -- activate LED4 and Deactivate LED2, LED3, LED1
                an_active <= "0111";
                BCD_active <= BCD_in_3;
        END CASE;
    END PROCESS;

end Behavioral;
