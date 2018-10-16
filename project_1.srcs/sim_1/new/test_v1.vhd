----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/15 14:57:28
-- Design Name: 
-- Module Name: Test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test is
--  Port ( );
end Test;

architecture Behavioral of Test is
component ALU
	port(
		clk,rst:in std_logic;
		input_data:in std_logic_vector(15 downto 0);
		output_data:out std_logic_vector(15 downto 0);
		operation_data:in std_logic_vector(3 downto 0)
	);
end component;

signal my_clk:std_logic :='0';
signal my_rst:std_logic :='0';
signal my_input_data:std_logic_vector(15 downto 0);
signal my_operation_data:std_logic_vector(3 downto 0);
signal my_output_data:std_logic_vector(15 downto 0);
constant clk_period:time := 20ns;
constant input_data_A: std_logic_vector(15 downto 0):= "0000000000000011";
constant input_data_B: std_logic_vector(15 downto 0):= "0000000000000001";

begin
	my_entity: ALU
		port map(
			clk=>my_clk,
			rst=>my_rst,
			input_data=>my_input_data,
			operation_data=>my_operation_data,
			output_data=>my_output_data
		);

	clk_gen: process
	begin
		wait for clk_period/2;
		my_clk <= not my_clk;
	end process clk_gen;
	
	input_gen: process
	begin
		my_input_data<=input_data_A;
		wait for clk_period;
		my_input_data<=input_data_B;
		wait for clk_period*3;
	end process input_gen;
	
	operation_data_gen: process
	begin
		my_operation_data<="0000";
		wait for clk_period*4;
		my_operation_data<="0001";
		wait for clk_period*4;
		my_operation_data<="0010";
		wait for clk_period*4;
		my_operation_data<="0011";
		wait for clk_period*4;
		my_operation_data<="0100";
		wait for clk_period*4;
		my_operation_data<="0101";
		wait for clk_period*4;
		my_operation_data<="0110";
		wait for clk_period*4;
		my_operation_data<="0111";
		wait for clk_period*4;
		my_operation_data<="1000";
		wait for clk_period*4;
		my_operation_data<="1001";
		wait for clk_period*4;
	end process operation_data_gen;

end Behavioral;
