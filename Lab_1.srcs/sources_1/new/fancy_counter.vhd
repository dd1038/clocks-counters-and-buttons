----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 03:17:41 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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

entity fancy_counter is
    Port (clk, rst, en, clk_en, dir, updn, ld:in std_logic;
         val: in std_logic_vector(3 downto 0);
         cnt: out std_logic_vector(3 downto 0)
        );
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal value: std_logic_vector(3 downto 0);
    signal counter: std_logic_vector(3 downto 0):= (others => '0');
    signal direction: std_logic;
begin
    process(clk)
    begin
        cnt <= counter;
        if rising_edge(clk) then
            if rst = '1' then
                counter <= (others => '0');
            end if;
            if en = '1' then
                if clk_en = '1' then
                    if ld = '1' then
                        value <= val;
                    end if;
                    if updn = '1' then
                        direction <= dir;
                    end if;
                    if direction = '1' then
                        if counter < value then
                            counter <= std_logic_vector(unsigned(counter) + 1);
                        else
                            counter <= (others => '0');
                        end if;
                    end if;
                    if direction = '0' then
                        if counter > value then
                            counter <= value;
                        elsif counter = "0000" then
                            counter <= value;
                        else
                            counter <= std_logic_vector(unsigned(counter) - 1);
                        end if;
                    end if;
                end if;
            end if;
        end if;

    end process;




end Behavioral;
