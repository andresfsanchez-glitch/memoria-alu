library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_test is
    Port (
        A        : in  STD_LOGIC_VECTOR(7 downto 0);
        B        : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);  
        dis1, dis2, dis3, dis4 : out STD_LOGIC_VECTOR(6 downto 0);
        NZVC     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end alu_test;

architecture Structural of alu_test is

    signal Result_1 : std_logic_vector(7 downto 0);

begin

   
    U_alu : entity work.alu_1
        port map(
            A        => A,
            B        => B,
            ALU_Sel  => ALU_Sel,
            Result   => Result_1,
            NZVC     => NZVC
        );

   
    U_H1 : entity work.hex7seg 
        port map(
            hex => B(7 downto 4),
            seg => dis1
        );

    U_H2 : entity work.hex7seg 
        port map(
            hex => B(3 downto 0),
            seg => dis2
        );

   
    U_H3 : entity work.hex7seg 
        port map(
            hex => Result_1(7 downto 4),
            seg => dis3
        );

    U_H4 : entity work.hex7seg 
        port map(
            hex => Result_1(3 downto 0),
            seg => dis4
        );

end Structural;
