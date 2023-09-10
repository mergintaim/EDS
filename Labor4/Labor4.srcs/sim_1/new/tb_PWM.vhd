----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2023 17:30:24
-- Design Name: 
-- Module Name: tb_PWM - Behavioral
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

entity tb_PWM is
    generic(g_wordlength : natural := 15);
    --  Port ( );
end tb_PWM;

architecture Behavioral of tb_PWM is

    component PWM
        generic(
            g_CNT_SAWTOOTHMAX : natural := 0;
            g_maxnumber       : natural := 32500;
            g_wordlength      : natural := 15
        );
        port(
            i_CLK            : in  std_logic;
            i_reset          : in  std_logic;
            i_increment      : in  std_logic_vector(g_wordlength - 1 downto 0);
            i_compare_signal : in  std_logic_vector(g_wordlength - 1 downto 0);
            o_output         : out std_logic
        );
    end component PWM;

    component DDS
        generic(
            g_wordlength           : natural := 15;
            g_dimension_of_Vectors : natural := 15;
            g_maxnumber            : natural := 32768
        );
        port(
            i_Clk           : in  std_logic;
            i_reset         : in  std_logic;
            i_sel_phasestep : in  std_logic_vector(g_wordlength - 1 downto 0);
            o_signal        : out std_logic_vector(g_wordlength - 1 downto 0)
        );
    end component DDS;

    signal i_Clk           : std_logic                         := '0';
    signal i_reset         : std_logic                         := '0';
    signal i_sel_phasestep : std_logic_vector(15 - 1 downto 0) := (others => '0');
    signal w_signal_dds    : std_logic_vector(15 - 1 downto 0) := (others => '0');

    signal v_phasesstep : natural := 1;

    signal w_output : std_logic;

begin

    DDS_inst : component DDS
        generic map(
            g_wordlength           => 15,
            g_dimension_of_Vectors => 15,
            g_maxnumber            => 32768
        )
        port map(
            i_Clk           => i_Clk,
            i_reset         => i_reset,
            i_sel_phasestep => i_sel_phasestep,
            o_signal        => w_signal_dds
        );

    PWM_inst : component PWM
        generic map(
            g_CNT_SAWTOOTHMAX => 1,
            g_maxnumber       => 32768,
            g_wordlength      => g_wordlength
        )
        port map(
            i_CLK            => i_Clk,
            i_reset          => i_reset,
            i_increment      => std_logic_vector(to_unsigned(arg => 13, size => 15)),
            i_compare_signal => w_signal_dds,
            o_output         => w_output
        );

    i_Clk   <= not i_Clk after 5 ns;
    i_reset <= '1' after 2 ns, '0' after 3 ns;

    v_phasesstep    <= 0 after 5 ns, 500 after 1 ms, 941 after 10 ms, 10000 after 15 ms;
    i_sel_phasestep <= std_logic_vector(to_unsigned(arg => v_phasesstep, size => 15));

end Behavioral;
