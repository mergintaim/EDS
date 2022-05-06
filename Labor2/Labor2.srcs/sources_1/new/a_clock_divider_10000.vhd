library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;



architecture Behavioral of clock_divider is
component zaehler
Generic(length : in integer);
    Port( Clk : in std_logic;
    Reset : in std_logic;
    zaehlerstand : out std_logic_vector (length-1 downto 0);
    overflow : out std_logic;
    nachladewert : in std_logic_vector(length-1 downto 0);
    enable : in std_logic;
    set : in std_logic);
end component;

signal length_10KHz: integer := 32;
signal reset_10KHz : std_logic;
signal zaehlerstand_10KHz : std_logic_vector (length_10KHz-1 downto 0); 
signal overflow_10KHz : std_logic;
signal nachladewert_10KHz : std_logic_vector (length_10KHz-1 downto 0); 
signal enable_10KHz : std_logic;
signal set_10KHz : std_logic;


begin
set_10KHz <= overflow_10KHz;

zaehler_10k : zaehler  generic map (length => length_10KHz) 
 port map (clk => clk_in,
 reset => reset_10KHz,
 zaehlerstand => zaehlerstand_10KHz,
 overflow => overflow_10KHz,
 nachladewert => nachladewert_10KHz,
 enable => enable_10KHz,
 set => set_10KHz );
  
process(clk_in) 
 variable divider : integer;
 variable counterstart : integer;
 begin
 divider := 10000;
 counterstart := 4294967296 - divider;
 nachladewert_10KHz <= to_unsigned(counterstart,32);
 end process;
 
end Behavioral;
