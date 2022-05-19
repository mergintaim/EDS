----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2022 20:40:57
-- Design Name: 
-- Module Name: tb_Testaufbau - Behavioral
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

entity tb_Testaufbau is
end tb_Testaufbau;


architecture Behavioral of tb_Testaufbau is
component Testaufbau
Port (clk : in std_logic;
  sga1_out : out std_logic_vector (4 downto 1);
  sga2_out : out std_logic_vector (4 downto 1) );
end component;
signal sga1_out : std_logic_vector (4 downto 1);
signal sga2_out : std_logic_vector (4 downto 1);
signal clk : std_logic := '0';
begin
DUT : Testaufbau 
port map(clk => clk, sga1_out => sga1_out, sga2_out => sga2_out  );

clk <= not clk after 50 ns;

end Behavioral;
