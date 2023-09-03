----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2023 12:40:52
-- Design Name: 
-- Module Name: coefficientmodule - Behavioral
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

entity coefficientmodule is
    generic(g_intial_value_of_x : std_logic := '0');
    Port(
        i_Clk         : in  std_logic;
        i_Forward_XOR : in  std_logic;
        i_K           : in  std_logic;
        i_Return_AND  : in  std_logic;
        i_rst         : in  std_logic;
        o_X           : out std_logic
    );
end coefficientmodule;

architecture Behavioral of coefficientmodule is
    component FlipFlop1
        port(
            o_Q          : out std_logic;
            i_Clk        : in  std_logic;
            i_sync_reset : in  std_logic;
            i_D          : in  std_logic
        );
    end component FlipFlop1;

    signal r_x         : std_logic := g_intial_value_of_x;
    signal w_after_xor : std_logic;
    signal w_after_and : std_logic;

begin
    FF1 : FlipFlop1 port map(o_Q => r_x, i_Clk => i_Clk, i_sync_reset => i_rst, i_D => w_after_xor);
    w_after_xor <= i_Forward_XOR XOR w_after_and;
    w_after_and <= i_K AND i_Return_AND;
    o_X         <= r_x;

end Behavioral;
