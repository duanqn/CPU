LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_half is
	port(
		input1:in STD_LOGIC;
		input2:in STD_LOGIC;
		res:out STD_LOGIC;
		cout:out STD_LOGIC
	);
end adder_half;

architecture add1b of adder_half is
begin
	res <= input1 xor input2;
	cout <= input1 and input2;
end add1b;