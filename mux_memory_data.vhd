library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity mux_memory_data is
    Port (
        address      : in  std_logic_vector(7 downto 0);
        rom_data_out : in  std_logic_vector(7 downto 0);
        rw_data_out  : in  std_logic_vector(7 downto 0);
        port_in_00   : in  std_logic_vector(7 downto 0);
        port_in_01   : in  std_logic_vector(7 downto 0);
        data_out     : out std_logic_vector(7 downto 0)
    );
end mux_memory_data;


architecture behavioral of mux_memory_data is
begin

    MUX1 : process(address, rom_data_out, rw_data_out, port_in_00, port_in_01)
    begin
        if ((to_integer(unsigned(address)) >= 0) and
            (to_integer(unsigned(address)) <= 127)) then
            data_out <= rom_data_out;

        elsif ((to_integer(unsigned(address)) >= 128) and
               (to_integer(unsigned(address)) <= 223)) then
            data_out <= rw_data_out;

        elsif (address = x"F0") then
		  
            data_out <= port_in_00;

        elsif (address = x"F1") then
		  
            data_out <= port_in_01;

        else
            data_out <= (others => '0');
        end if;
    end process;

end behavioral;
