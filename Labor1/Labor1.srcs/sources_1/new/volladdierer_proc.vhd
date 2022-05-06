architecture Behavioral of Volladierer is

begin

process(A,B,C_in)
begin

if (A = '0') then
    if (B = '0') then
        C_out <= '0'after 5 ns ;
        if (C_in = '0') then
            Q <= '0' after 5 ns;
        else 
            Q <= '1' after 5 ns ;
        end if;
    else
        if (C_in = '0') then
            Q <= '1' after 5 ns;
            C_out <= '0' after 5 ns;
        else 
            Q <= '0' after 5 ns;
            C_out <= '1' after 5 ns;
        end if;
    end if;
else
    if (B = '0') then
        if (C_in = '0') then
            Q <= '1' after 5 ns;
            C_out <= '0' after 5 ns;
        else 
            Q <= '0'  after 5 ns;
            C_out <= '1'after 5 ns;
        end if;
    else
        C_out <= '1' after 5 ns;
        if (C_in = '0') then
            Q <= '0' after 5 ns;
        else 
            Q <= '1' after 5 ns;
        end if;
    end if;
end if;     
        
end process ;


end Behavioral;