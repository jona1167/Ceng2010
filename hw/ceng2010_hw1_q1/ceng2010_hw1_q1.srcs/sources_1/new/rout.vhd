----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/22 15:17:54
-- Design Name: 
-- Module Name: rout - Behavioral
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
USE IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rout is
 Port (
   clk : IN STD_LOGIC;
    btnC : IN STD_LOGIC; 
    btnL, btnR : IN STD_LOGIC;
    seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
    an : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"
  );
end rout;

architecture Behavioral of rout is
COMPONENT board
    PORT (
      clk, btnC : IN STD_LOGIC;
      seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
      an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111";
      BCD_in_0, BCD_in_1, BCD_in_2, BCD_in_3 : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
  END COMPONENT;
  

  SIGNAL BCD0, BCD1, BCD2, BCD3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE state_type IS (s0, s1, s2, s3);
  --1155162668 
  --s0 8901 s1 9018 s2 0189 s3 1890
  
  SIGNAL state, next_state : state_type := s0;
  SIGNAL last_btnL_state, last_btnR_state : STD_LOGIC := '0';
  --hold 
begin
bb : board port map(
    clk => clk, btnC => btnC, seg => seg, an => an, BCD_in_0 => BCD0, BCD_in_1 => BCD1, BCD_in_2 => BCD2, BCD_in_3 => BCD3
  );
-- Clock 
  clk_proc : process (clk, btnC)
  begin
    if btnC = '1' then
      state <= s0;
    elsif  rising_edge(clk) then
      state <= next_state;
    end if;
  end process;
  
  
   next_state_proc : process (clk, state, btnL, btnR)
  begin
    if btnC = '1' then
      next_state <= s0;
    elsif rising_edge(clk) then
      -- Rotate Left
      if btnL = '1' and last_btnL_state = '0' then
        case state is
          when s0 => next_state <= s1;
          when s1 => next_state <= s2;
          when s2 => next_state <= s3;
          when s3 => next_state <= s0;
          when others => next_state <= s0;
        end case;
        last_btnL_state <= '1';
      elsif btnL = '0' then
        last_btnL_state <= '0';
      end if;
  
  if btnR = '1' and last_btnR_state = '0' then
        case state is
          when s0 => next_state <= s3;
          when s1 => next_state <= s0;
          when s2 => next_state <= s1;
          when s3 => next_state <= s2;
          when others => next_state <= s0;
        end case;
        last_btnR_state <= '1';
      elsif btnR = '0' then
        last_btnR_state <= '0';
      end if;
    end if;
  
  
  
  
  end process;
  
    -- display number
  BCD_out_proc : process (clk, state)
  begin
    case state is
      when s0 =>
        BCD0 <= "0001";
        BCD1 <= "0000";
        BCD2 <= "1001";
        BCD3 <= "1000";
      when s1 =>
        BCD0 <= "1000";
        BCD1 <= "0001";
        BCD2 <= "0000";
        BCD3 <= "1001";
      when s2 =>
        BCD0 <= "1001";
        BCD1 <= "1000";
        BCD2 <= "0001";
        BCD3 <= "0000";
      when s3 =>
        BCD0 <= "0000";
        BCD1 <= "1001";
        BCD2 <= "1000";
        BCD3 <= "0001";
    end case;
  end process;
  
  
  
  
  
end Behavioral;
