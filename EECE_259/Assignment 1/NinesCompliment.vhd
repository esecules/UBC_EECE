LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY NinesCompliment IS
	PORT(
	   	Input				: in std_logic_vector(3 downto 0) ; 			
	   	Compliment		: out std_logic_vector(3 downto 0) 			
	   );
END;

ARCHITECTURE Behavioural OF NinesCompliment IS
BEGIN
	PROCESS(Input) 						
	BEGIN

		Compliment <= (x"9" - Input);  --9 - input

	END PROCESS ;											
END;