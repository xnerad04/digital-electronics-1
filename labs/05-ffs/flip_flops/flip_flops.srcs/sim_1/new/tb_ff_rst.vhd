----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 03:51:33 PM
-- Design Name: 
-- Module Name: tb_ff_rst - Behavioral
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

entity tb_ff_rst is
--  Port ( );
end tb_ff_rst;

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_ff_rst is
    -- Entity of testbench is always empty
end entity tb_ff_rst;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_data       : std_logic;
    signal s_d_q        : std_logic;
    signal s_d_q_bar    : std_logic;
    signal s_t_q        : std_logic;
    signal s_t_q_bar    : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            d     => s_data,
            q     => s_d_q,
            q_bar => s_d_q_bar
        );

    -- Connecting testbench signals with t_ff_rst entity
    -- (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            t     => s_data,
            q     => s_t_q,
            q_bar => s_t_q_bar
        );
        
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 200 ns loop -- 20 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '0';

        -- ACTIVATE AND DEACTIVATE RESET HERE
        wait for 53 ns;
        s_rst <= '1';
        wait for 36 ns;
        s_rst <= '0';

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_data <='0'; wait for 13 ns;
        s_data <='1'; wait for  9 ns;
        s_data <='0'; wait for 16 ns;
        s_data <='1'; wait for  7 ns;
        s_data <='0'; wait for 21 ns;
        s_data <='1'; wait for 13 ns;
        s_data <='0'; wait for 14 ns;
        s_data <='1'; wait for 19 ns;
        s_data <='0'; wait for 11 ns;
        s_data <='1'; wait for 15 ns;
        s_data <='0'; wait for  9 ns;
        s_data <='1'; wait for 21 ns;               
        s_data <='0'; wait for 17 ns;
        s_data <='1'; wait for 15 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
