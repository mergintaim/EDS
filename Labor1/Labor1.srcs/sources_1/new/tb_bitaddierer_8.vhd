----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2022 19:54:02
-- Design Name: 
-- Module Name: tb_bitaddierer_8 - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_bitaddierer_8 is
end tb_bitaddierer_8;

architecture Behavioral of tb_bitaddierer_8 is
component bitaddierer_8 is
 Port ( vector_A,vector_B : in std_logic_vector (7 downto 0);
 C_in : in std_logic ;
 vector_Q : out std_logic_vector (7 downto 0);
            C_out : out std_logic);
end component;
signal vector_A,vector_B:std_logic_vector(7 downto 0);
signal C_in : std_logic ;
signal vector_Q : std_logic_vector (7 downto 0);
signal C_out : std_logic ;

begin
C_in <= '0';
process
variable zahl1 : integer;
variable zahl2 : integer;
variable ergebniss : integer;
--variable vergleichsergebnissvector : std_logic_vector;
begin
zahl1 := 32;
zahl2 := 37;
vector_A <=  std_logic_vector(to_unsigned(zahl1,8)) after 5 ns;
vector_B <=  std_logic_vector(to_unsigned(zahl2,8)) after 5 ns;
wait;


end process ;

DUT : bitaddierer_8 port map(vector_A => vector_A, vector_B => vector_B, C_in => C_in, vector_Q => vector_Q, C_out => C_out);
end Behavioral;
