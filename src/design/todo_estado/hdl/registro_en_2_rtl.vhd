--
-- VHDL Architecture ROM.registro_en_2.rtl
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

entity registro_en_2 is

  port (clk   : in  std_logic;
        rst : in  std_logic;
        d     : in  std_logic_vector(1 downto 0);
        enable:in std_logic;
        q     : out std_logic_vector(1 downto 0));
end registro_en_2;

architecture rtl of registro_en_2 is
    signal q_aux:std_logic_vector(1 downto 0);
begin
  p_registro_en_2 : process (clk)
  begin
        if (rising_edge(clk)) then
            if rst = '1' then
                q_aux <= (others=>'0');
            elsif enable ='1' then
                q_aux <= d;
            else 
                q_aux<=q_aux;
            end if;
        end if;
  end process p_registro_en_2;
  q<=q_aux;
end rtl;
