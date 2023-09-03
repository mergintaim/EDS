----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2023 12:24:36
-- Design Name: 
-- Module Name: FlipFlop1 - Behavioral
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

entity FlipFlop1 is
    Port(
        o_Q          : out std_logic;
        i_Clk        : in  std_logic;
        i_sync_reset : in  std_logic;
        i_D          : in  std_logic
    );
end FlipFlop1;

architecture Behavioral of FlipFlop1 is

begin
    process(i_Clk, i_sync_reset)
    begin
        if (i_sync_reset = '1') then
            o_Q <= '0';
        elsif (rising_edge(i_Clk)) then
            o_Q <= i_D;
        end if;
    end process;

end Behavioral;

