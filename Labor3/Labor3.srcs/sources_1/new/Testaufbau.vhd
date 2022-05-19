library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Testaufbau is
  Port (clk : in std_logic;
  sga1_out : out std_logic_vector (4 downto 1);
  sga2_out : out std_logic_vector (4 downto 1) );
end Testaufbau;

architecture Behavioral of Testaufbau is
component Zufallsgenerator_galois
Generic(length : integer);
Port ( clk:in std_logic; X_out : out std_logic_vector(length downto 1);
Ks_in : in std_logic_vector(length downto 0));
end component;

component AND_eigen is
  Port ( input : in std_logic_vector (4 downto 1);
  output : out std_logic );
 end component;
 
 component XOR_eigen is
  Port ( input : in std_logic_vector (4 downto 1);
  output : out std_logic );
 end component;

signal output_prng : std_logic_vector(4 downto 1);
signal PZG_Xs_s : std_logic_vector (4 downto 1);
signal goldendevice_in : std_logic_vector (4 downto 1);
signal goldendevice_out : std_logic ;
signal dut_in : std_logic_vector (4 downto 1);
signal dut_out : std_logic ;
--signal sga1_out : std_logic_vector(4 downto 1);
--signal sga2_out : std_logic_vector(4 downto 1);

begin


PRNG : Zufallsgenerator_galois generic map (length => 4)
port map (clk => clk, Ks_in => "11000",X_out => output_prng);

GoldenDevice : XOR_eigen
port map (input => output_prng, output => goldendevice_out);

DUT : AND_eigen
port map (input => output_prng, output => dut_out);


SGA1 : Zufallsgenerator_galois generic map (length => 4)
port map (clk => goldendevice_out, Ks_in => "11000",X_out => sga1_out);

SGA2 : Zufallsgenerator_galois generic map (length => 4)
port map (clk => dut_out, Ks_in => "11000",X_out => sga2_out);

end Behavioral;
