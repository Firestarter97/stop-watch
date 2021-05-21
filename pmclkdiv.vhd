Library ieee; 
Use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.std_logic_arith.all;
entity pmclkdiv is 
    port( 
    clkin: in std_logic; 
    clkout:  out std_logic := '0'); 
end pmclkdiv; 
architecture Behavioral of pmclkdiv is

signal cnt: std_logic_vector(3 downto 0):= "0000";
begin
    process
    begin
        wait until rising_edge(clkin);
            if (cnt = "1001") then
                cnt <= "0000";
                clkout <= '1';
            else
                clkout <= '0';
                cnt <= (unsigned (cnt) + 1);
        end if;
    end process;
end Behavioral;