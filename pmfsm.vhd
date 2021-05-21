----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2020 02:32:00 PM
-- Design Name: 
-- Module Name: pmfsm - Behavioral
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

entity pmfsm is
Port (
     start, reset,clk, stop: in std_logic := '0';
     en: out std_logic;
     ckcs, ckns: out std_logic_vector(1 downto 0));
end pmfsm;

architecture Behavioral of pmfsm is
    
    constant idle: std_logic_vector (1 downto 0):= "00";
    constant s1: std_logic_vector (1 downto 0):= "01";
   
    signal cs, ns: std_logic_vector(1 downto 0);

begin

    ckcs <= cs;
    ckns <= ns;
    
    process(reset, clk) begin
        if(reset = '1') then
            cs <= idle;
        elsif(rising_edge(clk)) then
            cs <= ns;
        end if;
    end process;
    
    process(cs, start, stop) begin
        case(cs) is 
            when idle => if(start = '1') then
                    ns <= s1;
                elsif(stop = '0') then
                    ns <= idle;
                end if;
            when s1 => if(start = '0') then
                    ns <= idle;
                elsif(stop = '1') then
                    ns <= idle;
                end if;
            when others => ns <= idle;
            end case;
        end process;
        en <= '1' when (cs = s1) else '0';
end Behavioral;