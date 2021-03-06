-- VHDL Entity FSM_dinamico_w.dinamico_w.symbol
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 10:22:11 15/10/2016
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY dinamico_w IS
   PORT( 
      activa_dinamico : IN     std_logic;
      clk             : IN     std_logic;
      reset_dinamico  : IN     std_logic;
      rst             : IN     std_logic;
      activa_led_e    : OUT    std_logic;
      activa_led_w    : OUT    std_logic
   );

-- Declarations

END dinamico_w ;

--
-- VHDL Architecture FSM_dinamico_w.dinamico_w.struct
--
-- Created:
--          by - Juan Lanchares.UNKNOWN (LANCHARES)
--          at - 10:20:23 30/10/2016
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2015.1b (Build 4)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY FSM_dinamico_w;

ARCHITECTURE struct OF dinamico_w IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL activa_dinamico_reg : std_logic;
   SIGNAL activa_led_w_aux    : std_logic;
   SIGNAL reset_dinamico_reg  : std_logic;


   -- Component Declarations
   COMPONENT dinamico_fsm_w
   PORT (
      activa_dinamico : IN     std_logic ;
      clk             : IN     std_logic ;
      reset_dinamico  : IN     std_logic ;
      rst             : IN     std_logic ;
      activa_led_w    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT registro_w
   PORT (
      clk : IN     std_logic;
      d   : IN     std_logic;
      rst : IN     std_logic;
      q   : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : dinamico_fsm_w USE ENTITY FSM_dinamico_w.dinamico_fsm_w;
   FOR ALL : registro_w USE ENTITY FSM_dinamico_w.registro_w;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.12) for instance 'i_gnd' of 'gnd'
   activa_led_e <= '0';

   -- Instance port mappings.
   i_FSM_dinamico_w : dinamico_fsm_w
      PORT MAP (
         activa_dinamico => activa_dinamico_reg,
         clk             => clk,
         reset_dinamico  => reset_dinamico_reg,
         rst             => rst,
         activa_led_w    => activa_led_w_aux
      );
   i_reg_act_din : registro_w
      PORT MAP (
         clk => clk,
         rst => rst,
         d   => activa_dinamico,
         q   => activa_dinamico_reg
      );
   i_reg_activa_led_w : registro_w
      PORT MAP (
         clk => clk,
         rst => rst,
         d   => activa_led_w_aux,
         q   => activa_led_w
      );
   i_reg_rst_din : registro_w
      PORT MAP (
         clk => clk,
         rst => rst,
         d   => reset_dinamico,
         q   => reset_dinamico_reg
      );

END struct;
