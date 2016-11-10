--
-- VHDL Architecture ROM.discriminador.behavior
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 08:30:49 22/09/2016
--
-- using Mentor Graphics HDL Designer(TM) 2015.1b (Build 4)
-- genera la señal de selección del multiplexor que elige entre los contenidos de la rom rápida y la rom lenta
--genera una señal única trigger que ataca al controlador (FSM)
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY discriminador IS
    port(   trigger_w  :in  std_logic;
            trigger_e  :in std_logic;
            seleccion   :out std_logic
            );

END ENTITY discriminador;

--
ARCHITECTURE behavior OF discriminador IS
    signal aux: std_logic_vector (1 downto 0);
BEGIN
    p_discriminador: process(trigger_w,trigger_e)
    begin
        
        if trigger_w = '1' and trigger_e='0' then 
            seleccion<='0';
        elsif trigger_w = '0' and trigger_e='1' then
            seleccion<='1';
        elsif trigger_w = '1' and trigger_e='1' then
            seleccion<='0';
        else
            seleccion<='0';
        end if;
        
                 
            
        --aux<=trigger_w&trigger_e;
--        case aux is
--            when "10" => seleccion<='0';
--            when "01" => seleccion<='1';
--                
--            when others => seleccion<='0';
--        end case;
    end process;
    
   
 
END ARCHITECTURE behavior;

