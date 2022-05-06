library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zaehler is
    Generic(length : in integer);
    Port( Clk : in std_logic;
    Reset : in std_logic;
    zaehlerstand : out std_logic_vector (length-1 downto 0);
    overflow : out std_logic;
    nachladewert : in std_logic_vector(length-1 downto 0);
    enable : in std_logic;
    set : in std_logic);
    end zaehler;