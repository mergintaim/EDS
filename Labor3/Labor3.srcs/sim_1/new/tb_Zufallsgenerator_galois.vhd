----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2022 20:59:55
-- Design Name: 
-- Module Name: tb_Zufallsgenerator_galois - Behavioral
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

entity tb_Zufallsgenerator_galois is
end tb_Zufallsgenerator_galois;

architecture Behavioral of tb_Zufallsgenerator_galois is
component Zufallsgenerator_galois
Generic(length : integer);
Port ( clk:in std_logic; X_out : out std_logic_vector(length downto 1);
Ks_in : in std_logic_vector(length downto 0);
start : in std_logic);
end component;

signal clk : std_logic := '0';
signal output_prng : std_logic_vector (4 downto 1) := "0000";
signal start : std_logic := '0';

begin
PRNG : Zufallsgenerator_galois generic map (length => 4)
port map (clk => clk, Ks_in => "11001",X_out => output_prng, start => start);

clk <= not clk after 50 ns;
start <= '1' after 250 ns, '0' after 2000 ns;

end Behavioral;
