----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2022 15:23:38
-- Design Name: 
-- Module Name: Testaufbau - Behavioral
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

entity Testaufbau is
  Port (clk : in std_logic );
end Testaufbau;

architecture Behavioral of Testaufbau is
component Zufallsgenerator_galois
Generic(length : integer);
Port ( clk:in std_logic; X_out : out std_logic_vector(length-1 downto 1);
Ks_in : in std_logic_vector(length-1 downto 0));
end component;

signal output_prng : std_logic_vector(3 downto 1);
begin


PRNG : Zufallsgenerator_galois generic map (length => 4)
port map (clk => clk, Ks_in => "1100",X_out => output_prng);


end Behavioral;
