LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY DECIMAL_TO_BCD IS
PORT(	
	BIN	  : IN UNSIGNED(7 downto 0);
	Top, Bottom	  : OUT UNSIGNED(3 downto 0)
);
END;

ARCHITECTURE BEHAVIORAL OF DECIMAL_TO_BCD IS
	
begin
	Process(BIN)
	variable z :UNSIGNED (17 downto 0);
	begin
		for i in 0 to 17 loop
			z(i) := '0';
		end loop;
		z(10 downto 3) := BIN;
		
		for i in 0 to 4 loop
			if z(11 downto 8) > 4 then	
				z(11 downto 8) := z(11 downto 8) +3;
			end if;
			z(17 downto 1) := z(16 downto 0);
		end loop;
		
		Top <= z(15 downto 12);
		Bottom <= z(11 downto 8);
	End Process;
		
END;