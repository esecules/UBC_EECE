LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux_4b_2ch IS
	PORT(
	   	InA, InB			: in std_logic_vector(3 downto 0) ; 			
	   	result			: out std_logic_vector(3 downto 0) ; 			
						
			Mode    	: in std_logic											
       );
END;

ARCHITECTURE Behavioural OF MUX_4b_2ch IS
BEGIN
	PROCESS(InA, InB, Mode) 						
	BEGIN

		IF(Mode = '1')	THEN
		
		result <= InB;
		
		ELSE
	
		result <= InA;
		
		END IF ;

	END PROCESS ;											
END;