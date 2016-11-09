--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:32:02 11/07/2016
-- Design Name:   
-- Module Name:   F:/Programs/CPU/CPU/Mem_Serial/test.vhd
-- Project Name:  Mem_Serial
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         input : IN  std_logic_vector(15 downto 0);
         light : OUT  std_logic_vector(15 downto 0);
         out1 : OUT  std_logic;
         out2 : OUT  std_logic;
         out3 : OUT  std_logic;
         ram1addr : OUT  std_logic_vector(17 downto 0);
         ram1data : INOUT  std_logic_vector(15 downto 0);
         ram1EN : OUT  std_logic;
         ram1WE : OUT  std_logic;
         ram1RE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal input : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal ram1data : std_logic_vector(15 downto 0);

 	--Outputs
   signal light : std_logic_vector(15 downto 0);
   signal out1 : std_logic;
   signal out2 : std_logic;
   signal out3 : std_logic;
   signal ram1addr : std_logic_vector(17 downto 0);
   signal ram1EN : std_logic;
   signal ram1WE : std_logic;
   signal ram1RE : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ms;
 
BEGIN
	rst <= '1';
	rst <= '0' after 200ns;
	-- Instantiate the Unit Under Test (UUT)
   uut: mem PORT MAP (
          rst => rst,
          clk => clk,
          input => input,
          light => light,
          out1 => out1,
          out2 => out2,
          out3 => out3,
          ram1addr => ram1addr,
          ram1data => ram1data,
          ram1EN => ram1EN,
          ram1WE => ram1WE,
          ram1RE => ram1RE
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

      wait;
   end process;

END;
