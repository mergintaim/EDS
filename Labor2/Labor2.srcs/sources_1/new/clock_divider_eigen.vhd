----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 15:51:30
-- Design Name: 
-- Module Name: clock_divider_eigen - Behavioral
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

entity clock_divider_eigen is
Port ( clk_in : in std_logic;
clk10kHz : out std_logic;
clk1Hz : out std_logic;
reset : in std_logic);

end clock_divider_eigen;

architecture Behavioral of clock_divider_eigen is
component zaehler_eigen
 Generic (length : integer := 2;
 maxvalue : integer );
 Port (C_out : out std_logic;
 Q : out std_logic_vector (length-1 downto 0);
 clk : in std_logic;
 reset : in std_logic;
 enable : in std_logic;
 increment : in std_logic
  );
  end component;
signal clk10kHz_s : std_logic;
signal clk1Hz_s : std_logic ; 
constant enable_c : std_logic := '1';
constant length_c : integer := 2;
constant maxvalue_c : integer := 10000;
begin

zaehler_10kHz : zaehler_eigen 
generic map(length => length_c,
maxvalue => maxvalue_c)
port map(C_out => clk10kHz_s,
 Q => open,
 clk => clk_in,
 reset => reset,
 enable => enable_c,
 increment => '0');
 
zaehler_1Hz : zaehler_eigen 
generic map(length => length_c,
maxvalue => maxvalue_c)
port map(C_out => clk1Hz_s,
 Q => open,
 clk => clk10kHz_s,
 reset => reset,
 enable => enable_c,
 increment => '0');
 
 clk10kHz <= clk10kHz_s;
 clk1Hz <= clk1Hz_s;

end Behavioral;
