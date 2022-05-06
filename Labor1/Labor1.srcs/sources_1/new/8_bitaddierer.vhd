

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bitaddierer_8 is
 Port ( vector_A,vector_B : in std_logic_vector (7 downto 0);
 C_in : in std_logic ;
 vector_Q : out std_logic_vector (7 downto 0);
            C_out : out std_logic);
end bitaddierer_8;

architecture Behavioral of bitaddierer_8 is
component Volladierer
    PORT(A,B,C_in : in std_logic ;
        Q, C_out : out std_logic );
    end component; 
signal vector_C :std_logic_vector (8 downto 0);
begin
addi_8: for I in 0 to 7 generate
      AddX : Volladierer port map(A => vector_A(I) ,B => vector_B(I), C_in => vector_C(I) ,Q => vector_Q(I),C_out => vector_C(I+1));
end generate addi_8 ;
vector_C(0) <= C_in ;
C_out <= vector_C(8);



end Behavioral;
