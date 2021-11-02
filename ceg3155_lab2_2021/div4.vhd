LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY div4 IS
	PORT (
		input1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		outp: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		cout: OUT STD_LOGIC;
		zero: OUT STD_LOGIC;
		
		reset: IN STD_LOGIC;
		CLK: IN STD_LOGIC);
END div4;

ARCHITECTURE divider4 OF div4 IS


	TYPE State_type IS (S1, S2, S3);
	SIGNAL y: State_type;
	
	SIGNAL seting: STD_LOGIC;
	SIGNAL keepAdding: STD_LOGIC;
	
	SIGNAL Q: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL R: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL temp1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL OUTPP: STD_LOGIC_VECTOR (7 DOWNTO 0); 

BEGIN

state_trans:PROCESS(reset,CLK)
begin
	if reset = '0' then
		y <= S1;
	elsif(CLK'EVENT and CLK = '1') then
		case y is
			when S1 => 
				IF (to_integer(unsigned(temp1)) > to_integer(unsigned(input2))) then
					y <= S2;
				ELSE
					y <=S3;
				END IF;
			when S2 => 
				IF ( to_integer(unsigned(temp1)) > to_integer(unsigned(input2))) then
					y <= S2;
				ELSE
					y <=S3;
				END IF;
			when S3 => 
			null;
		end case;
	end if;
	
end process;

control_out: PROCESS (CLK)
begin
	if(CLK'EVENT and CLK = '1') then
		
		case y is
			when S1 => 
				seting <= '1';
				keepAdding <= '1';
			when S2 => 
				seting<='0';
				keepAdding <= '1';
				Q <= STD_LOGIC_VECTOR ( unsigned(Q) + 1);
			when S3 => 
				seting<='0';
				keepAdding <= '0';
		end case;
	end if;
	
end process;
	
	subtrac_t : work.s_add4 PORT MAP(keepAdding,'1', R, input2, '1', temp1, open, CLK );
	R_mux: work.mux2_1_4b PORT MAP(seting,temp1, input1, R);
	Zero_checking: work.check_zero PORT MAP(OUTPP, zero);
	--Q_mux: work.mux2_1_4b PORT MAP(seting,temp1, "0000", Q);
	
	OUTPP(7 DOWNTO 4) <= R;
	OUTPP(3 DOWNTO 0) <= Q;
	outp <= OUTPP;
	

END divider4;	