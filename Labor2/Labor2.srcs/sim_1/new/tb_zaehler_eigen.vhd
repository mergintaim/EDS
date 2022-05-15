----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2022 17:02:11
-- Design Name: 
-- Module Name: tb_zaehler_eigen - Behavioral
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


entity tb_zaehler_eigen is

end tb_zaehler_eigen;

architecture Behavioral of tb_zaehler_eigen is

component zaehler_eigen
    Generic (length : integer;
    maxvalue : integer);
    Port (C_out : out std_logic;
          Q : out std_logic_vector (length-1 downto 0);
          clk : in std_logic;
          reset : in std_logic;
          enable : in std_logic;
          increment : in std_logic);
          
 end component;
signal s_clk: std_logic := '0';
signal rst: std_logic := '0';
signal enb: std_logic := '0';
signal inc: std_logic := '0';

begin


DUT : zaehler_eigen
generic map(length => 4, maxvalue => 10)
port map(clk => s_clk, reset => rst, enable => enb, increment => inc );

s_clk <= not s_clk after 5ns;

rst <= '1' after 50 ns, '0' after 60 ns;

enb <= '1' after 20 ns;

inc<= '1' after 65 ns,'0' after 70 ns,'1' after 75 ns,'0' after 80 ns;



end Behavioral;
