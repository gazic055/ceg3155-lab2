LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY lab2 IS
	PORT (
		sel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		input1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		outp: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		cout: OUT STD_LOGIC;
		zero: OUT STD_LOGIC;
		overf: OUT STD_LOGIC;
		
		GReset: IN STD_LOGIC;
		GClock: IN STD_LOGIC);
END lab2;

ARCHITECTURE logicLab2 OF lab2 IS

	SIGNAL s1,s2,s3,s4 : STD_LOGIC;
	SIGNAL a, b: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL os1, os2, os3, os4: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL z1, z2, z3, z4: STD_LOGIC;
	SIGNAL c1, c2: STD_LOGIC;
	SIGNAL ove1,over2: STD_LOGIC;
	SIGNAL seting: STD_LOGIC;
BEGIN
	PROCESS (GClock)
	begin 
	
	if GReset = '0' then
		seting <= '1';
	else
		seting <= '0';
	end if;
	END PROCESS;
	
	set_in: work.reset_mul8 PORT MAP(seting, input1, input2, a, b, GClock);
	add: work.add8 PORT MAP('1','0',a,b,'0',os1,c1,GClock);
	sub: work.add8 PORT MAP('1', '0',a,b,'1',os2,c2,GClock);
	mul: work.multi4 PORT MAP(input1, input2, os3,open,z3,GReset, GClock);
	div: work.div4 PORT MAP(input1, input2, os4,open,z4,GReset, GClock);
	
	add_z: work.check_zero PORT MAP(os1,z1);
	sub_z: work.check_zero PORT MAP(os2,z2);
	
	ove1 <=( a(7) xor b(7) )  or ( b(7) xor os1(7));
	over2 <=( a(7) xor b(7) )  or ( b(7) xor os2(7));
	
	output_mux: work.mux4_1_8b PORT MAP(sel,os1,os2,os3,os4, outp);
	zero_mux: work.mux4_1_1b PORT MAP(sel,z1,z2,z3,z4, zero);
	carry_mux: work.mux4_1_1b PORT MAP(sel,c1,c2,'0','0', cout);
	over_mux: work.mux4_1_1b PORT MAP(sel,ove1,over2,'0','0', overf);
	
	
END logicLab2;	