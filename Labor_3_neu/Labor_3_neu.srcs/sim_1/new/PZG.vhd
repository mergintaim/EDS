----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2023 19:20:28
-- Design Name: 
-- Module Name: PZG - Behavioral
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

entity PZG is
    port(
        i_CLK100MHZ    : in  std_logic;
        i_BTNC    : in  std_logic;
        i_BTNU  : in  std_logic;
        o_LED : out std_logic_vector(4 downto 1)

    );
end PZG;

architecture Behavioral of PZG is
    constant c_CNT_100HZ : natural := 500000;
    constant c_CNT_50HZ  : natural := 1000000;
    constant c_CNT_10HZ  : natural := 5000000;
    constant c_CNT_1HZ   : natural := 50000000;

    signal r_CNT_1HZ   : natural range 0 to c_CNT_1HZ;

    signal r_TOGGLE_1HZ   : std_logic := '0';  

    component PZG_SGA
        generic(
            g_length   : integer;
            g_mode     : std_logic;
            g_X_inital : std_logic_vector(g_length downto 0);
            g_Kconfig  : std_logic_vector(g_length downto 0)
        );
        port(
            i_clk    : in  std_logic;
            i_rst    : in  std_logic;
            i_input  : in  std_logic;
            o_output : out std_logic_vector(g_length downto 1)
        );
    end component PZG_SGA;
begin
    p_1_HZ : process (i_CLK100MHZ) is
        begin
          if rising_edge( i_CLK100MHZ) then
            if r_CNT_1HZ = c_CNT_1HZ-1 then  -- -1, since counter starts at 0
              r_TOGGLE_1HZ <= not r_TOGGLE_1HZ;
              r_CNT_1HZ    <= 0;
            else
              r_CNT_1HZ <= r_CNT_1HZ + 1;
            end if;
          end if;
        end process p_1_HZ;

    PZG : component PZG_SGA
        generic map(
            g_length  => 4,
            g_mode    => '1',
            g_X_inital => (others => '1'),
            g_Kconfig => "11001"
        )
        port map(
            i_clk    => r_TOGGLE_1HZ,
            i_rst    => i_BTNC,
            i_input  => i_BTNU,
            o_output => o_LED
        );

end Behavioral;
