----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 20:12:47
-- Design Name: 
-- Module Name: tb_Uhr - Behavioral
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

entity tb_Uhr is
end tb_Uhr;

architecture Behavioral of tb_Uhr is
component Uhr
  Port (clk : in std_logic;
  enable : in std_logic;
  reset : in std_logic ;
  seg7_output : out std_logic_vector(7 downto 0);
  seg7_pos : out std_logic_vector(7 downto 0) );
  end component;

signal clk : std_logic := '0';
signal enable : std_logic := '0';
signal reset : std_logic := '0';
signal seg7_output : std_logic_vector(7 downto 0);
signal seg7_pos : std_logic_vector(7 downto 0);
signal stop : boolean := false;

begin
clkprocess : process
begin
clk <= not clk;
wait for 1 ns;
if stop then
    wait;
end if;
end process;

startproc : process
begin
wait for 1 ns;
reset <= '1';
wait for 1 ns;
reset <= '0';
wait for 10 ns;
enable <= '1';
wait for 10 ns;
reset <= '1';
wait for 5ns;
reset <= '0';
wait for 1000000000 ns;
stop <= true;
wait;
end process;


DUT : Uhr
port map(clk => clk, enable => enable, reset => reset, seg7_output => seg7_output, seg7_pos => seg7_pos);
end Behavioral;
