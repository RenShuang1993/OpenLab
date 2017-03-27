LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY OPENLAB_FPGA_OSCILLOSCOPE_TOP   IS
  GENERIC(
		PWM_resolution 	: integer := 8;          --bits of resolution setting the duty cycle
		PWM_phases        : integer := 2;
		FIFO_word_length	: natural := 9);         --number of output pwms and PWM_phases
  PORT(
		CLOCK_50   	 		: in  std_logic;                    --system clock
		UART_TXD	 		   : out std_logic;
		UART_RXD	 		 	: in  std_logic;
		STATUS_LED		 	: out std_logic_vector (9 downto 0);
		COMSPEED_SEL_SW 	: in  std_logic_vector(1 downto 0);
		sclk_SPI1			: out std_LOGIC;
      CS_SPI1				: out std_logic;
      sdio_SPI1			: in  std_logic;
		sclk_SPI2			: out std_logic;
		CS_SPI2				: out std_logic;
		sdio_SPI2			: in  std_logic;
		AMP1_SEL				: out std_logic_vector (2 downto 0);
		AMP2_SEL				: out std_logic_vector (2 downto 0);
		TRIG_IN1				: in  std_logic;
		TRIG_IN2				: in  std_logic;
		TRIG_OUT1			: out std_logic;
		TRIG_OUT2			: out std_logic;
		PWM_outComp			: out std_logic);
END OPENLAB_FPGA_OSCILLOSCOPE_TOP;

ARCHITECTURE OPENLAB_FPGA_OSCILLOSCOPE_TOP_ARCH OF OPENLAB_FPGA_OSCILLOSCOPE_TOP IS

	 signal CLOCK_120:std_logic;
	 signal CLOCK_80:std_logic;
	 signal TX_DATA: STD_logic_vector(7 downto 0);
	 signal RX_DATA: STD_logic_vector(7 downto 0);
	 signal TX_START: std_logic;
    signal TX_BUSY: std_logic;
    signal TX_FINISHED: std_LOGIC;
	 signal RX_FINISHED: std_LOGIC;
	 signal DATA_ADC1_IN:std_logic_vector(7 downto 0);
	 signal DATA_ADC2_IN:std_logic_vector(7 downto 0);
	 signal fin_ADC1 : std_logic;
	 signal fin_ADC2 : std_logic;
	 signal START_STOP_ADC1 : std_logic := '1';
	 signal START_STOP_ADC2 : std_logic := '1';
	 signal ACT_CMD : unsigned(3 downto 0) := to_unsigned(0,4);
	 signal chan_1_ON : std_logic := '0';
	 signal chan_2_ON : std_logic := '0';
	 
	 signal PWM_reset_s : std_LOGIC;
	 signal PWM_duty_s : std_logic_vector(PWM_resolution-1 downto 0);
	 signal PWM_ena_s : std_logic;
	 signal PWM_out_s : std_logic_vector(PWM_phases-1 downto 0);
	 signal PWM_outComp_s : std_logic_vector(PWM_phases-1 downto 0);
	 CONSTANT PWM_duty_fixed : std_logic_vector(PWM_resolution-1 downto 0) := x"80";
	 
	 signal TRIG1_RISE : std_logic := '0';
	 signal TRIG1_FALL : std_logic := '0';
	 signal TRIG2_RISE : std_logic := '0';
	 signal TRIG2_FALL : std_logic := '0';
	 
	 signal EDGE_DETECT_SPEED_1 : std_logic_vector(1 downto 0);
	 signal EDGE_DETECT_SPEED_2 : std_logic_vector(1 downto 0);
	 
	 signal FIFO_CH1_RESET : std_logic := '1';
	 signal FIFO_CH1_WR	 : std_logic := '0';
	 signal FIFO_CH1_RD	 : std_logic := '0';
	 signal FIFO_CH1_DATAIN: std_logic_vector(8 downto 0);
	 signal FIFO_CH1_DATAOUT: std_logic_vector(8 downto 0);
	 signal FIFO_CH1_EMPTY : std_logic;
	 signal FIFO_CH1_FULL	 : std_logic;
	 
	 signal FIFO_CH2_RESET : std_logic := '1';
	 signal FIFO_CH2_WR	 : std_logic := '0';
	 signal FIFO_CH2_RD	 : std_logic := '0';
	 signal FIFO_CH2_DATAIN: std_logic_vector(8 downto 0);
	 signal FIFO_CH2_DATAOUT: std_logic_vector(8 downto 0);
	 signal FIFO_CH2_EMPTY : std_logic;
	 signal FIFO_CH2_FULL	 : std_logic;
	 
	 signal ETS_PACKET_READY_1 : std_logic := '0';
	 signal ETS_PACKET_READY_2 : std_logic := '0';
	 signal ETS_PACKET_SEND : std_logic := '1';
	 
	 signal SAMPLE_DATA_RESET_1: std_logic := '0';
	 signal SAMPLE_DATA_RESET_2: std_logic := '0';
	 signal DUAL_CHANNEL_MODE_STATUS : std_logic := '0';
	 signal DUAL_CHANNEL_MODE_ON : std_logic := '0';
	 signal SAMPLERATE_CNTER: unsigned(31 downto 0) := to_unsigned(2400,32); 
	 signal ACC_ROUNDS: unsigned(31 downto 0) := to_unsigned(0,32);
	 signal SAMPLES_PER_PACKET : unsigned(15 downto 0) := to_unsigned(512,16);
	 
	 signal TRIGGER_CHAN: std_logic_vector(7 downto 0) := x"00";
	 signal TRIGGER_TYPE : unsigned(1 downto 0) := to_unsigned(0,2);
	 signal SAMPLING_MODE: std_logic := '0';
	 signal PWM_RESET: std_logic := '0';
	 signal PWM_ENA : std_logic := '0';
	 signal PWM_DUTY : std_logic_vector(PWM_resolution-1 downto 0);
	 signal FREQUENCY_CH1 : std_logic_vector(31 downto 0);
	 signal FREQUENCY_CH2 : std_logic_vector(31 downto 0);
	 
	 COMPONENT SERIAL_COM_8N1_SPEEDSEL IS
		PORT(CLOCK_120 : in std_logic;
			UART_TXD : OUT std_logic;
		  UART_RXD : in std_logic;
		  TX_DATA : in STD_LOGIC_VECTOR(7 DOWNTO 0);
		  RX_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		  TX_BUSY : OUT std_logic;
		  TX_START : in std_logic;
		  TX_FINISHED : OUT std_logic;
		  RX_FINISHED : OUT std_logic;
		  COMSPEED_SEL_SW : in STD_LOGIC_VECTOR(1 downto 0));
