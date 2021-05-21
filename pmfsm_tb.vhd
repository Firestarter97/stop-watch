----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2020 04:08:04 PM
-- Design Name: 
-- Module Name: pmfsm_tb - Behavioral
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

entity pmfsm_tb is
end pmfsm_tb;

architecture Behavioral of pmfsm_tb is
    component pmfsm
    port(
        start, reset,clk, stop: in std_logic := '0';
        en: out std_logic;
        ckcs, ckns: out std_logic_vector(1 downto 0));
    end component;
    signal start, reset, clk, stop, en: std_logic;
    signal currentstate, nextstate: std_logic_vector(1 downto 0);
    
begin

    uut: pmfsm port map(start=>start, reset=>reset, clk=>clk, stop=>stop, en=>en, ckcs=>currentstate, ckns=>nextstate);
    
    process 
    begin
        clk <= '0';
        wait for 2 ns;
        clk <= '1';
        wait for 2 ns;
    end process;
     
    process 
    begin
        reset <= '1';
        wait for 2 ns;
        reset <= '0';
        wait for 200 ns;
    end process;
     
     process 
     begin
        stop <= '0'; start <= '0';
        wait for 5ns;
        start <= '1'; stop <= '0';
        wait for 5 ns;
        stop <= '1'; start <= '0';
        wait for 5 ns;
        start <= '1'; stop <= '0';
        wait for 5 ns;
        wait;
     end process;
end Behavioral;