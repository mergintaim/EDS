----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2023 18:08:46
-- Design Name: 
-- Module Name: DDS_Full - Behavioral
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

entity DDS_Full is
      Port ( CLK100MHZ : in std_logic;
            i_reset : in std_logic;
            i_SW : in std_logic_vector(15 downto 1);
            AUD_SD : out std_logic;
            AUD_PWM : out std_logic
             );
end DDS_Full;

architecture Behavioral of DDS_Full is

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

    signal w_signal_dds : std_logic_vector(15 - 1 downto 0) := (others => '0');

begin

    DDS_inst : component DDS
    generic map(
        g_wordlength           => 15,
        g_dimension_of_Vectors => 15,
        g_maxnumber            => 32768
    )
    port map(
        i_Clk           => CLK100MHZ,
        i_reset         => i_reset,
        i_sel_phasestep => i_SW,
        o_signal        => w_signal_dds
    );

PWM_inst : component PWM
    generic map(
        g_CNT_SAWTOOTHMAX => 1,
        g_maxnumber       => 32768,
        g_wordlength      => 15
    )
    port map(
        i_CLK            => CLK100MHZ,
        i_reset          => i_reset,
        i_increment      => std_logic_vector(to_unsigned(arg => 13, size => 15)),
        i_compare_signal => w_signal_dds,
        o_output         => AUD_PWM
    );

    AUD_SD <= '1';
end Behavioral;
