library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_GoldenDeviceTest is
end tb_GoldenDeviceTest;

architecture Test of tb_GoldenDeviceTest is
    component PZG_SGA
        generic(
            g_length   : integer                             := 4;
            g_mode     : std_logic                           := '1';
            g_X_inital : std_logic_vector(g_length downto 0) := (others => '0');
            g_Kconfig  : std_logic_vector(g_length downto 0) := (g_length => '1', others => '0')
        );
        port(
            i_clk    : in  std_logic;
            i_rst    : in  std_logic;
            i_input  : in  std_logic;
            o_output : out std_logic_vector(g_length downto 1)
        );
    end component PZG_SGA;

    signal clk      : std_logic := '0';
    signal s_input  : std_logic;
    signal s_output : std_logic_vector(4 downto 1);
    signal s_rst    : std_logic := '0';

    signal w_after_PZG      : std_logic_vector(4 downto 1);
    signal w_after_SGA_GD   : std_logic_vector(4 downto 1);
    signal w_after_SGA_DUT  : std_logic_vector(4 downto 1);
    signal w_after_GD       : std_logic;
    signal w_after_DUT      : std_logic;
    signal r_outputcomplete : std_logic_vector(4 downto 1);
    signal r_start          : std_logic := '0';

begin
    SGA_GD : component PZG_SGA
        generic map(
            g_length  => 4,
            g_mode    => '1',
            -- g_X_inital => g_X_inital,
            g_Kconfig => "11001"
        )
        port map(
            i_clk    => clk,
            i_rst    => s_rst,
            i_input  => w_after_GD,
            o_output => w_after_SGA_GD
        );
    SGA_DUT : component PZG_SGA
        generic map(
            g_length  => 4,
            g_mode    => '1',
            -- g_X_inital => g_X_inital,
            g_Kconfig => "11001"
        )
        port map(
            i_clk    => clk,
            i_rst    => s_rst,
            i_input  => w_after_DUT,
            o_output => w_after_SGA_DUT
        );
    PZG : component PZG_SGA
        generic map(
            g_length  => 4,
            g_mode    => '1',
            -- g_X_inital => g_X_inital,
            g_Kconfig => "11001"
        )
        port map(
            i_clk    => clk,
            i_rst    => s_rst,
            i_input  => r_start,
            o_output => w_after_PZG
        );
    DUT : w_after_DUT <= and w_after_PZG;
    GD : w_after_GD   <= xor w_after_PZG;
    r_outputcomplete  <= w_after_SGA_DUT xnor w_after_SGA_GD;

    r_start <= '1' after 16 ns, '0' after 100 ns;
    s_rst   <= '1' after 2 ns, '0' after 15 ns;
    clk     <= not clk after 10 ns;
    s_input <= '1' after 0 ns, '0' after 12 ns, '1' after 17 ns, '0' after 20 ns, '1' after 32 ns, '0' after 42 ns, '1' after 65 ns, '0' after 100 ns;

end architecture Test;
