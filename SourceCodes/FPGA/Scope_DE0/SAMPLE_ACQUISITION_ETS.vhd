LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity SAMPLE_ACQUISITION_ETS is
	port(
		CLOCK_120 					 : in  std_logic;
		ETS_PACKET_SEND 			 : in  std_logic;
		ETS_PACKET_READY 			 : out std_logic;
		ACT_CMD 						 : in  unsigned(3 downto 0);
		CHAN_ON_OFF 				 : in  std_logic;
		SAMPLE_DATA_RESET 		 : out std_logic;
		ADC_START_STOP_SIGNAL 	 : out std_logic;
		SAMPLERATE_CNTER 			 : in  unsigned(31 downto 0);
		TRIGGER_TYPE 				 : in  unsigned(1 downto 0);
		TRIGGER_CHAN 				 : in  std_logic_vector(7 downto 0);
		SAMPLING_MODE 				 : in  std_logic;
		TRIG1_RISE 					 : in  std_logic;
		TRIG1_FALL 					 : in  std_logic;
		TRIG2_RISE 					 : in  std_logic;
		TRIG2_FALL 					 : in  std_logic;
		DATA_ADC1_IN 				 : in  std_logic_vector(7 downto 0);
		DATA_ADC2_IN 				 : in  std_logic_vector(7 downto 0);
		FIFO_CH_DATAIN 			 : out std_logic_vector(8 downto 0);
		FIFO_CH_WR 					 : out std_logic;
		FIFO_CH_RESET 				 : out std_logic;
		ACC_ROUNDS 					 : in  unsigned(31 downto 0);
		EDGE_DETECT_SPEED 		 : out std_logic_vector(1 downto 0);
		DUAL_CHANNEL_MODE_ON 	 : in  std_logic;
		DUAL_CHANNEL_MODE_STATUS : in  std_logic;
		CHANNEL_ID 					 : in  std_logic;
		samples_per_packet 		 : in  unsigned(15 downto 0);
		fin_ADC 						 : in  std_logic);
	end SAMPLE_ACQUISITION_ETS;
		  
architecture SAMPLE_ACQUISITION_ETS_ARCH OF SAMPLE_ACQUISITION_ETS is
		  
signal INITIALISE_ETS 				: std_logic := '0';		  
signal ETS_TRIG_FIRST_IMPULS  	: std_logic := '0';
signal ETS_TRIG_SECOND_IMPULS 	: std_logic := '0';
signal FIFO_WRITTE_S					: std_logic := '0';
signal ETS_PACKET_READY_S			: std_logic := '0';
signal ADC_START_STOP_SIGNAL_S   : std_logic := '0';
signal FIFO_CH_RESET_S 				: std_logic := '0';

begin
		  
