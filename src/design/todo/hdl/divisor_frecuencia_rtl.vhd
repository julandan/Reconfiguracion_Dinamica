--
-- VHDL Architecture todo.divisor_frecuencia.rtl
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 12:05:49 18/10/2016
--
-- using Mentor Graphics HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY divisor_frecuencia IS
    port(   clk_200mz:in std_logic;
            --rst:in std_logic;
            clk_100mz:out std_logic
        );
END ENTITY divisor_frecuencia;

--
ARCHITECTURE rtl OF divisor_frecuencia IS
    signal clk_100mz_aux: std_logic;
    signal contador:std_logic_vector(1 downto 0);
BEGIN
    
    --p_divisor_frecuencia:process (clk_200mz)
--    begin
--        if rising_edge(clk_200mz) then
--            if rst='1' then
--                clk_100mz_aux<='0';
--                contador<=(others=>'0');
--            else
--                if contador="11" then
--                    clk_100mz_aux<=not clk_100mz_aux;
--                    contador<=(others=>'0');
--                else
--                    clk_100mz_aux<=clk_100mz_aux;
--                    contador<=std_logic_vector(unsigned(contador)+1);
--                end if;
--            end if;
--        end if;
--    end process;

p_divisor_frecuencia:process (clk_200mz)
    begin
        if rising_edge(clk_200mz) then
            if contador="11" then
                clk_100mz_aux<=not clk_100mz_aux;
                contador<=(others=>'0');
            else
                clk_100mz_aux<=clk_100mz_aux;
                contador<=std_logic_vector(unsigned(contador)+1);
            end if;
        end if;
    end process;
    clk_100mz<=clk_100mz_aux;
            
END ARCHITECTURE rtl;

