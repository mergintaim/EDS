----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2022 18:04:39
-- Design Name: 
-- Module Name: tb_volladdierer - Behavioral
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

entity tb_volladdierer is
end tb_volladdierer;

architecture Behavioral of tb_volladdierer is
component Volladierer
    PORT(A,B,C_in : in std_logic ;
        Q, C_out : out std_logic );
    end component;        

signal A,B,C_in,Q,C_out : std_logic ;
begin
A <= '0' after 0 ns,
    '1' after 100 ns;
    
B <= '0' after 0 ns,
    '1' after 50 ns,
    '0' after 100 ns,
    '1' after 150 ns;
    
C_in <= '0' after 0 ns,
    '1' after 25 ns,
    '0' after 50 ns,
    '1' after 75 ns,
    '0' after 100 ns,
    '1' after 125 ns,
    '0' after 150 ns,
    '1' after 175 ns;
    
    
DUT : Volladierer port map(A => A,B => B,C_in => C_in,Q => Q,C_out  => C_out);
    
    



end Behavioral;