process(CLOCK_120)

	 variable GET_SAMPLE_FROM_ADC 		 : std_logic := '0';
	 variable GET_SAMPLE_WAIT_CNT 		 : unsigned(31 downto 0) := x"00000000";
	 variable TRIG_FLAG 						 : std_logic := '0';
	 variable PACKET_NUMBER 				 : integer range 0 to 23 := 1;
	 variable SAMPLE_NUMBER 				 : integer range 0 to 511:= 0;
	 variable GOT_TRIG_IN_PACKET  		 : std_logic := '0';
	 variable START_STOP_COUNTER  		 : integer range 0 to 2 := 0;
	 variable SIGNAL_LEARNING_DONE 		 : std_logic := '0';
	 variable SIGNAL_LEARNING_CNT 		 : integer range 0 to 64000:= 0;
	 variable START_SIGNAL_LEARNING_CNT  : std_logic := '0';
	 variable ADC_CYCLE_START_CNT 		 : integer range -15000 to 64000 := 0;
	 variable ETS_RESOLUTION 				 : integer range 0 to 24 := 0;
	 variable ADC_CYCLE_CNT 				 : integer range -15000 to 64000 := 0;
	 variable ADC_CYCLE_CNT_SET 			 : std_logic := '0';
	 variable ETS_ADVANCED_INIT 			 : std_logic := '0';
	 variable ETS_ADVANCED_START 			 : integer range 0 to 64000:= 0;
	 variable ETS_PREPARE 					 : std_logic := '0';
	 variable NO_TRIG_FOUND 				 : std_logic := '0';
	 variable ADC_timing_trigger         : integer range 0 to 255 := 0; 
	 
	begin
	if(CLOCK_120'event and CLOCK_120 = '1') then
		if(ETS_PACKET_SEND = '1') then				
				ETS_PACKET_READY_S <= '0';
			end if;
			
		if(FIFO_WRITTE_S = '1') then
			FIFO_WRITTE_S <= '0';
		end if;
				
		if((ACT_CMD = 6 and (CHAN_ON_OFF = '1' or (DUAL_CHANNEL_MODE_ON = '1' and DUAL_CHANNEL_MODE_STATUS = CHANNEL_ID))) or ACT_CMD = 7 or ACT_CMD = 5 or ACT_CMD = 8 or ETS_PACKET_SEND = '1') then
					GET_SAMPLE_FROM_ADC := '0';
					GET_SAMPLE_WAIT_CNT := to_unsigned(0,32);
					TRIG_FLAG := '0';
					FIFO_CH_RESET <= '1';
					SAMPLE_DATA_RESET <= '1';
					FIFO_WRITTE_S <= '0';
					PACKET_NUMBER := 1;
					SAMPLE_NUMBER := 0;
					GOT_TRIG_IN_PACKET := '0';
					ETS_PACKET_READY_S <= '0';
					INITIALISE_ETS <= '0';
					ADC_CYCLE_CNT := 0;
					ADC_CYCLE_START_CNT := 0;
					ADC_CYCLE_CNT_SET := '0';
					SIGNAL_LEARNING_CNT := 0;
					SIGNAL_LEARNING_DONE := '0';
					ADC_START_STOP_SIGNAL_S <= '1';
					ETS_TRIG_FIRST_IMPULS <= '0';
					ETS_TRIG_SECOND_IMPULS <= '0';
					ETS_PREPARE := '0';
					ETS_ADVANCED_INIT := '0';
					START_STOP_COUNTER := 0;
		else
		SAMPLE_DATA_RESET <= '0';
		FIFO_CH_RESET <= '0';
		if(GET_SAMPLE_WAIT_CNT < (samplerate_cnter-2)) then
			GET_SAMPLE_WAIT_CNT := GET_SAMPLE_WAIT_CNT + 1;
		else
			GET_SAMPLE_FROM_ADC := '1';
		end if;
		
		if(TRIGGER_TYPE = 0) then	
			if(((TRIGGER_CHAN = x"00" and SAMPLING_MODE = '0') or (CHANNEL_ID = '0' and SAMPLING_MODE = '1')) and TRIG1_RISE = '1' and TRIG1_FALL = '0' and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		
			if(((TRIGGER_CHAN = x"01" and SAMPLING_MODE = '0') or (CHANNEL_ID = '1' and SAMPLING_MODE = '1')) and TRIG2_RISE = '1' and TRIG2_FALL = '0' and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		elsif(TRIGGER_TYPE = 1) then
			if(((TRIGGER_CHAN = x"00" and SAMPLING_MODE = '0') or (CHANNEL_ID = '0' and SAMPLING_MODE = '1')) and TRIG1_FALL = '1' and TRIG1_RISE = '0' and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		
			if(((TRIGGER_CHAN = x"01" and SAMPLING_MODE = '0') or (CHANNEL_ID = '1' and SAMPLING_MODE = '1')) and TRIG2_FALL = '1' and TRIG2_RISE = '0' and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		elsif(TRIGGER_TYPE = 2) then
			if(((TRIGGER_CHAN = x"00" and SAMPLING_MODE = '0') or (CHANNEL_ID = '0' and SAMPLING_MODE = '1')) and (TRIG1_FALL = '1' or TRIG1_RISE = '1') and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		
			if(((TRIGGER_CHAN = x"01" and SAMPLING_MODE = '0') or (CHANNEL_ID = '1' and SAMPLING_MODE = '1')) and (TRIG2_FALL = '1' or TRIG2_RISE = '1') and TRIG_FLAG = '0') then
				TRIG_FLAG := '1';
			end if;
		end if;
		
		if(SAMPLING_MODE = '1' and SIGNAL_LEARNING_DONE = '0') then
			
			if(acc_rounds = 2) then
							ETS_RESOLUTION := 24;
							EDGE_DETECT_SPEED <= "00";
							ADC_timing_trigger := 180;
						elsif(acc_rounds = 4) then
							ETS_RESOLUTION := 12;
							EDGE_DETECT_SPEED <= "00";
							ADC_timing_trigger := 180;
						elsif(acc_rounds = 8) then
							ETS_RESOLUTION := 6; 
							EDGE_DETECT_SPEED <= "11";
							ADC_timing_trigger := 96;
						elsif(acc_rounds = 20) then
							ETS_RESOLUTION := 2;
							EDGE_DETECT_SPEED <= "11";
							ADC_timing_trigger := 96;
						else
							ETS_RESOLUTION := 2;
							EDGE_DETECT_SPEED <= "11";
							ADC_timing_trigger := 96;
						end if;
			
			
			if(TRIG_FLAG = '1' and ETS_TRIG_FIRST_IMPULS = '0' and ETS_TRIG_SECOND_IMPULS = '0') then
				SIGNAL_LEARNING_CNT := 0;
				ETS_TRIG_FIRST_IMPULS <= '1';
				TRIG_FLAG := '0';
			elsif(TRIG_FLAG = '1' and ETS_TRIG_FIRST_IMPULS = '1' and ETS_TRIG_SECOND_IMPULS = '0') then
				SIGNAL_LEARNING_CNT := 0;
				START_SIGNAL_LEARNING_CNT := '1';
				ETS_TRIG_SECOND_IMPULS <= '1';
				TRIG_FLAG := '0';
			elsif(TRIG_FLAG = '1' and ETS_TRIG_FIRST_IMPULS = '1' and ETS_TRIG_SECOND_IMPULS = '1') then
				START_SIGNAL_LEARNING_CNT := '0';
				ETS_TRIG_FIRST_IMPULS <= '0';
				ETS_TRIG_SECOND_IMPULS <= '0';
				SIGNAL_LEARNING_DONE := '1';
				NO_TRIG_FOUND := '0';
				TRIG_FLAG := '0';
			end if;
			
			if(TRIG_FLAG = '0' and SIGNAL_LEARNING_CNT /= 64000) then
			SIGNAL_LEARNING_CNT := SIGNAL_LEARNING_CNT + 1;
			elsif(TRIG_FLAG = '0' and SIGNAL_LEARNING_CNT = 64000) then
			START_SIGNAL_LEARNING_CNT := '0';
				ETS_TRIG_FIRST_IMPULS <= '0';
				ETS_TRIG_SECOND_IMPULS <= '0';
				SIGNAL_LEARNING_DONE := '1';
				NO_TRIG_FOUND := '1';
			end if;	
		end if;
		
		if(START_SIGNAL_LEARNING_CNT = '1' and SIGNAL_LEARNING_DONE = '0') then
			SIGNAL_LEARNING_CNT := SIGNAL_LEARNING_CNT + 1;
		end if;
		
			if((GET_SAMPLE_FROM_ADC = '1' and SAMPLING_MODE = '0') or (SAMPLING_MODE = '1' and SIGNAL_LEARNING_DONE = '1')) then
				if(SAMPLING_MODE = '0') then
					GET_SAMPLE_FROM_ADC := '0';
					GET_SAMPLE_WAIT_CNT := to_unsigned(0,32);
				end if;
					
					if(SAMPLING_MODE = '0') then
						   if(samplerate_cnter > 200) then
							EDGE_DETECT_SPEED <= "10";
							else
							EDGE_DETECT_SPEED <= "01";
							end if;
							if(CHANNEL_ID = '0') then
							FIFO_CH_DATAIN(7 downto 0) <= DATA_ADC1_IN;
							elsif(CHANNEL_ID = '1') then
							FIFO_CH_DATAIN(7 downto 0) <= DATA_ADC2_IN;
							end if;
							if(TRIG_FLAG = '1') then
								FIFO_CH_DATAIN(8) <= '1';
							else
								FIFO_CH_DATAIN(8) <= '0';
							end if;	
							FIFO_WRITTE_S <= '1';
							
					elsif(SAMPLING_MODE = '1' and ETS_PACKET_READY_S = '0' and SIGNAL_LEARNING_DONE = '1') then
						
						if(PACKET_NUMBER /= acc_rounds+1) then
							if(PACKET_NUMBER = 1 and ADC_CYCLE_CNT_SET = '0' and SAMPLE_NUMBER = 0) then
								if(SIGNAL_LEARNING_CNT < (ADC_timing_trigger)) then
									if(ETS_ADVANCED_INIT = '0') then
										ETS_ADVANCED_INIT := '1';
										ETS_ADVANCED_START := SIGNAL_LEARNING_CNT;
										ADC_CYCLE_START_CNT := ETS_ADVANCED_START;
									elsif((ADC_CYCLE_START_CNT - (ADC_timing_trigger)) < 0) then
										ADC_CYCLE_START_CNT := ADC_CYCLE_START_CNT + ETS_ADVANCED_START;
									else
										ADC_CYCLE_START_CNT := ADC_CYCLE_START_CNT - (ADC_timing_trigger);
										ETS_PREPARE := '1';
									end if;
								else
									ADC_CYCLE_START_CNT := SIGNAL_LEARNING_CNT-(ADC_timing_trigger);
									ETS_PREPARE := '1';
								end if;
							elsif(PACKET_NUMBER > 1 and ADC_CYCLE_CNT_SET = '0' and SAMPLE_NUMBER = 0) then
								if(SIGNAL_LEARNING_CNT < (ADC_timing_trigger)) then
									if(ETS_ADVANCED_INIT = '0') then
										ETS_ADVANCED_INIT := '1';
										ETS_ADVANCED_START := SIGNAL_LEARNING_CNT;
										ADC_CYCLE_START_CNT := ETS_ADVANCED_START;
									elsif((ADC_CYCLE_START_CNT - (ADC_timing_trigger)) < 0) then
										ADC_CYCLE_START_CNT := ADC_CYCLE_START_CNT + ETS_ADVANCED_START;
									else
										ADC_CYCLE_START_CNT := ADC_CYCLE_START_CNT + ((PACKET_NUMBER-1) * ETS_RESOLUTION) - (ADC_timing_trigger);
										ETS_PREPARE := '1';
									end if;
								else
									ADC_CYCLE_START_CNT := (SIGNAL_LEARNING_CNT-(ADC_timing_trigger)) + ((PACKET_NUMBER-1) * ETS_RESOLUTION);
									ETS_PREPARE := '1';
								end if;
							end if;
							if(ETS_PREPARE = '1') then
							ETS_PREPARE := '0';
							ADC_CYCLE_CNT := ADC_CYCLE_START_CNT;
							ADC_CYCLE_CNT_SET := '1';
							ETS_ADVANCED_INIT := '0';
							if(ADC_CYCLE_START_CNT /= 0) then
							ADC_START_STOP_SIGNAL_S <= '0';
							else
							ADC_START_STOP_SIGNAL_S <= '1';
							end if;
							end if;
						
						if(SAMPLE_NUMBER /= samples_per_packet) then
								if((ADC_CYCLE_START_CNT = ADC_CYCLE_CNT) and (TRIG_FLAG = '1' or NO_TRIG_FOUND = '1') and ADC_CYCLE_CNT /= 0 and GOT_TRIG_IN_PACKET = '0' and INITIALISE_ETS = '0' and ADC_CYCLE_CNT_SET = '1') then
									ADC_CYCLE_CNT := ADC_CYCLE_CNT - 1;
								elsif(ADC_CYCLE_CNT /= 0 and ADC_CYCLE_START_CNT /= ADC_CYCLE_CNT and GOT_TRIG_IN_PACKET = '0' and INITIALISE_ETS = '0' and ADC_CYCLE_CNT_SET = '1') then
									ADC_CYCLE_CNT := ADC_CYCLE_CNT - 1;
								elsif(ADC_CYCLE_CNT = 0 and GOT_TRIG_IN_PACKET = '0' and INITIALISE_ETS = '0' and ADC_CYCLE_CNT_SET = '1') then
									ADC_START_STOP_SIGNAL_S <= '1';
									INITIALISE_ETS <= '1';
								end if;
								
								if(ADC_START_STOP_SIGNAL_S = '1' and ADC_CYCLE_CNT = 0 and fin_ADC = '1' and START_STOP_COUNTER < 2 and GOT_TRIG_IN_PACKET = '0' and INITIALISE_ETS = '1') then
									START_STOP_COUNTER := START_STOP_COUNTER + 1;
								elsif(ADC_START_STOP_SIGNAL_S = '1' and ADC_CYCLE_CNT = 0 and fin_ADC = '1' and START_STOP_COUNTER = 2 and GOT_TRIG_IN_PACKET = '0' and INITIALISE_ETS = '1') then
									START_STOP_COUNTER := 0;
									GOT_TRIG_IN_PACKET := '1';
								end if;
								if(GOT_TRIG_IN_PACKET = '1' and fin_ADC = '1' and ADC_START_STOP_SIGNAL_S = '1') then
									if(CHANNEL_ID = '0') then
										FIFO_CH_DATAIN(7 downto 0) <= DATA_ADC1_IN;
									elsif(CHANNEL_ID = '1') then
										FIFO_CH_DATAIN(7 downto 0) <= DATA_ADC2_IN;
									end if;
									SAMPLE_NUMBER := SAMPLE_NUMBER + 1;
									FIFO_WRITTE_S <= '1';
								end if;	
							else
								PACKET_NUMBER := PACKET_NUMBER + 1;
								SAMPLE_NUMBER := 0;
								GOT_TRIG_IN_PACKET := '0';
								INITIALISE_ETS <= '0';
								ADC_CYCLE_CNT := 0;
								ADC_CYCLE_START_CNT := 0;
								ADC_CYCLE_CNT_SET := '0';
								ETS_PREPARE := '0';
							end if;
						else
							PACKET_NUMBER := 1;
							SAMPLE_NUMBER := 0;
							GOT_TRIG_IN_PACKET := '0';
							ETS_PACKET_READY_S <= '1';
							INITIALISE_ETS <= '0';
							ADC_CYCLE_CNT := 0;
							ADC_CYCLE_START_CNT := 0;
							ADC_CYCLE_CNT_SET := '0';
							SIGNAL_LEARNING_CNT := 0;
							SIGNAL_LEARNING_DONE := '0';
							ETS_PREPARE := '0';
						end if;
					end if;
					TRIG_FLAG := '0';
			end if;
		end if;
	end if;	  
end process;

FIFO_CH_WR <= FIFO_WRITTE_S;
ETS_PACKET_READY <= ETS_PACKET_READY_S;
ADC_START_STOP_SIGNAL <= ADC_START_STOP_SIGNAL_S;

end SAMPLE_ACQUISITION_ETS_ARCH;