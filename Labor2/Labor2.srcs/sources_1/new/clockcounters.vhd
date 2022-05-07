----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 16:39:09
-- Design Name: 
-- Module Name: clockcounters - Behavioral
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

entity clockcounters is
  Port (clk :in std_logic;
  reset : in std_logic;
  enable : in std_logic;
  minutes : in std_logic;
  hours : in std_logic;
  digit_0 : out std_logic_vector (3 downto 0);
  digit_1 : out std_logic_vector (3 downto 0);
  digit_2 : out std_logic_vector (3 downto 0);
  digit_3 : out std_logic_vector (3 downto 0);
  digit_4 : out std_logic_vector (3 downto 0);
  digit_5 : out std_logic_vector (3 downto 0)
   );
end clockcounters;

architecture Behavioral of clockcounters is
component zaehler_eigen
 Generic (length : integer;
 maxvalue : integer );
 Port (C_out : out std_logic;
 Q : out std_logic_vector (length-1 downto 0);
 clk : in std_logic;
 reset : in std_logic;
 enable : in std_logic;
 increment : in std_logic
  );
  end component;
constant length_mod_10_s : integer := 4;
constant maxvalue_mod10_s : integer := 9;
constant length_mod_7_s : integer := 2;
constant maxvalue_mod7_s : integer := 5;
constant length_mod_3_s : integer := 1;
constant maxvalue_mod3_s : integer := 2;
  signal carrys_s : std_logic_vector (5 downto 0);
  signal reset_s : std_logic_vector(5 downto 0);
  signal resetflag : std_logic;
  signal enable_S : std_logic_vector (5 downto 0);
  signal digit_5_s : std_logic_vector (3 downto 0);
  signal digit_4_s : std_logic_vector (3 downto 0);
begin

zaehler_sek_mod10 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod10_s)
port map(C_out => carrys_s(0),
 Q => digit_0,
 clk => clk,
 reset => reset_s(0),
 enable => enable_s(0),
 increment => '0');
 
zaehler_sek_mod7 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod7_s)
port map(C_out => carrys_s(1),
 Q => digit_1,
 clk => carrys_s(0),
 reset => reset_s(1),
 enable => enable_s(1),
 increment => '0');
 
zaehler_min_mod10 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod10_s)
port map(C_out => carrys_s(2),
 Q => digit_2,
 clk => carrys_s(1),
 reset => reset_s(2),
 enable => enable_s(2),
 increment => minutes);
 
zaehler_min_mod7 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod7_s)
port map(C_out => carrys_s(3),
 Q => digit_3,
 clk => carrys_s(2),
 reset => reset_s(3),
 enable => enable_s(3),
 increment => '0');
 
zaehler_hor_mod10 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod10_s)
port map(C_out => carrys_s(4),
 Q => digit_4_s,
 clk => carrys_s(3),
 reset => reset_s(4),
 enable => enable_s(4),
 increment => hours);
 
zaehler_hor_mod3 : zaehler_eigen 
generic map(length => length_mod_10_s,
maxvalue => maxvalue_mod3_s)
port map(C_out => carrys_s(5),
 Q => digit_5_s,
 clk => carrys_s(4),
 reset => reset_s(5),
 enable => enable_s(5),
 increment => '0');
 
 process (reset) --reset whole clock, reset is clicked
 begin
 if reset = '1' then 
    reset_s <= "111111";
 else 
    reset_s <= "000000";
 end if;
 end process;
 
 process (enable) --reset whole clock, reset is clicked
 begin
 if enable = '1' then 
    enable_S <= "111111";
 else 
    enable_S <= "000000";
 end if;
 end process;
 
---resetaftermidnight : process (digit_5_s)
--begin
--if (digit_4_s = "0100") and digit_5_s = "0010" then
--    reset_s <= "110000";
--else
--    reset_s <= "000000";
--end if;
--end process;
digit_5 <= digit_5_s;
digit_4 <= digit_4_s;


end Behavioral;
