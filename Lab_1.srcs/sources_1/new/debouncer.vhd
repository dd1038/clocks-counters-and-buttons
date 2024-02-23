----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2024 08:51:28 PM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
    Port (button,clk: in std_logic;
         dbnc: out std_logic
        );
end debouncer;

architecture Behavioral of debouncer is
    signal counter : std_logic_vector(21 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if( button = '1') then
                if (unsigned(counter) < 2499999) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    dbnc <= '0';
                else
                    counter <= (others => '0');
                    dbnc<= '1';
                end if;
            end if;
            if(button = '0') then
                dbnc <= '0';
            end if;

        end if;
    end process;
end Behavioral;
