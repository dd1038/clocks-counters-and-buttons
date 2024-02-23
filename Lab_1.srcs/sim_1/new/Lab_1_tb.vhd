--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity Lab_1_tb is
end Lab_1_tb;

architecture testbench of Lab_1_tb is

    signal tb_clk : std_logic := '0';
    signal tb_button: std_logic;
    signal tb_dbnc: std_logic;
    signal tb_en : std_logic;
 
    component debouncer is
    port(button,clk: in std_logic;
         dbnc: out std_logic
        );
        end component;
    component Lab_1 is
        port(
        
            clk  : in std_logic;       -- 125 Mhz clock
            en : out std_logic
        );
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
    
    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : Lab_1
    port map (
    
        clk  => tb_clk,
        en => tb_en
    
    );
debounce: debouncer
port map(
clk => tb_clk,
button => tb_button,
dbnc => tb_dbnc
);

    
end testbench; 