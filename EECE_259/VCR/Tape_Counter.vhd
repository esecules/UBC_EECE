LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY Tape_Counter IS
PORT(
	
	Clk   	 : IN STD_LOGIC;
	Increment : IN STD_LOGIC;
	Decrement : IN STD_LOGIC;
	Reset		 : IN STD_LOGIC;
		
	TimeOut   : OUT UNSIGNED(19 downto 0)
	
);
END;

ARCHITECTURE BEHAVIORAL OF Tape_Counter IS
	Signal tempTime : UNSIGNED(19 downto 0);
	
begin
	COUNT : Process(Reset,Clk,Increment, Decrement)
	Begin
		if(rising_edge(clk)) THEN
			if(Reset = '0') THEN
				if Increment = '1' THEN
					tempTime <= tempTime + 1;
				elsif Decrement = '1' THEN
					temptime <= tempTime -	1;
				end if;
			else
				tempTime <= X"00000";
			end if;
		
			if(temptime > 14400 and increment = '1') then
				temptime <= X"03840";
			end if;
			if temptime = X"00000" and decrement = '1' then
				temptime <= X"00000";
			end if;
		end if;
	END PROCESS COUNT;
	TimeOut <= temptime;
END;