END COMPONENT SERIAL_COM_8N1_SPEEDSEL;


COMPONENT OPENLAB_FIFO is
    Port ( Din   : in  STD_LOGIC_VECTOR (FIFO_word_length-1 downto 0);
           Wr    : in  std_logic;
           Dout  : out STD_LOGIC_VECTOR (FIFO_word_length-1 downto 0);
           Rd    : in  std_logic;
           Empty : out std_logic;
           Full  : out std_logic;
           CLK   : in  std_logic;
			  Reset : in std_logic;
			  mode  : in std_logic
           );
end COMPONENT OPENLAB_FIFO;



	COMPONENT edge_detect is
	  port (async_sig : in std_logic;
        clk       : in std_logic;
        rise      : out std_logic;
        fall      : out std_logic;
		  EDGE_DETECT_SPEED : in std_logic_vector(1 downto 0);
		  FREQUENCY	: OUT std_logic_vector(31 downto 0));
	end COMPONENT edge_detect;


    COMPONENT PLL
      PORT (inclk0: in std_LOGIC;
            c0 : OUT std_LOGIC;
				c1 : OUT std_logic);
    END COMPONENT PLL;
	 
	 COMPONENT ADS7885_IPCORE IS
  PORT (clock_120   : in     std_logic;                      --system clock
		  clock_80	  : in	  std_logic;
        sclk    	  : OUT    std_logic;                      --spi clock
        CS      	  : OUT    std_logic;                      --slave select
        sdio    	  : in     std_logic;                      --serial data input output
        rx_data 	  : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0);
		  fin_SPI 	  : OUT 	 std_logic;
		  START_STOP  : in std_logic);
END COMPONENT ADS7885_IPCORE;
	 
	 COMPONENT PWM IS
		generic (pwm_freq : integer);
		PORT(
      clk       : in  std_logic;                                    --system clock
      reset_n   : in  std_logic;                                    --asynchronous reset
      ena       : in  std_logic;                                    --latches in new duty cycle
      duty      : in  STD_LOGIC_VECTOR(PWM_resolution-1 DOWNTO 0); --duty cycle
      pwm_out   : OUT STD_LOGIC_VECTOR(PWM_phases-1 DOWNTO 0));          --pwm outputs
