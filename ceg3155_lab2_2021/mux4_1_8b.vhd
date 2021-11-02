LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux4_1_8b IS
	PORT (
		inp: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		c: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		d: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		
		o: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END mux4_1_8b;

ARCHITECTURE logicmux4_1 OF mux4_1_8b IS
	
BEGIN
	PROCESS(inp)
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
END logicmux4_1;	
	