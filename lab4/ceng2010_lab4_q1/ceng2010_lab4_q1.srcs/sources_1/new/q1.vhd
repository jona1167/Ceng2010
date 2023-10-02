----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2022 16:28:54
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
Port (sw : in std_logic_vector (0 downto 0);
    btnC : in std_logic;
    btnD : in std_logic;
    led : out std_logic_vector (7 downto 0));

end q1;

architecture Behavioral of q1 is
type state_type is (S0, S1,S2);
signal state, next_state :state_type:=S0;
signal change : std_logic := '0' ;

begin

SYNC_PROC : process (btnC, btnD)
begin
    if (btnD = '1') then
        state <= S0;
    elsif rising_edge(btnC) then
        state <= next_state;
        change<='1';
    end if;
end process;


NEXT_STATE_DECODE : process (state,sw(0 downto 0))
 begin
    case (state) is
        when S0 =>
            if (sw(0) = '1') then
                next_state <= S1;
            else 
                next_state <= S0;
            end if;
           when S1 =>
                        if (sw(0) = '1') then
                            next_state <= S1;
                        else 
                            next_state <= S2;
                     end if;
            when S2 =>
                         if (sw(0) = '1') then
                           next_state <= S1;
                        else 
                            next_state <= S2;
               end if;
               when others =>
                next_state <= S0;
               end case;
 end process;   

OUTOUT_PROCESS : process (btnC,btnD,state,sw(0 downto 0))
 begin
    if (btnD = '1') then
      led(7 downto 5) <= "001";
      led(0)<='0';
     else 
      if(btnC = '1') then 
      case (state) is
        when S0 =>
        led(7 downto 5) <= "001";
        if sw(0) = '0' then
           led(0) <= '0';
        else
           led(0) <= '1';                        
         end if;
         when S1 =>
         led(7 downto 5) <= "010";
                 if sw(0) = '0' then
                    led(0) <= '0';
                 else
                    led(0) <= '1';                        
                  end if;
          when S2 =>
            led(7 downto 5) <= "100";
             if sw(0) = '0' then
                led(0) <= '0';
             else
                 led(0) <= '1';                        
             end if;        
             
         
      end case;
       end if;     
     end if;
 end process;


end Behavioral;
