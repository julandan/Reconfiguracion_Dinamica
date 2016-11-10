--
-- VHDL Architecture todo.inversion.behavior
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 07:58:25 03/10/2016
--
-- using Mentor Graphics HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY inversion IS
     port(	entrada		: in std_logic_vector(31 downto 0);
		out_invertida	: out std_logic_vector(31 downto 0)
		);
END ENTITY inversion;

--
ARCHITECTURE behavior OF inversion IS
    function invierte_byte ( din8 : in std_logic_vector(7 downto 0))return  std_logic_vector is
    variable bit_rev8 : std_logic_vector(7 downto 0);
      begin
          bit_rev8(0) := din8(7);
          bit_rev8(1) := din8(6);
          bit_rev8(2) := din8(5);
          bit_rev8(3) := din8(4);
          bit_rev8(4) := din8(3);
          bit_rev8(5) := din8(2);
          bit_rev8(6) := din8(1);
          bit_rev8(7) := din8(0);
    
         return bit_rev8;
      end invierte_byte;
BEGIN
    
    p_inversion: process(entrada)
	variable tmp_byte0  : std_logic_vector (7 downto 0) ;
	variable tmp_byte1  : std_logic_vector (7 downto 0) ;
	variable tmp_byte2  : std_logic_vector (7 downto 0) ;
	variable tmp_byte3  : std_logic_vector (7 downto 0) ;
	variable tmp_byte  : std_logic_vector (7 downto 0) ;
	begin
		tmp_byte(7 downto 0)  := entrada(31 downto 24);
		tmp_byte3(7 downto 0) := invierte_byte(tmp_byte);
		tmp_byte(7 downto 0) 	:= entrada(23 downto 16);
		tmp_byte2(7 downto 0) := invierte_byte(tmp_byte);
		tmp_byte(7 downto 0) 	:= entrada(15 downto 8);
		tmp_byte1(7 downto 0) := invierte_byte(tmp_byte);
		tmp_byte(7 downto 0) 	:= entrada(7 downto 0);
		tmp_byte0(7 downto 0) := invierte_byte(tmp_byte);
  
	   out_invertida	 <= (tmp_byte3 & tmp_byte2 &tmp_byte1 & tmp_byte0);
	end process;
END ARCHITECTURE behavior;

