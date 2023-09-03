----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2023 13:09:27
-- Design Name: 
-- Module Name: Phasenakkumulator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Phasenakkumulator is
    Generic(
        g_wordlength : natural := 15;
        g_dimension_of_Vectors: natural := 15
    );
    Port(
        i_Clk : in std_logic;
        i_reset : in std_logic;
        i_sel_phasestep : in std_logic_vector(0 to g_dimension_of_Vectors-1);
        o_phase_output : out std_logic_vector(0 to g_dimension_of_Vectors-1)
    );
end Phasenakkumulator;

architecture Behavioral of Phasenakkumulator is
component Counter
    generic(
        g_maxnumber  : natural;
        g_wordlength : natural
    );
    port(
        i_Clk       : in  std_logic;
        i_reset     : in  std_logic;
        i_increment : in  std_logic_vector(0 to g_wordlength-1);
        o_output    : out std_logic_vector(0 to g_wordlength-1)
    );
end component Counter;

begin

cnt: Counter
    generic map(
        g_maxnumber  => 32768,
        g_wordlength => g_dimension_of_Vectors
    )
    port map(
        i_Clk       => i_Clk,
        i_reset     => i_reset,
        i_increment => i_sel_phasestep,
        o_output    => o_phase_output
    );

end Behavioral;
