-- VHDL Entity todo.regula_trigger.symbol
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 07:10:03 22/10/2016
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regula_trigger IS
   PORT( 
      clk         : IN     std_logic;
      rst         : IN     std_logic;
      trigger_in  : IN     std_logic;
      trigger_out : OUT    std_logic
   );

-- Declarations

END regula_trigger ;

--
-- VHDL Architecture todo.regula_trigger.fsm
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 08:44:20 22/10/2016
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
 
ARCHITECTURE fsm OF regula_trigger IS

   TYPE STATE_TYPE IS (
      s0,
      trigger_a_uno,
      trigger_a_cer0,
      espera
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk
   )
   -----------------------------------------------------------------
   BEGIN
      IF (clk'EVENT AND clk = '1') THEN
         IF (rst = '1') THEN
            current_state <= s0;
         ELSE
            current_state <= next_state;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      current_state,
      trigger_in
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN s0 => 
            IF (trigger_in='0') THEN 
               next_state <= s0;
            ELSIF (trigger_in='1') THEN 
               next_state <= trigger_a_uno;
            ELSE
               next_state <= s0;
            END IF;
         WHEN trigger_a_uno => 
            next_state <= trigger_a_cer0;
         WHEN trigger_a_cer0 => 
            next_state <= espera;
         WHEN espera => 
            IF (trigger_in='1') THEN 
               next_state <= espera;
            ELSIF (trigger_in='0') THEN 
               next_state <= s0;
            ELSE
               next_state <= espera;
            END IF;
         WHEN OTHERS =>
            next_state <= s0;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      trigger_out <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN trigger_a_uno => 
            trigger_out<='1';
         WHEN trigger_a_cer0 => 
            trigger_out<='0';
         WHEN espera => 
            trigger_out<='0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;