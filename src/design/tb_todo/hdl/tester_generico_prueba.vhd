--
-- VHDL Architecture procesador2_lib.tester_generico.prueba
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 13:11:01 17/12/2014
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--tester generico:
--FUNCIONALIDAD:	
	--leer los datos de entrada al componente que se quiere testar que se encuentran en el fichero entrada_generica.txt
	--escribir los datos de salida del componente que se quiere testar en el fichero de texto salida_generica.txt
--MODIFICACIONES QUE SE DEBEN HACER
	--hay que modificar  las entradas y las salidas de este archivo para que se adapten a las características del componente a testar:
		--modificando el número de entradas/salidas
		--modificando el tamaño de las entradas/salidas
	--se debe modificar el camino a los archivos entrada_generica y salida_generica que se encuentran dentro de la declaración de genericos
--ARCHIVO DE TEXTO entrada_generica.txt
	--es el archivo de texto en el que se almacenan los datos de entrada (un ejemplo se encuentra en este mismo directorio)
	--esta formado por filas de todos los datos que se leen en el mismo ciclo de reloj
	--en este ejemplo cada fila tiene 67 bits correspondientes a dato_a, dato_b y sal_ual
--ARCHIVO DE TEXTO entrada_generica.txt
	--es el archivo en el que se escriben los datos de salida del modulo a testar
	--no hace falta crearlo (creo) se genera solo
	--todos los datos de salida correspondientes a un mismo ciclo de reloj se escriben en la misma fila
-- CLK Y RESET
	--se pueden utilizar los bloques desarrollados por oscar
	--IMPORTANTE. EN ESTE ARCHIVO EL RESET ES NEGATIVO. REESCRIBIRLO PARA EL CASO DE RESET POSITIVO
--cuando lo copies en el bloque _tester modifica también los nombres de entidad y arquitectura para que no de problemas

--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_textio.all;
USE ieee.numeric_std.all;
LIBRARY STD;
USE STD.textio.all;



ENTITY tester_generico IS
   GENERIC( 
      fichero_estimulos : string := "T:\Reconfiguracion_Dinamica\sim\lento.rbt"
         );
   PORT( 
      clk           : IN     std_logic;
      I             : OUT     std_logic_vector(31 downto 0)  
   );

-- Declarations

END tester_generico ;

--
ARCHITECTURE prueba OF tester_generico IS
    file stimulus: TEXT open read_mode is fichero_estimulos;
    signal    auxiliar: std_logic_vector(31 downto 0);
BEGIN
 
  p_read : process(clk)
	variable l: line;
	variable s: std_logic_vector(31 downto 0);
	variable read_ok     : boolean;
	begin            

    if rising_edge(clk) then

      if (not endfile(stimulus))then
        readline(stimulus,l);
        read(l,s,read_ok);
        assert read_ok
        report "joderrrrrrrrrr hay errrrrrrrrrrrrrrrror: " & l.all
        severity warning;
        I  <=s(31 downto 0);                         
      else
        I  <=X"ffffffff";                
      end if;
    end if;	  
	end process p_read;
END ARCHITECTURE prueba;


