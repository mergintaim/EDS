----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2023 14:12:21
-- Design Name: 
-- Module Name: tb_Counter - Behavioral
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

entity tb_Counter is
    Generic(
        g_wordlength           : natural := 15;
        g_dimension_of_Vectors : natural := 15
    );
end tb_Counter;

architecture Test of tb_Counter is
    component Counter
        generic(
            g_maxnumber  : natural;
            g_wordlength : natural
        );
        port(
            i_Clk       : in  std_logic;
            i_reset     : in  std_logic;
            i_increment : in  std_logic_vector(0 to g_wordlength - 1);
            o_output    : out std_logic_vector(0 to g_wordlength - 1)
        );
    end component Counter;

    signal i_Clk           : std_logic := '0';
    signal i_reset         : std_logic := '0';
    signal i_sel_phasestep : std_logic_vector(0 to g_dimension_of_Vectors - 1);
    signal o_phase_output  : std_logic_vector(0 to g_dimension_of_Vectors - 1);

    signal s_phasestep   : integer := 0;
    signal s_phaseoutput : integer;

begin

    cnt : Counter
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

    s_phaseoutput   <= to_integer(unsigned(o_phase_output));
    i_sel_phasestep <= std_logic_vector(to_unsigned(s_phasestep, g_dimension_of_Vectors));
    s_phasestep     <= 15;

    i_Clk   <= not i_Clk after 10 ns;
    i_reset <= '1' after 2 ns, '0' after 3 ns;
end Test;
