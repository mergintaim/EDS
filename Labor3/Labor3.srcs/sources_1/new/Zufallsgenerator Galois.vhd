----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2022 17:25:25
-- Design Name: 
-- Module Name: Zufallsgenerator Galois - Behavioral
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

entity Zufallsgenerator_galois is
Generic(length : integer := 4);
Port ( clk:in std_logic; X_out : out std_logic_vector(length downto 1);
Ks_in : in std_logic_vector(length downto 0);
start : in std_logic);
end Zufallsgenerator_galois;

architecture Behavioral of Zufallsgenerator_galois is
signal after_and : std_logic;
signal Xs : std_logic_vector(length downto 1);
signal feedback : std_logic := '1';
signal reset_s : std_logic_vector(length-1 downto 0);


component coefficientmodules 
  Port (clk : in std_logic;
  input : in std_logic;
  k_in : in std_logic;
  output : out std_logic;
  feedback_in : in std_logic;
  reset : in std_logic);
  end component;

begin
    feedback <= Xs(length) and Ks_in(length);
    after_and <= feedback and Ks_in(0);

  --  firstflip : process(clk)
  --      begin
  --      if rising_edge(clk) then Xs(1) <= after_and; end if; end process;

    PRNG_GEN: for I in 1 to length generate
        PRNG_1 : if I = 1 generate
        PRNG : coefficientmodules port map(clk => clk,
        input => start,
        k_in => Ks_in(I-1),
        output => Xs(I),
        feedback_in => feedback,
        reset => reset_s(I-1)
        );
        end generate PRNG_1;
        PRNG_2toX : if I > 1 generate
        PRNGs : coefficientmodules port map(clk => clk,
        input => Xs(I-1),
        k_in => Ks_in(I-1),
        output => Xs(I),
        feedback_in => feedback,
        reset => reset_s(I-1)
        );
        end generate PRNG_2toX;
    end generate;
X_out <= Xs;

end Behavioral;
