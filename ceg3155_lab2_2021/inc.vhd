LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY inc IS
	PORT (
		reset: IN STD_LOGIC;
		inp: IN STD_LOGIC;
		a: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		b: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		CLK: IN STD_LOGIC);
END inc;

ARCHITECTURE logicinc OF inc IS

BEGIN
	PROCESS(CLK)
	BEGIN
	if(CLK'EVENT and CLK = '1') then
		if inp = '1' then
			b <= STD_LOGIC_VECTOR ( unsigned(a) + 1);
		elsif reset = '1'then 
			b <= "000";
		else
			b <= a;
		end if;
	end if;
	END PROCESS;
END logicinc;	
	