LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY VCR_CONTROLLER IS
PORT(
	
	Clk , ResetBTN , StopBTN , PlayBTN , PauseBTN , RecBTN , FFBTN , RwdBTN , Tape_load, ejectBTN  , Start_tape , end_tape , protected , LCD_ready	: IN STD_logic;
	Message : OUT STD_LOGIC_VECTOR(3 downto 0);
	speed : out STD_LOGIC_VECTOR(1 downto 0);
	Count_reset , Decrement , Increment , Write_msg , msg_reset : out STD_logic
);
END;

ARCHITECTURE Mealy OF VCR_CONTROLLER IS
	CONSTANT Play : STD_LOGIC_VECTOR(1 downto 0) := "11";
	CONSTANT Stop : STD_LOGIC_VECTOR(1 downto 0) := "01";
	CONSTANT Eject : STD_LOGIC_VECTOR(1 downto 0) := "10";
	SIGNAL	Next_State , Current_State : STD_LOGIC_VECTOR(1 downto 0);
begin
	Process(clk,resetBTN)
	
	Begin
		if(resetBTN = '0') then
			current_State <= eject;
		elsif(rising_edge(clk) and resetBTN = '1') then
			current_State <= next_State;
			count_reset <= '0';
		end if;
	
	END PROCESS;
	--real world inputs
	process(current_State,StopBTN , PlayBTN , PauseBTN , RecBTN , FFBTN , RwdBTN , Tape_load  , Start_tape , end_tape, ejectBTN)
	begin
		next_State <= current_State;
		message <= "1110";
		write_msg <= '0';
		msg_reset <= '1';
		speed <= "11";
		decrement <= '0';
		increment <= '0';
		
		--current_State play
		if current_state = play then
			if end_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '1' and recBTN = '0' and stopBTN = '0' and playBTN = '0' and pauseBTN  = '0'  then
				--ff
				next_State <= play;
				message <= "0010";
				speed <= "01";
				write_msg <= '0';
				increment <= '1';
			elsif start_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '1' and FFBTN = '0' and recBTN = '0' and stopBTN = '0' and playBTN = '0' and pauseBTN  = '0'  then
				--rwd
				next_State <= play;
				message <= "0011";
				speed <= "01";
				write_msg <= '0';
				decrement <= '1';
			elsif ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '0' and stopBTN = '0'  and pauseBTN  = '1'  then
				--pause
				next_State <= play;
				message <= "0110";
				write_msg <= '0';
			elsif  end_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '1' and stopBTN = '0' and  pauseBTN  = '0'  then
			--record
				next_State <= play;
				if (protected = '1') then
				message <= "0111";
				else
				message <= "0001";
				speed <= "00";
				end if;
				
				increment <= '1';
				write_msg <= '0';
			elsif ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '0' and stopBTN = '1' and playBTN = '0' and pauseBTN  = '0'   then
			--stop
			next_State <= stop;
			elsif tape_load = '0' or ejectBTN = '1' then
			--eject
				next_State <= eject;
			elsif end_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '0' and stopBTN = '0' and pauseBTN  = '0' then
				--play
				next_State <= play;
				message <= "0000";
				speed <= "00";
				write_msg <= '0';
				increment <= '1';
			end if;
		--current_state stop
		elsif current_State = stop then
			if tape_load = '1' and playBTN = '1'  then
			--play
			next_State <= play;
			elsif start_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '1' and FFBTN = '0' and recBTN = '0' and stopBTN = '0' and playBTN = '0' and pauseBTN  = '0'  then
			--rewind
				next_State <= stop;
				message <= "0011";
				speed <= "10";
				write_msg <= '0';
				decrement <= '1';
			elsif end_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '1' and recBTN = '0' and stopBTN = '0' and playBTN = '0' and pauseBTN  = '0'  then
			--ff
				next_State <= stop;
				message <= "0010";
				speed <= "10";
				write_msg <= '0';
				increment <= '1';
			elsif end_tape = '0' and ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '1' and stopBTN = '0' and playBTN = '0' and pauseBTN  = '0'  then
			--record 
				next_State <= stop;
				if (protected = '1') then
				message <= "0111";
				speed <= "11";
				else
				message <= "0001";
				speed <= "00";
				increment <= '1';
				end if;
				write_msg <= '0';
			elsif tape_load = '0' or ejectBTN = '1' then
			--eject
				next_State <= eject;
			elsif ejectBTN = '0' and tape_load = '1' and rwdBTN = '0' and FFBTN = '0' and recBTN = '0'  and playBTN = '0'  then
			--stop
				next_State <= stop;
				message <= "0101";
				write_msg <= '0';
			end if;
		--current_State eject
		elsif current_State = eject then
			if tape_load = '1' and ejectBTN = '0' then
				next_State <= stop;
			else
				message <= "0100";
				write_msg <= '0';
			end if;
		end if;
		
	end process;
	

	
END;	