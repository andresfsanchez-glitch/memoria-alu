library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_1 is
    Port (
        A        : in  STD_LOGIC_VECTOR(7 downto 0);
        B        : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);  -- 000 add / 001 sub
        Result   : out STD_LOGIC_VECTOR(7 downto 0);
        NZVC     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end alu_1;

architecture Structural of alu_1 is

    signal SUM_EXT_s : unsigned(8 downto 0);
    signal RES_EXT_s : unsigned(8 downto 0);
    signal EXT_sel_s : unsigned(8 downto 0);

begin

    
    U_SUM : entity work.sumador8
        port map(
            A => A,
            B => B,
            SUM_EXT => SUM_EXT_s
        );

   
    U_RES : entity work.restador8
        port map(
            A => A,
            B => B,
            RES_EXT => RES_EXT_s
        );

    
    U_MUX : entity work.mux_ext
        port map(
            SUM_EXT => SUM_EXT_s,
            RES_EXT => RES_EXT_s,
            ALU_Sel => ALU_Sel,
            EXT_OUT => EXT_sel_s
        );

  
    Result <= std_logic_vector(EXT_sel_s(7 downto 0));

    
    U_FLAGS : entity work.flags_nzvc
        port map(
            A   => A,
            B   => B,
            OP  => ALU_Sel,
            EXT => EXT_sel_s,
            NZVC => NZVC
        );

end Structural;
