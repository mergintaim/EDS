library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;


architecture Behavioral of zaehler is

signal zaehler_s : std_logic_vector(length downto 0) := (others => '0');

begin
    process(clk,Reset)
    
    begin
        if (Reset = '1') then
            zaehler_s <= '0' & nachladewert;
        elsif (clk'event AND clk='1') then
            if(set = '1') then
                zaehler_s <= '0' & nachladewert;
            elsif (enable = '1') then
                zaehler_s <= zaehler_s + 1;
            end if;
        end if; 
    end process;
    overflow <= zaehler_s (length);
    zaehlerstand <= zaehler_s(length-1 downto 0);
end Behavioral;
