----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 17:16:43
-- Design Name: 
-- Module Name: 7_seg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity outsevenseg is
  Port (Number_s : in STD_LOGIC_VECTOR (3 downto 0);
Number_10s : in STD_LOGIC_VECTOR (3 downto 0);
Number_m : in STD_LOGIC_VECTOR (3 downto 0);
Number_10m : in STD_LOGIC_VECTOR (3 downto 0);
Number_h : in STD_LOGIC_VECTOR (3 downto 0);
Number_10h : in STD_LOGIC_VECTOR (3 downto 0);
Clk : in STD_LOGIC;
Position : out STD_LOGIC_VECTOR (7 downto 0);
Number_out : out STD_LOGIC_VECTOR (7 downto 0) );
end outsevenseg;

architecture Behavioral of outsevenseg is


type ram_type is array (9 downto 0) of std_logic_vector (7 downto 0);
constant Anzeige: ram_type:=( x"90", x"80", x"f8", x"82", x"92" , x"99", x"B0", x"a4", x"f9" ,x"C0");
Signal b: Integer :=0;
begin
Seg: process(Clk)
begin
if (clk'event and clk='1') then
if (b=0) then Position<=x"fe"; Number_out<= Anzeige(conv_integer(Number_s)); end if;
if (b=1) then Position<=x"fd"; Number_out<= Anzeige(conv_integer(Number_10s)); end if;
if (b=2) then Position<=x"fb"; Number_out<= Anzeige(conv_integer(Number_m)); end if;
if (b=3) then Position<=x"f7"; Number_out<= Anzeige(conv_integer(Number_10m)); end if;
if (b=4) then Position<=x"ef"; Number_out<= Anzeige(conv_integer(Number_h)); end if;
if (b=5) then Position<=x"df"; Number_out<= Anzeige(conv_integer(Number_10h)); end if;
if (b=6) then Position<=x"bf"; Number_out<= Anzeige(0); end if;
if (b=7) then Position<=x"7f"; Number_out<= Anzeige(0); end if;
b<= (b+1) mod 8;
end if;
end process;
end Behavioral;
