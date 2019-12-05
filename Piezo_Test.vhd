-- HB_PIANO.VHD

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY HB_PIANO IS
PORT(
    RESETN : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
	 sclk: in std_logic;
	 btn: in std_logic;
    PIEZO : OUT STD_LOGIC
);
END HB_PIANO;

 ARCHITECTURE HB OF HB_PIANO IS

    CONSTANT CNT_DO : INTEGER RANGE 0 TO 2047 := 1910;
    CONSTANT CNT_RAE : INTEGER RANGE 0 TO 2047 := 1701; 
    CONSTANT CNT_MI : INTEGER RANGE 0 TO 2047 := 1516;
    CONSTANT CNT_FA : INTEGER RANGE 0 TO 2047 := 1431;
    CONSTANT CNT_SOL : INTEGER RANGE 0 TO 2047 := 1275;
    CONSTANT CNT_RA : INTEGER RANGE 0 TO 2047 := 1135;
    CONSTANT CNT_SI : INTEGER RANGE 0 TO 2047 := 1011;
    CONSTANT CNT_HDO : INTEGER RANGE 0 TO 2047 := 955;

    SIGNAL REG : STD_LOGIC;
    SIGNAL CNT : INTEGER RANGE 0 TO 2047;
    SIGNAL LIMIT : INTEGER RANGE 0 TO 2047;
	 
	 TYPE state is (S0, S1, S2, S3,S4);
	 signal Current_State: state;
	 

BEGIN

	PROCESS(clk, RESETN, btn, sclk)
	begin
		if (RESETN = '1') then
				LIMIT <= 0;
				Current_State <= S0;
		elsif (rising_edge(CLK) ) then
			case Current_state is
				when S0 => 
					LIMIT <= 0;
					if (btn = '1') then
						Current_State <= S1;
					end if;
				when S1 => 
					LIMIT <= CNT_DO;
					if (btn = '1') then
						Current_State <= S0;
					elsif (sclk = '1') then
						Current_State <= S2;
					end if;
				when S2 => 
					LIMIT <= CNT_RAE;
					if (btn = '1') then
						Current_State <= S0;
					elsif (sclk = '1') then
						Current_State <= S3;
					end if;
				when S3 => 
					LIMIT <= CNT_MI;
					if (btn = '1') then
						Current_State <= S0;
					elsif (sclk = '1') then
						Current_State <= S4;
					end if;				
				when S4 => 
					LIMIT <= CNT_FA;
					if (btn = '1') then
						Current_State <= S0;
					elsif (sclk = '1') then
						Current_State <= S0;
					end if;									
			end case;
		end if;	
	END PROCESS;

PROCESS(RESETN, CLK, CNT)
BEGIN
    IF RESETN = '1' THEN
        CNT <= 0;
        REG <= '0';
    ELSIF  clk'event and CLK = '1' THEN
        IF CNT >= LIMIT THEN
            CNT <= 0;
            REG <= NOT REG;
        ELSE
            CNT <= CNT + 1;
        END IF;
	end if;		
END PROCESS; 

PIEZO <= REG;

END HB;

