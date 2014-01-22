LIBRARY ieee;
USE ieee.std_logis1164.all;

ENTITY fsegment IS 
	PORT(
		a : in  STD_LOGIC;
		b : in  STD_LOGIC;
		c : in  STD_LOGIC;
		d : in  STD_LOGIC;
		z : out  STD_LOGIC
		);
	END;
	
ARCHITECTURE BLE OF fsegment IS
	BEGIN
		z <= NOT d and(not c and not b and not a or c and(not b and not a or not b and a or not a and b))or d and(not b and not a or b and not a or not b and a);
		END;
		
		