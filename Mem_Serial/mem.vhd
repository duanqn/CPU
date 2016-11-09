LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem is
	PORT(
		rst:in STD_LOGIC;
		clk:in STD_LOGIC;
		input:in STD_LOGIC_VECTOR(15 downto 0);
		light:out STD_LOGIC_VECTOR(15 downto 0);
		out1:out STD_LOGIC;
		out2:out STD_LOGIC;
		out3:out STD_LOGIC;
		ram1addr:out STD_LOGIC_VECTOR(17 downto 0);
		ram1data:inout STD_LOGIC_VECTOR(15 downto 0);
		ram2addr:out STD_LOGIC_VECTOR(17 downto 0);
		ram2data:inout STD_LOGIC_VECTOR(15 downto 0);
		ram1EN:out STD_LOGIC;
		ram1WE:out STD_LOGIC;
		ram1RE:out STD_LOGIC;
		ram2EN:out STD_LOGIC;
		ram2WE:out STD_LOGIC;
		ram2RE:out STD_LOGIC;
		serial_read:out STD_LOGIC;
		serial_write:out STD_LOGIC
		);
end mem;

architecture mem_acc of mem is
constant chipEnable:STD_LOGIC := '0';
constant writeEnable:STD_LOGIC := '0';
constant readEnable:STD_LOGIC := '0';
constant chipDisable:STD_LOGIC := '1';
constant writeDisable:STD_LOGIC := '1';
constant readDisable:STD_LOGIC := '1';
begin
	ram2EN <= chipDisable;
	ram2RE <= readDisable;
	ram2WE <= writeDisable;
	serial_read <= readDisable;
	serial_write <= writeDisable;
	ram2addr <= "000000000000000000";
	ram2data <= "0000000000000000";
	process(clk, rst)
	variable status:STD_LOGIC_VECTOR(2 downto 0) := "000";
	variable addr:STD_LOGIC_VECTOR(17 downto 0) := "000000000000000000";
	variable data:STD_LOGIC_VECTOR(15 downto 0) := x"0000";
	begin
		out1 <= status(0);
		out2 <= status(1);
		out3 <= status(2);
		if rst = '0' then
			ram1EN <= chipEnable;
			ram1WE <= writeDisable;
			ram1RE <= readDisable;
			status := "000";
		elsif clk'event and clk = '1' then
			case status is
				when "000" =>	--Prepare
				status := "001";
				when "001" =>	--Address for writing
				addr := "00"&input;
				status := "011";
				when "011" =>	--Data for writing
				data := input;
				status := "111";
				when "111" =>	--Write
				ram1addr <= addr;
				ram1data <= data;
				ram1EN <= chipEnable;
				ram1WE <= writeEnable;
				ram1RE <= readDisable;
				light <= data;
				status := "110";
				when "110" =>	--Address for reading
				addr := "00"&input;
				ram1WE <= writeDisable;
				status := "100";
				when "100" =>	--Read
				ram1addr <= addr;
				ram1data <= "ZZZZZZZZZZZZZZZZ";
				ram1EN <= chipEnable;
				ram1WE <= writeDisable;
				ram1RE <= readEnable;
				status := "101";
				when "101" =>	--Assign and display
				data := ram1data;
				status := "010";
				when "010" =>	--Disable read
				light <= data;
				ram1RE <= readDisable;
				status := "000";
				when others => NULL;
			end case;
		end if;
	end process;
	

end mem_acc;