LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux4_1_1b IS
	PORT (
		inp: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		a: IN STD_LOGIC;
		b: IN STD_LOGIC;
		c: IN STD_LOGIC;
		d: IN STD_LOGIC;
		
		
		o: OUT STD_LOGIC);
END mux4_1_1b;

ARCHITECTURE logicmux4 OF mux4_1_1b IS
	
BEGIN
	process(inp)
	begin
		case inp is
			when "00" =>
				o <=a;
			when "01" =>
				o <=b;
			when "10" =>
				o <=c;
			when "11" =>
				o <=d;
			end case;
	end process;
END logicmux4;	
	