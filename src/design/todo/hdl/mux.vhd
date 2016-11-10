library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux is

port (
   in_w: in std_logic_vector(31 downto 0);
   in_e: in std_logic_vector(31 downto 0);
	sel: in std_logic;
	sal: out std_logic_vector (31 downto 0)
);
end mux;

architecture  behavior of mux is
begin
   
mux_4_p :process (in_w,in_e,sel)
begin
   if sel='0' then
      sal<=in_w;
   else
      sal<=in_e;
   end if;	
end process;
end ;