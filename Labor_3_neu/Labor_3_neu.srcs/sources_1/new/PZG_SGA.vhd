library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PZG_SGA is
    generic(
        g_length   : integer                             := 5;
        g_mode     : std_logic                           := '1'; --Switch for Mode, 0 is PZG, 1 is SGA
        g_X_inital : std_logic_vector(g_length downto 0) := (others => '1');
        g_Kconfig  : std_logic_vector(g_length downto 0) := (g_length => '1', others => '0')
    );
    port(
        i_Clk    : in  std_logic;
        i_rst    : in  std_logic;
        i_input  : in  std_logic;
        o_output : out std_logic_vector(g_length downto 1)
    );
end entity PZG_SGA;

architecture Behavioral of PZG_SGA is
    component coefficientmodule
        generic(g_intial_value_of_x : std_logic := '0');
        port(
            i_Clk         : in  std_logic;
            i_Forward_XOR : in  std_logic;
            i_K           : in  std_logic;
            i_Return_AND  : in  std_logic;
            i_rst         : in  std_logic;
            o_X           : out std_logic
        );
    end component coefficientmodule;

    signal r_X                     : std_logic_vector(g_length downto 0) := g_X_inital;
    signal w_return_after_last_end : std_logic                           := '1';
    signal r_Kconfig               : std_logic_vector(g_length downto 0) := g_Kconfig(g_length downto 0);

begin
    r_X(0) <= i_input AND g_mode;
    -- wenn pzg muss r_X_0 = 0 sein

    PZG_SGA : for i in g_length downto 1 generate
        coeff : coefficientmodule
            generic map(
                g_intial_value_of_x => g_X_inital(i)
            )
            port map(
                i_Clk         => i_Clk,
                i_Forward_XOR => r_X(i - 1),
                i_K           => r_Kconfig(i - 1),
                i_Return_AND  => w_return_after_last_end,
                i_rst         => i_rst,
                o_X           => r_X(i)
            );

    end generate PZG_SGA;

    w_return_after_last_end <= r_X(g_length) AND r_Kconfig(g_length);

    o_output <= r_X(g_length downto 1);

end architecture Behavioral;

