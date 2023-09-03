----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2023 23:04:32
-- Design Name: 
-- Module Name: tb_DDS - Behavioral
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

entity tb_DDS is
    generic(
        g_wordlength : natural := 15
    );
--  Port ( );
end tb_DDS;

architecture Behavioral of tb_DDS is

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

    signal i_Clk : std_logic := '0';
    signal i_reset : std_logic := '0';
    signal i_sel_phasestep : std_logic_vector(15-1 downto 0) := (others => '0');
    signal o_signal : std_logic_vector(15-1 downto 0) := (others => '0');

    signal v_phasesstep : natural := 1;

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
            o_signal        => o_signal
        );

    v_phasesstep <= 1 after 5 ns, 3 after 60 ns, 55 after 150 ns;

    i_Clk <= not i_Clk after 1 ns;
    i_reset <= '1' after 2 ns, '0' after 3 ns;
    i_sel_phasestep <= std_logic_vector(to_unsigned(arg => v_phasesstep, size => 15));

end Behavioral;
