----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/03 21:48:42
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

entity q2 is Port ( sw : in std_logic_vector (3 downto 0);
    led: out std_logic_vector (1 downto 0);
    btnC: in std_logic);
end q2;

architecture Behavioral of q2 is

begin
    process (sw,btnC )
    variable outp : std_logic_vector (1 downto 0); 
    variable toutp : std_logic_vector (1 downto 0); 
    
    begin
        if(sw (3 downto 2)="11" )then
            if falling_edge(btnC) then
                 case sw(1 downto 0) is
                    when "00" => 
                            outp := outp;
                     when "11" => 
                            toutp := outp;
                            outp(0) := toutp(1);
                            outp(1) := toutp(0); 
                    when others => 
                            outp := sw (1 downto 0);  
                   end case;               
            end if;
            
            if btnC = '1' then
                    outp := outp;              
                end if;
        else
            outp := not sw(3 downto 2);
        end if;
        
        led<= outp ;
    end process;

end Behavioral;
