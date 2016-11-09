LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder1 is
	port(
		input1:in STD_LOGIC;
		input2:in STD_LOGIC;
		cin:in STD_LOGIC;
		res:out STD_LOGIC;
		cout:out STD_LOGIC
	);
end adder1;

architecture add of adder1 is
COMPONENT adder_half
	port(
		input1:in STD_LOGIC;
		input2:in STD_LOGIC;
		res:out STD_LOGIC;
		cout:out STD_LOGIC
	);
end COMPONENT;
SIGNAL tmp1, tmp2, tmp3:STD_LOGIC;
begin
	h1: adder_half PORT MAP(input1, input2, tmp1, tmp2);
	h2: adder_half PORT MAP(tmp1, cin, res, tmp3);
	cout <= tmp2 or tmp3;
end add;