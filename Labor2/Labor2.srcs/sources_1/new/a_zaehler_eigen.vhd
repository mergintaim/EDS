----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2022 18:07:52
-- Design Name: 
-- Module Name: a_zaehler_eigen - Behavioral
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
use IEEE.numeric_std.ALL;

entity zaehler_eigen is
 Generic (length : integer;
 maxvalue : integer);
 Port (C_out : out std_logic;
 Q : out std_logic_vector (length-1 downto 0);
 clk : in std_logic;
 reset : in std_logic;
 enable : in std_logic;
 increment : in std_logic
  );
end zaehler_eigen;

architecture a_zaehler_eigen of zaehler_eigen is
signal Q_out : std_logic_vector (length-1 downto 0);
signal counter : integer;
begin

process(clk,reset,enable,increment)
--variable maxvalue : integer := maxvalue;

begin
    if reset = '1' then
        counter <= 0;
        C_out <= '0';
    elsif clk'event and clk = '1' and enable = '1' then 
        
        if counter > maxvalue-1 then
            counter <=0;
            C_out <= '1';
        else
            counter <= counter +1;
            C_out <= '0';
        end if;
    end if;

end process;

--incrementnter : process(increment)
--begin
--if increment'event and increment = '1' then
--        if counter > maxvalue-1 then
--              counter <=0;
--              C_out <= '1';
--         else
--              counter <= counter +1;
--              C_out <= '0';
--         end if;        
--    end if;   
--end process;
Q <= Q_out;
Q_out <= std_logic_vector(to_unsigned(counter,length));  

end a_zaehler_eigen ;
