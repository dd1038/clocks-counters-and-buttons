----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 08:15:06 PM
-- Design Name: 
-- Module Name: top_div - Behavioral
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

entity top_div is
Port (clk: in std_logic;
div: inout std_logic
);
end top_div;

architecture Behavioral of top_div is
component Lab_1
Port (clk: in std_logic;
en: out std_logic
);
end component;


signal div_out: std_logic;
begin
divider_top: Lab_1
port map(
clk=> clk,
en=> div_out
);
process(clk,div_out)
begin
if (rising_edge(clk)) then
if (div_out = '1') then
div <= not(div);
end if;
end if;
end process;


end Behavioral;
