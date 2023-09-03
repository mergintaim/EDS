library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SGA is
end tb_SGA;

architecture Test of tb_SGA is
    component PZG_SGA
        generic(
            g_length   : integer                             := 5;
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
    signal s_output : std_logic_vector(6 downto 1);
    signal s_rst  : std_logic := '0';

begin
    SGA : component PZG_SGA
        generic map(
            g_length  => 6,
            g_mode    => '1',
            -- g_X_inital => g_X_inital,
            g_Kconfig => "1010001"
        )
        port map(
            i_clk    => clk,
            i_rst    => s_rst,
            i_input  => s_input,
            o_output => s_output
        );
    s_rst <= '1' after 2 ns, '0' after 15 ns;
    clk     <= not clk after 10 ns;
    s_input <= '1' after 0 ns, '0' after 12 ns, '1' after 17 ns, '0' after 20 ns, '1' after 32 ns, '0' after 42 ns, '1' after 65 ns, '0' after 100 ns;

end architecture Test;
