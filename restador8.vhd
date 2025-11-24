library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity restador8 is

Port(

A : in STD_LOGIC_VECTOR(7 downto 0);
B : in STD_LOGIC_VECTOR(7 downto 0);
RES_EXT : out unsigned(8 downto 0)
);

end restador8;


architecture Behavioral of restador8 is
begin

RES_EXT <= unsigned('0' & A) - unsigned('0' & B);

end Behavioral;