----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2023 14:26:58
-- Design Name: 
-- Module Name: PWM - Behavioral
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

entity PWM is
    generic(g_CNT_SAWTOOTHMAX : natural := 0;
            g_maxnumber       : natural := 32500; -- carefull dependant on increment being 13
            g_wordlength      : natural := 15);
    Port(i_CLK            : in  std_logic;
         i_reset          : in  std_logic;
         i_increment      : in  std_logic_vector(g_wordlength - 1 downto 0);
         i_compare_signal : in  std_logic_vector(g_wordlength - 1 downto 0);
         o_output         : out std_logic
        );
end PWM;

architecture Behavioral of PWM is

    component Counter
        generic(
            g_maxnumber  : natural;
            g_wordlength : natural
        );
        port(
            i_Clk       : in  std_logic;
            i_reset     : in  std_logic;
            i_increment : in  std_logic_vector(g_wordlength - 1 downto 0);
            o_output    : out std_logic_vector(g_wordlength - 1 downto 0)
        );
    end component Counter;

    -- constant c_CNT_SAWTOOTHMAX : integer := 2500;

    -- signal r_CNT_SAWTOOTHMAX : natural range 0 to c_CNT_SAWTOOTHMAX;

    -- signal r_TOGGLE_SAWTOOTHMAX : std_logic := '0';

    signal w_counter_output : std_logic_vector(g_wordlength - 1 downto 0);

    signal w_output : std_logic;
begin
    -- p_SAWTOOTHMAX : process (i_Clk) is
    --     begin
    --       if rising_edge( i_Clk) then
    --         if r_CNT_SAWTOOTHMAX = c_CNT_SAWTOOTHMAX-1 then  -- -1, since counter starts at 0
    --           r_TOGGLE_SAWTOOTHMAX <= not r_TOGGLE_SAWTOOTHMAX;
    --           r_CNT_SAWTOOTHMAX    <= 0;
    --         else
    --           r_CNT_SAWTOOTHMAX <= r_CNT_SAWTOOTHMAX + 1;
    --         end if;
    --       end if;
    --     end process p_SAWTOOTHMAX;

    Counter_inst : component Counter
        generic map(
            g_maxnumber  => g_maxnumber,
            g_wordlength => g_wordlength
        )
        port map(
            i_Clk       => i_CLK,
            i_reset     => i_reset,
            i_increment => i_increment,
            o_output    => w_counter_output
        );

    p_comparison : process(w_counter_output, i_compare_signal) is
    begin
        if w_counter_output < i_compare_signal then
            w_output <= '1';
        else
            w_output <= '0';
        end if;
    end process p_comparison;

    o_output <= w_output;

end Behavioral;
