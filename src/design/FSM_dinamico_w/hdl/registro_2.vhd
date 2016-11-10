--
-- VHDL Architecture ROM.registro_32.rtl
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 07:40:41 22/09/2016
--
-- using Mentor Graphics HDL Designer(TM) 2015.1b (Build 4)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-------------------------------------------------------------------------------
-- library unisim;
-- use unisim.vcomponents.all;

entity registro_2 is

  port (clk   : in  std_logic;
        rst : in  std_logic;
        d     : in  std_logic_vector(1 downto 0);
        q     : out std_logic_vector(1 downto 0));
end registro_2;

architecture rtl of registro_2 is
    signal q_aux:std_logic_vector(1 downto 0);
begin
  p_registro_2 : process (clk)
  begin
        if (rising_edge(clk)) then
            if rst = '1' then
                q_aux <= (others=>'0');          
            else 
                q_aux <= d;
            end if;
        end if;
  end process p_registro_2;
  q<=q_aux;
end rtl;

