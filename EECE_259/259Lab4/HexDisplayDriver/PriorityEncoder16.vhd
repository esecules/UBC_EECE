LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PriorityEncoder16 IS
	PORT(
	   	Inputs 			: in std_logic_vector(15 downto 0) ; 			-- inputs slider switches SW[15] = SW[0] respectively
	   	BCDOutputMSB	: out std_logic_vector(3 downto 0) ; 			-- 4 bit priority output for MOST significant HEX display
			BCDOutputLSB	: out std_logic_vector(3 downto 0) ; 			-- 4 bit priority output for LEAST significant HEX display
			
			Activated	   : out std_logic
       );
END;

ARCHITECTURE Behavioural OF PriorityEncoder16 IS
BEGIN
	PROCESS(Inputs) 						-- process sensitive to changes in these signals
	BEGIN

-- describe how the 16 possible INPUTS in range map to the 2 BCD outpus
		BCDOutputMSB <= X"0" ;
		BCDOutputLSB <= X"0" ;
		Activated <= '0' ;
		IF   ( Inputs ( 15 )  =  '1' )       THEN    	-- if input 15 is active, we have an answer, the outputs should be '1', '5'
			BCDOutputMSB <= X"1" ;								-- could use binary to specify 4 bit output but used hexadecimal instead as it is more convenient in this application.
			BCDOutputLSB <= X"5" ;								-- ditto
			Activated <= '1' ;
		ELSIF   ( Inputs ( 14 )  =  '1' )    THEN    	-- if input 15 is NOT active but input 14 IS active then the outputs should be '1', '4'
			BCDOutputMSB <= X"1" ;								-- could use binary to specify 4 bit output but used hexadecimal instead as it is more convenient in this application.
			BCDOutputLSB <= X"4" ;								-- ditto	
			Activated <= '1' ;
		ELSIF(Inputs(13) = '1' ) THEN
			BCDOutputMSB <= X"1" ;
			BCDOutputLSB <= X"3" ;
			Activated <= '1' ;
		ELSIF(Inputs(12) = '1' ) THEN
			BCDOutputMSB <= X"1" ;
			BCDOutputLSB <= X"2" ;
			Activated <= '1' ;
		ELSIF(Inputs(11) = '1' ) THEN
			BCDOutputMSB <= X"1" ;
			BCDOutputLSB <= X"1" ;
			Activated <= '1' ;
		ELSIF(Inputs(10) = '1' )  THEN
			BCDOutputMSB <= X"1" ;
			BCDOutputLSB <= X"0" ;
			Activated <= '1' ;
		ELSIF(Inputs(9) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"9" ;
			Activated <= '1' ;
		ELSIF(Inputs(8) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"8" ;
			Activated <= '1' ;
	   ELSIF(Inputs(7) = '1' ) THEN 
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"7" ;
			Activated <= '1' ;
		ELSIF(Inputs(6) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"6" ;
			Activated <= '1' ;
		ELSIF(Inputs(5) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"5" ;
			Activated <= '1' ;
		ELSIF(Inputs(4) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"4" ;
			Activated <= '1' ;
		ELSIF(Inputs(3) = '1' ) THEN 
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"3" ;
			Activated <= '1' ;
		ELSIF(Inputs(2) = '1' ) THEN 
	   	BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"2" ;
			Activated <= '1' ;
		ELSIF(Inputs(1) = '1' ) THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"1" ;
			Activated <= '1' ;
		ELSIF(Inputs(0) = '1') THEN
			BCDOutputMSB <= X"0" ;
			BCDOutputLSB <= X"0" ;	
			Activated <= '1' ;

      END IF ;
	END PROCESS ;													-- end of the process
END;
