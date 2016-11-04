----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:39 10/21/2016 
-- Design Name: 
-- Module Name:    alu - main 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
	PORT(clk: in STD_LOGIC;
	input: in STD_LOGIC_VECTOR(15 downto 0);
	output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end alu;

architecture main of alu is
signal status:STD_LOGIC_VECTOR(1 downto 0) := "00";
signal res:STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal op1:STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal op2:STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal opnum:STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	output<=input;
	process(clk)
	
	begin
		if clk'event and clk = '1' then
			if status(0) = '0' then
				if status(1) = '0' then
					status <= "01";
				else
					status <= "11";
				end if;
			else
				if status(1) = '0' then
					status <= "00";
				else
					status <= "10";
				end if;
			end if;
		end if;
	end process;
end main;

