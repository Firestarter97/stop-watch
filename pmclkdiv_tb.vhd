library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pmclkdiv_tb is
end pmclkdiv_tb;

architecture Behavioral of pmclkdiv_tb is
    component pmclkdiv
    port(
        clkin: in std_logic;
        clkout: out std_logic);
    end component;
    signal clkin, clkout: std_logic;
begin
    uut: pmclkdiv port map(clkin => clkin, clkout => clkout);
    clocking: process
    begin
        clkin <= '1';
        wait for 2 ns; 
        clkin <= '0';
        wait for 2 ns;
    end process;
end Behavioral;
