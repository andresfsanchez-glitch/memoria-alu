library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_ext is
    Port(
        SUM_EXT : in  unsigned(8 downto 0);
        RES_EXT : in  unsigned(8 downto 0);
        ALU_Sel : in  STD_LOGIC_VECTOR(1 downto 0);
        EXT_OUT : out unsigned(8 downto 0)
    );
end mux_ext;

architecture Behavioral of mux_ext is
begin
    EXT_OUT <= SUM_EXT when ALU_Sel = "01" else
               RES_EXT when ALU_Sel = "11" else
               (others => '0');
end Behavioral;
