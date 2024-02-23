----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2024 04:20:58 PM
-- Design Name: 
-- Module Name: fancy_counter_tb - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fancy_counter_tb is
end fancy_counter_tb;
 
architecture fancy_counter_tb_arch of fancy_counter_tb is

    signal tb_clk : std_logic := '0';
    signal tb_clk_en : std_logic := '0';
    signal tb_dir  : std_logic := '1';
    signal tb_en : std_logic := '1';
    signal tb_ld : std_logic := '1';
    signal tb_rst : std_logic := '0';
    signal tb_updn : std_logic := '1';
   
    signal tb_val : std_logic_vector(3 downto 0):="0101";
    signal tb_cnt : std_logic_vector(3 downto 0);

    component fancy_counter is
        Port ( clk,clk_en, dir, en, ld, rst, updn : in std_logic;
         val : in std_logic_vector(3 downto 0);
         cnt : out std_logic_vector(3 downto 0));
    end component;
begin

    --------------------------------------------------------------------------------
    -- procs
    --------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin

        wait for 4 ns;
        tb_clk <= '1';

        wait for 4 ns;
        tb_clk <= '0';

    end process clk_gen_proc;

    clk_pulse: process --pulse clk_en every 20ms
        begin
            tb_clk_en <= '1';
            wait for 8ns;
            tb_clk_en <= '0';
            wait for 4ms;
    end process clk_pulse;
   
    changing_val : process
        begin
            wait for 64ms;
            tb_val <= "0001";
            wait for 64ms;
            tb_val <= "0010";
            wait for 64ms;
            tb_val <= "0011";
            wait for 64ms;
            tb_val <= "0100";
            wait for 64ms;
            tb_val <= "0101";
            wait for 64ms;
            tb_val <= "0110";
            wait for 64ms;
            tb_val <= "0111";
            wait for 64ms;
            tb_val <= "1000";
            wait for 64ms;
            tb_val <= "1001";
            wait for 64ms;
            tb_val <= "1010";
            wait for 64ms;
            tb_val <= "1011";
            wait for 64ms;
            tb_val <= "1100";
            wait for 64ms;
            tb_val <= "1101";
            wait for 64ms;
            tb_val <= "1110";
            wait for 64ms;
            tb_val <= "1111";
            wait for 64ms;
           
    end process changing_val;
   
    load_val : process
    begin
        tb_ld <= '0';
        wait for 96ms;
        tb_ld <= '1';
        wait for 8ms;
    end process load_val;
   
    reset : process
    begin
        wait for 144ms;
        tb_rst <= '1';
        wait for 8ns;
        tb_rst <= '0';
    end process reset;
   
    flip_dir : process
    begin
        tb_dir <= '1';
        wait for 216ms;
        tb_dir <= '0';
        wait for 216ms;
   end process flip_dir;
    --------------------------------------------------------------------------------
    -- port mapping
    --------------------------------------------------------------------------------

    dut : fancy_counter
        port map(

            clk  => tb_clk,
            en => tb_en,
            clk_en=>tb_clk_en,
            dir=>tb_dir,
            ld=>tb_ld,
            rst=>tb_rst,
            updn=>tb_updn,
            val=> tb_val,
            cnt=>tb_cnt
        );



end fancy_counter_tb_arch ;