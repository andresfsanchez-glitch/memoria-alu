library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity flags_nzvc is
    Port(
        A   : in STD_LOGIC_VECTOR(7 downto 0);
        B   : in STD_LOGIC_VECTOR(7 downto 0);
        OP  : in STD_LOGIC_VECTOR(1 downto 0);  -- 01 add / 11 sub
        EXT : in unsigned(8 downto 0);
        NZVC : out STD_LOGIC_VECTOR(3 downto 0)
    );
end flags_nzvc;

architecture Behavioral of flags_nzvc is
begin
    process(A,B,OP,EXT)
    begin
       
        NZVC(3) <= EXT(7);

       
        if (EXT(7 downto 0) = x"00") then
            NZVC(2) <= '1';
        else
            NZVC(2) <= '0';
        end if;

        
        if (OP = "01") then  
            if ((A(7)='0' and B(7)='0' and EXT(7)='1') or
                (A(7)='1' and B(7)='1' and EXT(7)='0')) then
                NZVC(1) <= '1';
            else
                NZVC(1) <= '0';
            end if;

        elsif (OP = "11") then  
            if ((A(7)='0' and B(7)='1' and EXT(7)='1') or
                (A(7)='1' and B(7)='0' and EXT(7)='0')) then
                NZVC(1) <= '1';
            else
                NZVC(1) <= '0';
            end if;
        else
            NZVC(1) <= '0';
        end if;

        
        NZVC(0) <= EXT(8);

    end process;
end Behavioral;
