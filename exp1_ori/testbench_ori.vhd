--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:21:56 11/09/2016
-- Design Name:   
-- Module Name:   D:/MyProgram/CPU/exp1_ori/testbench_ori.vhd
-- Project Name:  exp1_ori
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: openmips
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench_ori IS
END testbench_ori;
 
ARCHITECTURE behavior OF testbench_ori IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT openmips
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         rom_data_i : IN  std_logic_vector(31 downto 0);
         rom_addr_o : OUT  std_logic_vector(31 downto 0);
         rom_ce_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal rom_data_i : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rom_addr_o : std_logic_vector(31 downto 0);
   signal rom_ce_o : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: openmips PORT MAP (
          rst => rst,
          clk => clk,
          rom_data_i => rom_data_i,
          rom_addr_o => rom_addr_o,
          rom_ce_o => rom_ce_o
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		clk<='1';
		rst<='0';
		rom_data_i<='0';
		wait for 200 ns;
		clk<='1';
		rst<='1';
		rom_data_i<='0';
      wait;
   end process;

END;
