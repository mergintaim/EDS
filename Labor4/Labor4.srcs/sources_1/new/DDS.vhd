----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2023 20:57:42
-- Design Name: 
-- Module Name: DDS - Behavioral
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

entity DDS is
    Generic(
        g_wordlength           : natural := 15;
        g_dimension_of_Vectors : natural := 15;
        g_maxnumber            : natural := 32768
    );
    Port(
        i_Clk           : in  std_logic;
        i_reset         : in  std_logic;
        i_sel_phasestep : in  std_logic_vector(g_wordlength - 1 downto 0);
        o_signal        : out std_logic_vector(g_wordlength - 1 downto 0)
    );
end DDS;

architecture Behavioral of DDS is

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

    component blk_mem_gen_0
        port(
            clka  : IN  STD_LOGIC;
            ena   : IN  STD_LOGIC;
            wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
            dina  : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
        );
    end component blk_mem_gen_0;

    component blk_mem_gen_ROM
        port(
            clka  : IN  STD_LOGIC;
            ena   : IN  STD_LOGIC;
            addra : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
        );
    end component blk_mem_gen_ROM;

    signal w_transfer_counter_LUT : std_logic_vector(g_wordlength - 1 downto 0);

    constant c_CNT_40KHZ : natural := 1250;
    constant c_CNT_PHASEAKKU : natural := 1526;

    constant c_CNT_100HZ : natural := 500000;
    constant c_CNT_50HZ  : natural := 1000000;
    constant c_CNT_10HZ  : natural := 5000000;
    constant c_CNT_1HZ   : natural := 50000000;

    signal r_CNT_1HZ   : natural range 0 to c_CNT_1HZ;
    signal r_CNT_40KHZ   : natural range 0 to c_CNT_40KHZ;
    signal r_CNT_PHASEAKKU  : natural range 0 to c_CNT_PHASEAKKU;

    signal r_TOGGLE_1HZ   : std_logic := '0';  
    signal r_TOGGLE_40KHZ  : std_logic := '0';  
    signal r_TOGGLE_PHASEAKKU  : std_logic := '0';  

begin
    p_40_KHZ : process (i_Clk) is
        begin
          if rising_edge( i_Clk) then
            if r_CNT_40KHZ = c_CNT_40KHZ-1 then  -- -1, since counter starts at 0
              r_TOGGLE_40KHZ <= not r_TOGGLE_40KHZ;
              r_CNT_40KHZ    <= 0;
            else
              r_CNT_40KHZ <= r_CNT_40KHZ + 1;
            end if;
          end if;
        end process p_40_KHZ;

    p_1HZ : process (i_Clk) is
        begin
          if rising_edge( i_Clk) then
            if r_CNT_1HZ = c_CNT_1HZ-1 then  -- -1, since counter starts at 0
              r_TOGGLE_1HZ <= not r_TOGGLE_1HZ;
              r_CNT_1HZ    <= 0;
            else
              r_CNT_1HZ <= r_CNT_1HZ + 1;
            end if;
          end if;
        end process p_1HZ;

    p_PHASEAKKU : process (i_Clk) is
        begin
          if rising_edge( i_Clk) then
            if r_CNT_PHASEAKKU = c_CNT_PHASEAKKU-1 then  -- -1, since counter starts at 0
              r_TOGGLE_PHASEAKKU <= not r_TOGGLE_PHASEAKKU;
              r_CNT_PHASEAKKU    <= 0;
            else
              r_CNT_PHASEAKKU <= r_CNT_PHASEAKKU + 1;
            end if;
          end if;
        end process p_PHASEAKKU;

    Counter_inst : component Counter
        generic map(
            g_maxnumber  => g_maxnumber,
            g_wordlength => g_wordlength
        )
        port map(
            i_Clk       => r_TOGGLE_PHASEAKKU,
            i_reset     => i_reset,
            i_increment => i_sel_phasestep,
            o_output    => w_transfer_counter_LUT
        );

    -- LUT_RAM : component blk_mem_gen_0
    --     port map(
    --         clka  => i_Clk,
    --         ena   => '1',
    --         wea   => "0",
    --         addra => r_transfer_counter_LUT,
    --         dina  => (others => '0'),
    --         douta => douta
    --     );

    LUT_ROM : component blk_mem_gen_ROM
        port map(
            clka  => r_TOGGLE_40KHZ,
            ena   => '1',
            addra => w_transfer_counter_LUT,
            douta => o_signal
        );

end Behavioral;
