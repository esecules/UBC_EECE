LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY Frequency_Adjuster IS
PORT(
	
	Clk   	 : IN STD_LOGIC;
	speed		 : IN STD_LOGIC_VECTOR(1 downto 0);
	Done	 :out STD_LOGIC
	
);
END;

ARCHITECTURE BEHAVIORAL OF Frequency_Adjuster IS
	SIGNAL count : UNSIGNED(24 downto 0);
	SIGNAL ClkTemp :STD_LOGIC;
begin
	Process(Clk, speed)
	Variable Conversion : integer range 0 to 25000000;
	Begin
		if speed = "00" then
			conversion := 25000000;
		elsif speed = "01" then
			conversion := 5000000;
		elsif speed = "10" then
			conversion := 250000;
		end if;		
		if(rising_edge(clk) and speed /= "11") THEN
			if(count = conversion) THEN
				ClkTemp <= not ClkTemp;
				count <= count - count;
			else
				count <= count + 1;
			end if;
		end if;
	
	END PROCESS;
		Done <= ClkTemp;
	
END;