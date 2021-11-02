LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY check_zero IS
	PORT (
		inp: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		o: OUT STD_LOGIC);
END check_zero;

ARCHITECTURE logicz OF check_zero IS
	signal temp: STD_LOGIC;
BEGIN
	
	temp <=  inp(0) or inp(1) or inp(2) or inp(3) or inp(4) or inp(5) or inp(6) or inp(7);
	o <= not temp;

END logicz;	
	