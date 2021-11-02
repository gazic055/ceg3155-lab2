LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY s_add4 IS
	PORT (
		sel: IN STD_LOGIC;
		Cin: IN  STD_LOGIC;
		a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		oper: IN STD_LOGIC;
		sum: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		Cout: OUT STD_LOGIC;
		CLK: IN STD_LOGIC);
END s_add4;

ARCHITECTURE logicAdd4 OF s_add4 IS
	SIGNAL carryout : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL c: STD_LOGIC;
	SIGNAL oprB : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN

PROCESS(CLK)
begin
	if (sel = '0') then
		oprB <= "0000";
		c<= '0';
	else
		if (oper = '1') then
			oprB(0) <= NOT b(0);
			oprB(1) <= NOT b(1);
			oprB(2) <= NOT b(2);
			oprB(3) <= NOT b(3);
			c <= '1';
		else 
			oprB(0) <= b(0);
			oprB(1) <= b(1);
			oprB(2) <= b(2);
			oprB(3) <= b(3);
			c <= Cin;
		end if;
	end if;

end process;
	

	bit0: work.onebitadder PORT MAP(c,a(0),oprB(0),sum(0),carryout(0));
	bit1: work.onebitadder PORT MAP(carryout(0),a(1),oprB(1),sum(1),carryout(1));
	bit2: work.onebitadder PORT MAP(carryout(1),a(2),oprB(2),sum(2),carryout(2));
	bit3: work.onebitadder PORT MAP(carryout(2),a(3),oprB(3),sum(3),Cout);

END logicAdd4;	
	