----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2020 02:01:19 PM
-- Design Name: 
-- Module Name: pmwatch - Behavioral
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pmwatch is
    port ( en,clk,reset: in std_logic; y2,y1,y0: out std_logic_vector(3 downto 0));
end pmwatch;

architecture Behavioral of pmwatch is

signal cnty2,cnty1,cnty0: std_logic_vector(3 downto 0);

begin

process(clk,reset)
    begin
      if(reset = '1') then
        cnty2 <= "0000";
        cnty1 <= "0000";
        cnty0 <= "0000";
      elsif (rising_edge(clk) and en = '1') then
            if(cnty0 >= "1001") then
                cnty0 <= "0000";
                cnty1 <= unsigned(cnty1) + 1;
            elsif(cnty0 <= "1001") then
                cnty0 <= unsigned(cnty0) + 1;
            if(cnty1 > "1001") then
                cnty1 <= "0000";
                cnty2 <= unsigned(cnty2) + 1;
            if(cnty2 >= "1001") then
                cnty0 <= "0000";
                cnty1 <= "0000";
                cnty2 <= "0000";
            end if;
            end if;
            end if;
      end if;
    end process;
	y2 <= cnty2;
	y1 <= cnty1;
	y0 <= cnty0;
end Behavioral;