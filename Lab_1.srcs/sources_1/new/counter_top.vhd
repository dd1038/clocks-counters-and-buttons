----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 03:18:29 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
    Port (clk: in std_logic;
         sw,btn: in std_logic_vector(3 downto 0);
         led: out std_logic_vector(3 downto 0)
        );
end counter_top;

architecture Behavioral of counter_top is
    component debouncer
        Port (button,clk: in std_logic;
             dbnc: out std_logic
            );
    end component debouncer;

    component Lab_1
        Port (clk: in std_logic;
             en: out std_logic
            );
    end component Lab_1;

    component fancy_counter
        Port (clk, rst, en, clk_en, dir, updn, ld:in std_logic;
             val: in std_logic_vector(3 downto 0);
             cnt: out std_logic_vector(3 downto 0)
            );
    end component fancy_counter;

    signal clk_en, div: std_logic;
    signal dbnc0, dbnc1, dbnc2, dbnc3: std_logic;
begin
p1: debouncer
port map(
clk => clk,
button =>btn(0),
dbnc => dbnc0
);

p2: debouncer
port map(
clk => clk,
button =>btn(1),
dbnc => dbnc1
);

p3: debouncer
port map(
clk => clk,
button =>btn(2),
dbnc => dbnc2
);

p4: debouncer
port map(
clk => clk,
button =>btn(3),
dbnc => dbnc3
);

p5: Lab_1
port map(
clk => clk,
en => div
);

p6: fancy_counter
port map(
clk => clk,
rst => dbnc0,
en => dbnc1,
clk_en => div,
dir => sw(0),
updn => dbnc2,
ld => dbnc3,
val => sw,
cnt => led
);

end Behavioral;
