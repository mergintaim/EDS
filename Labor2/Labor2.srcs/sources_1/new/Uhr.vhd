----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 19:03:07
-- Design Name: 
-- Module Name: Uhr - Behavioral
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



entity Uhr is
  Port (clk : in std_logic;
  enable : in std_logic;
  reset : in std_logic ;
  seg7_output : out std_logic_vector(7 downto 0);
  seg7_pos : out std_logic_vector(7 downto 0) );
end Uhr;

architecture Behavioral of Uhr is

--Zaehler entity
component clockcounters
  Port (clk :in std_logic;
  reset : in std_logic;
  enable : in std_logic;
  digit_0 : out std_logic_vector (3 downto 0);
  digit_1 : out std_logic_vector (3 downto 0);
  digit_2 : out std_logic_vector (3 downto 0);
  digit_3 : out std_logic_vector (3 downto 0);
  digit_4 : out std_logic_vector (3 downto 0);
  digit_5 : out std_logic_vector (3 downto 0)
   );
end component;
-- sevenseg
component outsevenseg
  Port (Number_s : in STD_LOGIC_VECTOR (3 downto 0);
Number_10s : in STD_LOGIC_VECTOR (3 downto 0);
Number_m : in STD_LOGIC_VECTOR (3 downto 0);
Number_10m : in STD_LOGIC_VECTOR (3 downto 0);
Number_h : in STD_LOGIC_VECTOR (3 downto 0);
Number_10h : in STD_LOGIC_VECTOR (3 downto 0);
Clk : in STD_LOGIC;
Position : out STD_LOGIC_VECTOR (7 downto 0);
Number_out : out STD_LOGIC_VECTOR (7 downto 0) );
end component;

component clock_divider_eigen
Port ( clk_in : in std_logic;
clk10kHz : out std_logic;
clk1Hz : out std_logic;
reset : in std_logic);
end component;

signal clk10kHz : std_logic;
signal clk1Hz : std_logic;

--Signale für einzelne Anzeigen
signal sekunden : STD_LOGIC_VECTOR (3 downto 0);
signal sekunden_10 : STD_LOGIC_VECTOR (3 downto 0);
signal minuten : STD_LOGIC_VECTOR (3 downto 0);
signal minuten_10 : STD_LOGIC_VECTOR (3 downto 0);
signal stunden : STD_LOGIC_VECTOR (3 downto 0);
signal stunden_10 : STD_LOGIC_VECTOR (3 downto 0);



begin
clock_divider : clock_divider_eigen
port map (clk_in => clk,
clk10kHz => clk10kHz,
clk1Hz => clk1Hz,
reset => reset);

uhrzaehler : clockcounters
port map(clk => clk1Hz, reset => reset, enable => enable,
digit_0 => sekunden, digit_1 => sekunden_10,
digit_2 => minuten, digit_3 => minuten_10,
digit_4 => stunden , digit_5 => stunden_10);

segment7 : outsevenseg
port map (clk => clk10kHz,
Number_s => sekunden,
 Number_10s => sekunden_10,
 Number_m => minuten,
 Number_10m => minuten_10,
 Number_h => stunden,
 Number_10h => stunden_10,
 Position => seg7_pos,
Number_out => seg7_output );



end Behavioral;
