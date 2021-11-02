LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reset_mul8 IS
	PORT (
		inp: IN STD_LOGIC;
		input1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		input2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		a: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		b: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		
		CLK: IN STD_LOGIC);
END reset_mul8;

ARCHITECTURE logicreset_mul8 OF reset_mul8 IS

BEGIN

			i0: work.dFF_2 PORT MAP(input1(0), CLK, a(0), open);
			i1: work.dFF_2 PORT MAP(input1(1), CLK, a(1), open);
			i2: work.dFF_2 PORT MAP(input1(2), CLK, a(2), open);
			i3: work.dFF_2 PORT MAP(input1(3), CLK, a(3), open);
			i4: work.dFF_2 PORT MAP('0', CLK, a(4), open);
			i5: work.dFF_2 PORT MAP('0', CLK, a(5), open);
			i6: work.dFF_2 PORT MAP('0', CLK, a(6), open);
			i7: work.dFF_2 PORT MAP('0', CLK, a(7), open);
			
			ib0: work.dFF_2 PORT MAP(input2(0), CLK, b(0), open);
			ib1: work.dFF_2 PORT MAP(input2(1), CLK, b(1), open);
			ib2: work.dFF_2 PORT MAP(input2(2), CLK, b(2), open);
			ib3: work.dFF_2 PORT MAP(input2(3), CLK, b(3), open);
			ib4: work.dFF_2 PORT MAP('0', CLK, b(4), open);
			ib5: work.dFF_2 PORT MAP('0', CLK, b(5), open);
			ib6: work.dFF_2 PORT MAP('0', CLK, b(6), open);
			ib7: work.dFF_2 PORT MAP('0', CLK, b(7), open);
	
END logicreset_mul8;	
	