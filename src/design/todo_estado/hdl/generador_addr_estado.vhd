--
-- VHDL Architecture ROM.generador_addr_estado.comportamiento
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 17:13:34 21/09/2016
--
-- using Mentor Graphics HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity generador_addr_estado is
  generic (n : natural := 15);
  port (	   clk :in std_logic;
			rst:in std_logic;
			enable:in std_logic;
			fin:in std_logic;
			dir     	: out std_logic_vector (n-1 downto 0)
        );
end generador_addr_estado;

architecture comportamiento of generador_addr_estado is
signal dir_aux: std_logic_vector(n-1 downto 0);
begin
    p_contador: process (clk) is
    begin
        if rising_edge(clk) then
            if rst='1' or fin ='1'then 
                dir_aux<= (dir_aux'range => '0');
            elsif enable='1' then
                dir_aux<=std_logic_vector(unsigned(dir_aux)+1);
            else
                dir_aux<=dir_aux;
            end if;
        end if;
    end process p_contador;
    dir<=dir_Aux;
end comportamiento;
