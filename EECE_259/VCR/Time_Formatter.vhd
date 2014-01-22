LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY TIME_FORMATTER IS
PORT(	
	TimeIN  : IN UNSIGNED(19 downto 0);
	
	S , M , H	  : OUT UNSIGNED(7 downto 0)
	
);
END;

ARCHITECTURE BEHAVIORAL OF TIME_FORMATTER IS
	SIGNAL seconds, minutes, hours : UNSIGNED (19 downto 0);
	
begin
	Process(TimeIN)
	Variable temptime : UNSIGNED(19 downto 0);
	begin
		temptime := TimeIN;
		seconds <= temptime mod 60;
		temptime := (temptime - seconds) / 60;
		minutes <= temptime mod 60;
		hours <= (temptime - minutes) / 60; -- this math guarantees that hours, seconds and minutes are within the correct constraints.
		
		
	End Process;
	S <= seconds(7 downto 0);
	M <= minutes(7 downto 0);
	H <= hours(7 downto 0);
	
END;