END COMPONENT PWM;
	 
	COMPONENT SAMPLE_ACQUISITION_ETS IS
	PORT(
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
	END COMPONENT SAMPLE_ACQUISITION_ETS;
	 
	COMPONENT OPENLAB_BINARY_PROTO   IS
    port(
		  CLOCK_120   			 		: in  std_logic;
		  ACT_CMD	  			 		: out unsigned(3 downto 0);
		  SAMPLING_MODE   	 		: out std_logic;
		  AMP1_SEL				 		: out std_logic_vector (2 downto 0);
		  AMP2_SEL				 		: out std_logic_vector (2 downto 0);
		  TX_BUSY 				 		: in  std_logic;
		  TX_DATA 				 		: out std_logic_vector(7 downto 0);
		  RX_DATA 				 		: in  std_logic_vector(7 downto 0);
		  TX_START 						: out std_logic;
		  RX_FINISHED					: in  std_logic;
		  TX_FINISHED					: in  std_logic;
		  ETS_PACKET_SEND 			: out std_logic;
		  ETS_PACKET_READY_1  		: in  std_logic;
		  ETS_PACKET_READY_2  		: in  std_logic;
		  CHAN_1_ON				 		: out std_logic;
		  CHAN_2_ON				 		: out std_logic;
		  SAMPLE_DATA_RESET_1 		: in  std_logic;
		  SAMPLE_DATA_RESET_2 		: in  std_logic;
		  SAMPLERATE_CNTER 			: out unsigned(31 downto 0);
		  TRIGGER_TYPE       		: out unsigned(1 downto 0);
		  TRIGGER_CHAN					: out std_logic_vector(7 downto 0);
		  ACC_ROUNDS			 		: out unsigned(31 downto 0);
		  DUAL_CHANNEL_MODE_ON 		: out std_logic;
		  DUAL_CHANNEL_MODE_STATUS : out std_logic;
		  SAMPLES_PER_PACKET 		: out unsigned(15 downto 0);
		  PWM_RESET						: out std_logic;
		  PWM_DUTY						: out std_logic_vector(7 downto 0);
		  PWM_ENA						: out std_logic;
		  STATUS_LED					: out std_logic_vector(9 downto 0);
		  FIFO_CH1_RD					: out std_logic;
		  FIFO_CH2_RD					: out std_logic;
		  FIFO_CH1_EMPTY				: in  std_logic;
		  FIFO_CH2_EMPTY				: in  std_logic;
		  FIFO_CH1_DATAOUT			: in  std_logic_vector(8 downto 0);
		  FIFO_CH2_DATAOUT			: in  std_logic_vector(8 downto 0);
		  FREQUENCY_CH1_PORT			: in  std_logic_vector(31 downto 0);
		  FREQUENCY_CH2_PORT			: in  std_logic_vector(31 downto 0));
END COMPONENT OPENLAB_BINARY_PROTO; 
	 
	 
	 BEGIN

	 C0: PLL PORT MAP (CLOCK_50,CLOCK_120,CLOCK_80);
	 C1: SERIAL_COM_8N1_SPEEDSEL PORT MAP (CLOCK_120,UART_TXD,UART_RXD,TX_DATA,RX_DATA,TX_BUSY,TX_START,TX_FINISHED,RX_FINISHED,COMSPEED_SEL_SW);
	 C2: ADS7885_IPCORE PORT MAP (CLOCK_120,CLOCK_80,sclk_SPI1,CS_SPI1,sdio_SPI1,DATA_ADC1_IN,fin_ADC1,START_STOP_ADC1);
	 C3: ADS7885_IPCORE PORT MAP (CLOCK_120,CLOCK_80,sclk_SPI2,CS_SPI2,sdio_SPI2,DATA_ADC2_IN,fin_ADC2,START_STOP_ADC2);
	 C4: PWM generic map (pwm_freq => 5000) PORT MAP (CLOCK_120,PWM_RESET,PWM_ena,PWM_DUTY(PWM_resolution-1 downto 0),PWM_out_s(PWM_phases-1 downto 0));
	 C5: PWM generic map (pwm_freq => 1000) PORT MAP (CLOCK_120,PWM_RESET,PWM_ena,PWM_duty_fixed(PWM_resolution-1 downto 0),PWM_outComp_s(PWM_phases-1 downto 0));
	 C6: edge_detect PORT MAP (TRIG_IN1,CLOCK_120,TRIG1_RISE,TRIG1_FALL,EDGE_DETECT_SPEED_1(1 downto 0),FREQUENCY_CH1); 
	 C7: edge_detect PORT MAP (TRIG_IN2,CLOCK_120,TRIG2_RISE,TRIG2_FALL,EDGE_DETECT_SPEED_2(1 downto 0),FREQUENCY_CH2);
	 C8: OPENLAB_FIFO PORT MAP (FIFO_CH1_DATAIN,FIFO_CH1_WR,FIFO_CH1_DATAOUT,FIFO_CH1_RD,FIFO_CH1_EMPTY,FIFO_CH1_FULL,CLOCK_120,FIFO_CH1_RESET,'1');
	 C9: OPENLAB_FIFO PORT MAP (FIFO_CH2_DATAIN,FIFO_CH2_WR,FIFO_CH2_DATAOUT,FIFO_CH2_RD,FIFO_CH2_EMPTY,FIFO_CH2_FULL,CLOCK_120,FIFO_CH2_RESET,'1');
	 C10: SAMPLE_ACQUISITION_ETS PORT MAP (CLOCK_120, ETS_PACKET_SEND, ETS_PACKET_READY_1, ACT_CMD, chan_1_on, SAMPLE_DATA_RESET_1, start_stop_ADC1, SAMPLERATE_CNTER, 
			TRIGGER_TYPE, TRIGGER_CHAN, SAMPLING_MODE, TRIG1_RISE, TRIG1_FALL, TRIG2_RISE, TRIG2_FALL, DATA_ADC1_IN, DATA_ADC2_IN, FIFO_CH1_DATAIN, FIFO_CH1_WR, FIFO_CH1_RESET,
			ACC_ROUNDS, EDGE_DETECT_SPEED_1(1 downto 0),DUAL_CHANNEL_MODE_ON,DUAL_CHANNEL_MODE_STATUS,'0',SAMPLES_PER_PACKET,fin_ADC1);
	 C11: SAMPLE_ACQUISITION_ETS PORT MAP (CLOCK_120, ETS_PACKET_SEND, ETS_PACKET_READY_2, ACT_CMD, chan_2_on, SAMPLE_DATA_RESET_2, start_stop_ADC2, SAMPLERATE_CNTER, 
			TRIGGER_TYPE, TRIGGER_CHAN, SAMPLING_MODE, TRIG1_RISE, TRIG1_FALL, TRIG2_RISE, TRIG2_FALL, DATA_ADC1_IN, DATA_ADC2_IN, FIFO_CH2_DATAIN, FIFO_CH2_WR, FIFO_CH2_RESET,
			ACC_ROUNDS, EDGE_DETECT_SPEED_2(1 downto 0),DUAL_CHANNEL_MODE_ON,DUAL_CHANNEL_MODE_STATUS,'1',SAMPLES_PER_PACKET,fin_ADC2);
	 C12: OPENLAB_BINARY_PROTO PORT MAP (CLOCK_120, ACT_CMD, SAMPLING_MODE, AMP1_SEL, AMP2_SEL, TX_BUSY, TX_DATA, RX_DATA, TX_START, RX_FINISHED, TX_FINISHED, ETS_PACKET_SEND, ETS_PACKET_READY_1,
			ETS_PACKET_READY_2, CHAN_1_ON, CHAN_2_ON, SAMPLE_DATA_RESET_1, SAMPLE_DATA_RESET_2, SAMPLERATE_CNTER, TRIGGER_TYPE, TRIGGER_CHAN, ACC_ROUNDS, DUAL_CHANNEL_MODE_ON,
			DUAL_CHANNEL_MODE_STATUS, SAMPLES_PER_PACKET, PWM_RESET, PWM_DUTY, PWM_ENA, STATUS_LED,FIFO_CH1_RD,FIFO_CH2_RD,FIFO_CH1_EMPTY,FIFO_CH2_EMPTY, FIFO_CH1_DATAOUT, FIFO_CH2_DATAOUT,FREQUENCY_CH1,FREQUENCY_CH2);

	TRIG_OUT1 <= PWM_out_s(0);
	TRIG_OUT2 <= PWM_out_s(1);
	PWM_outComp <= PWM_outComp_s(0);
	
	end OPENLAB_FPGA_OSCILLOSCOPE_TOP_ARCH;