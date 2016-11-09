library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
  PORT(
    op1:in STD_LOGIC_VECTOR(31 downto 0);
    op2:in STD_LOGIC_VECTOR(31 downto 0);
    cminus1:in STD_LOGIC;
    res:out STD_LOGIC_VECTOR(31 downto 0);
    cf:out STD_LOGIC
  );
end adder;

architecture add of adder is
signal G:STD_LOGIC_VECTOR(31 downto 0) := x'00000000';
signal P:STD_LOGIC_VECTOR(31 downto 0) := x'00000000';
signal carry:STD_LOGIC_VECTOR(31 downto 0) := x'00000000';
begin
  cminus1 <= not opselect;  -- 0 for add AND 1 for sub
  G <= op1 AND op2;
  P <= op1 OR op2;
  carry(0)<=G(0) OR (P(0) AND cminus1);
  carry(1)<=G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND cminus1);
  carry(2)<=G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND cminus1);
  carry(3)<=G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) and P(1) and P(0) and cminus1);
  carry(4)<=G(4) OR (P(4) AND G(3)) OR (P(4) AND P(3) AND G(2)) OR (P(4) AND P(3) AND P(2) AND G(1)) OR (P(4) AND P(3) and P(2) and P(1) and G(0)) OR (P(4) and P(3) and P(2) and P(1) and P(0) and cminus1);
  carry(5)<=G(5) OR (P(5) AND G(4)) OR (P(5) AND P(4) AND G(3)) OR (P(5) AND P(4) AND P(3) AND G(2)) OR (P(5) AND P(4) and P(3) and P(2) and G(1)) OR (P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) OR (P(5) and P(4) and P(3) and P(2) and P(1) and P(0) and cminus1);
  ---打表！！！
  res <= 
end