----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2023 13:09:27
-- Design Name: 
-- Module Name: Counter - Behavioral
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
USE ieee.math_real.log2;
USE ieee.math_real.ceil;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    generic(
        g_maxnumber : natural;
        g_wordlength : natural
    );
    Port(
        i_Clk : in std_logic;
        i_reset : in std_logic;
        i_increment : in std_logic_vector(0 to g_wordlength-1);
        o_output : out std_logic_vector(0 to g_wordlength-1)
    );
end Counter;

architecture Behavioral of Counter is
signal r_countervalue : unsigned (0 to g_wordlength-1);
signal r_increment : unsigned (0 to g_wordlength-1);

begin

    counter : process (i_Clk, i_reset) is
    begin
        if i_reset = '1' then
            r_countervalue <= (others => '0');
        elsif rising_edge(i_Clk) then
            r_countervalue <= r_countervalue + r_increment;
            if r_countervalue > (g_maxnumber-1) then
                r_countervalue <= 0 + r_countervalue - (g_maxnumber-1);  
            end if;
        end if;
    end process counter;
    
    r_increment <= unsigned(i_increment);
    o_output <= std_logic_vector(r_countervalue);

end Behavioral;
