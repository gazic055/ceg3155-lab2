LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY out_flow IS
	PORT (
		sel: IN STD_LOGIC;
		a1: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		buff: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		a2: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		outp: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		CLK: IN STD_LOGIC);
		
END out_flow;

ARCHITECTURE logicFlow OF out_flow IS
	
BEGIN

	PROCESS(CLK)
	begin
		if sel = '1' then
			a2<= buff;
			outp<= buff;
		else
			outp <= a1;
			a2 <= a1;
		end if;
			
	end process;

END logicFlow;	
	