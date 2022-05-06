architecture Behavioral of Volladierer is
signal A_u_B, B_u_C : std_logic ;
begin

A_u_B <= A and B ;
B_u_C <= B and C_in ;

C_out <= A_u_B or B_u_C or (A and C_in) ;

Q <= (A_u_B and B_u_C) or (not A and not B and C_in) or (A and not B and not C_in) or (not A and B and not C_in);


end Behavioral;