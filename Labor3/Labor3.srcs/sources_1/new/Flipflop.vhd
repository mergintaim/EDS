----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2022 18:14:47
-- Design Name: 
-- Module Name: Flipflop - Behavioral
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

entity Flipflop is
 Port (
      Q : out std_logic;    
      Clk :in std_logic;  
   sync_reset: in std_logic;  
      D :in  std_logic    
   );
end Flipflop;

architecture Behavioral of Flipflop is

begin
process(Clk,sync_reset)
 begin 
     if(sync_reset='1') then 
   Q <= '0';
     elsif(rising_edge(Clk)) then
   Q <= D; 
  end if;      
 end process;  

end Behavioral;
