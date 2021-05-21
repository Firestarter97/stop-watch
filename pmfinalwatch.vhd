----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2020 09:35:51 PM
-- Design Name: 
-- Module Name: pmfinalwatch - Behavioral
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

entity pmfinalwatch is
    port (
        start,stop,clk,reset: in std_logic; 
        y2,y1,y0: out std_logic_vector(3 downto 0);
        currentstate, nextstate: out std_logic_vector(1 downto 0)
    );
end pmfinalwatch;

architecture Behavioral of pmfinalwatch is

component pmclkdiv is
port( 
    clkin: in std_logic; 
    clkout:  out std_logic := '0'); 
end component; 

component pmfsm is
port (
     start, reset,clk, stop: in std_logic := '0';
     en: out std_logic;
     ckcs, ckns: out std_logic_vector(1 downto 0));
end component;

component pmwatch is
port ( 
    en,clk,reset: in std_logic; 
    y2,y1,y0: out std_logic_vector(3 downto 0));
end component;

signal clk2,en: std_logic;
begin

g1: pmclkdiv port map(clkin => clk, clkout => clk2);
g2: pmfsm port map(start => start, stop => stop,en => en, clk => clk2, reset => reset, ckcs => currentstate, ckns => nextstate);
g3: pmwatch port map(en => en, clk => clk2, reset => reset, y2 => y2, y1 => y1, y0 => y0);

end Behavioral;