LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY multi4 IS
	PORT (
		input1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		outp: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		cout: OUT STD_LOGIC;
		zero: OUT STD_LOGIC;
		
		reset: IN STD_LOGIC;
		CLK: IN STD_LOGIC);
END multi4;

ARCHITECTURE logicMulti4 OF multi4 IS


	TYPE State_type IS (S1, S2, S3, S4, S5);
	SIGNAL y: State_type;
	SIGNAL I: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL seting: STD_LOGIC;

	SIGNAL a : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	SIGNAL b: STD_LOGIC_VECTOR (7 DOWNTO 0):="00000000";


	--BUFFER SIGNAL FOR MUX
	SIGNAL a1: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL o1: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL a2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL o2: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	
	SIGNAL sel: STD_LOGIC;
	SIGNAL shift: STD_LOGIC;

BEGIN

state_trans:PROCESS(reset,CLK)
begin
	if reset = '0' then
		y <= S1;
	elsif(CLK'EVENT and CLK = '1') then
		case y is
			when S1 => 
			IF input2(to_integer(unsigned(I))) = '1' THEN y<= S2; ELSE y<= S3;  END IF;
			when S2 => 
			IF to_integer(unsigned(I)) = 4 THEN y<= S5; ELSE y<= S4; END IF;
			when S3 => 
			IF to_integer(unsigned(I)) = 4 THEN y<= S5; ELSE y<= S4; END IF;
			when S4 =>
			IF input2(to_integer(unsigned(I))) = '1' THEN y<= S2; ELSE y<= S3;  END IF;
			when S5 => null;
		end case;
	end if;
	
end process;

control_out: PROCESS (CLK)
begin
	if(CLK'EVENT and CLK = '1') then
		
		case y is
			when S1 => 
				shift<='0'; sel<='0';
				seting<= '1'; I<="001";
			when S2 => 
				sel<='1';shift<='0'; seting<='0';
			when S3 => 
				sel<='0';shift<='0'; seting<='0';
			when S4 => 
				seting<='0'; sel<='0';
				shift <= '1'; 
				I <= STD_LOGIC_VECTOR ( unsigned(I) + 1);
			when S5 =>
				sel<='0';shift<='0';seting<='0';
		end case;
	end if;
	
end process;

	reseting: work.reset_mul8 PORT MAP(seting, input1, input2, a, b, CLK);
	a1_mux: work.mux2_1_8b PORT MAP(seting, a2, a,a1);
	o1_mux: work.mux2_1_8b PORT MAP(seting, o2, "00000000",o1);	
	adder: work.add8 PORT MAP(sel,'0', o1, a1, '0', o2, cout, CLK);
	left_shift: work.left8 PORT MAP(shift, a1, a2, CLK);
	zero_c: work.check_zero PORT MAP(o2, zero);
	outp <= o2;

END logicMulti4;	