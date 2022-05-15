----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2022 17:44:34
-- Design Name: 
-- Module Name: coefficientmodules - Behavioral
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

entity coefficientmodules is
  Port (clk : in std_logic;
  input : in std_logic;
  k_in : in std_logic;
  output : out std_logic;
  feedback_in : in std_logic;
  reset : in std_logic);
end coefficientmodules;

architecture Behavioral of coefficientmodules is
signal after_xor : std_logic;
signal after_and : std_logic;



begin
after_and <= feedback_in and k_in;
after_xor <= input XOR after_and;
flipflop : process(after_xor)
begin
if rising_edge(after_xor) then
    output <= after_xor;
    end if;
end process;



end Behavioral;
