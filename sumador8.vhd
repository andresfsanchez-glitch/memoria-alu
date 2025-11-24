library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sumador8 is
Port(

A : in STD_LOGIC_VECTOR(7 downto 0);
B : in STD_LOGIC_VECTOR(7 downto 0);
SUM_EXT : out unsigned(8 downto 0) 

);

end sumador8;


architecture Behavioral of sumador8 is
begin
SUM_EXT <= unsigned('0' & A) + unsigned('0' & B);
end Behavioral;