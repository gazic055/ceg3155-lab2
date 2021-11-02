LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2_1_4b IS
	PORT (
		inp: IN STD_LOGIC;
		a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		o: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END mux2_1_4b;

ARCHITECTURE logicmux2_1_4 OF mux2_1_4b IS
	
BEGIN

		o <= b when (inp = '1') else a;
		
END logicmux2_1_4;	
	