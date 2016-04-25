-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 15.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2015 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from ASs_0002_rtl
-- VHDL created on Mon Apr 25 14:52:26 2016


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity ASs_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(36 downto 0);  -- sfix37
        clk : in std_logic;
        areset : in std_logic
    );
end ASs_0002_rtl;

architecture normal of ASs_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_disable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_disable_eq : std_logic;
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_i : UNSIGNED (4 downto 0);
    signal u0_m0_wo0_wi0_ra0_count0_sc : SIGNED (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_eq : std_logic;
    signal u0_m0_wo0_wi0_ra0_count1_lutreg_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_a : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_b : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_o : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_ra0_add_0_0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_wa0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_wa0_i : UNSIGNED (4 downto 0);
    signal u0_m0_wo0_wi0_delayr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr0_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_delayr0_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_delayr0_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_delayr0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_ca0_i : UNSIGNED (5 downto 0);
    signal u0_m0_wo0_ca0_eq : std_logic;
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    type u0_m0_wo0_mtree_mult1_0_cma_a_type is array(0 to 0) of SIGNED(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_a0 : u0_m0_wo0_mtree_mult1_0_cma_a_type;
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_mtree_mult1_0_cma_a0 : signal is true;
    type u0_m0_wo0_mtree_mult1_0_cma_c_type is array(0 to 0) of SIGNED(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_c0 : u0_m0_wo0_mtree_mult1_0_cma_c_type;
    attribute preserve of u0_m0_wo0_mtree_mult1_0_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_mult1_0_cma_p_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_p : u0_m0_wo0_mtree_mult1_0_cma_p_type;
    type u0_m0_wo0_mtree_mult1_0_cma_u_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_u : u0_m0_wo0_mtree_mult1_0_cma_u_type;
    type u0_m0_wo0_mtree_mult1_0_cma_w_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_w : u0_m0_wo0_mtree_mult1_0_cma_w_type;
    type u0_m0_wo0_mtree_mult1_0_cma_x_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_x : u0_m0_wo0_mtree_mult1_0_cma_x_type;
    type u0_m0_wo0_mtree_mult1_0_cma_y_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_y : u0_m0_wo0_mtree_mult1_0_cma_y_type;
    type u0_m0_wo0_mtree_mult1_0_cma_s_type is array(0 to 0) of SIGNED(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_s : u0_m0_wo0_mtree_mult1_0_cma_s_type;
    signal u0_m0_wo0_mtree_mult1_0_cma_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_cma_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_xIn_0_13_replace_mem_reset0 : std_logic;
    signal d_xIn_0_13_replace_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_replace_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_replace_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_replace_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_replace_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_replace_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_replace_rdcnt_i : UNSIGNED (0 downto 0);
    signal d_xIn_0_13_replace_rdreg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of d_xIn_0_13_sticky_ena_q : signal is true;
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_replace_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_replace_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_ra0_count1_lut_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_in : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_ra0_resize_b : STD_LOGIC_VECTOR (4 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_delRdAddr0_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_run(ENABLEGENERATOR,7)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(5 downto 0);
        variable u0_m0_wo0_run_disable_c : SIGNED(9 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_disable_c := TO_SIGNED(0, 10);
            u0_m0_wo0_run_disable_eq <= '0';
            u0_m0_wo0_run_disable_q <= "0";
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(17, 6);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_enable_q = "1" or u0_m0_wo0_run_disable_q = "1") THEN
                IF (u0_m0_wo0_run_disable_c = TO_SIGNED(-500, 10)) THEN
                    u0_m0_wo0_run_disable_eq <= '1';
                ELSE
                    u0_m0_wo0_run_disable_eq <= '0';
                END IF;
                IF (u0_m0_wo0_run_disable_eq = '1') THEN
                    u0_m0_wo0_run_disable_c := u0_m0_wo0_run_disable_c - (-501);
                ELSE
                    u0_m0_wo0_run_disable_c := u0_m0_wo0_run_disable_c + (-1);
                END IF;
                u0_m0_wo0_run_disable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_disable_c(9 downto 9));
            END IF;
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(5) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-18);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(5 downto 5));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "110";
                WHEN "100" => u0_m0_wo0_run_inc := "000";
                WHEN "101" => u0_m0_wo0_run_inc := "001";
                WHEN "110" => u0_m0_wo0_run_inc := "110";
                WHEN "111" => u0_m0_wo0_run_inc := "111";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(2 downto 2) and not (u0_m0_wo0_run_disable_q);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q and VCC_q;

    -- u0_m0_wo0_memread(DELAY,8)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,9)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_14(DELAY,35)@12
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,22)@14
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 18;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(6 downto 6));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_15(DELAY,36)@14
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca0(COUNTER,19)@12
    -- every=1, low=0, high=37, step=1, init=0
    u0_m0_wo0_ca0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca0_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_ca0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca0_i = TO_UNSIGNED(36, 6)) THEN
                    u0_m0_wo0_ca0_eq <= '1';
                ELSE
                    u0_m0_wo0_ca0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca0_eq = '1') THEN
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i - 37;
                ELSE
                    u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca0_i, 6)));

    -- u0_m0_wo0_cm0(LOOKUP,20)@12
    u0_m0_wo0_cm0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "0000000000000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca0_q) IS
                WHEN "000000" => u0_m0_wo0_cm0_q <= "0000000000000011";
                WHEN "000001" => u0_m0_wo0_cm0_q <= "1111111111001101";
                WHEN "000010" => u0_m0_wo0_cm0_q <= "1111110111001010";
                WHEN "000011" => u0_m0_wo0_cm0_q <= "1111100010011000";
                WHEN "000100" => u0_m0_wo0_cm0_q <= "1111010000100000";
                WHEN "000101" => u0_m0_wo0_cm0_q <= "1111110001101000";
                WHEN "000110" => u0_m0_wo0_cm0_q <= "0001110011011110";
                WHEN "000111" => u0_m0_wo0_cm0_q <= "0100111110001110";
                WHEN "001000" => u0_m0_wo0_cm0_q <= "0111100011000100";
                WHEN "001001" => u0_m0_wo0_cm0_q <= "0111101110101001";
                WHEN "001010" => u0_m0_wo0_cm0_q <= "0101010101111011";
                WHEN "001011" => u0_m0_wo0_cm0_q <= "0010000010100010";
                WHEN "001100" => u0_m0_wo0_cm0_q <= "1111101110110101";
                WHEN "001101" => u0_m0_wo0_cm0_q <= "1111000011100010";
                WHEN "001110" => u0_m0_wo0_cm0_q <= "1111010111010001";
                WHEN "001111" => u0_m0_wo0_cm0_q <= "1111110010011100";
                WHEN "010000" => u0_m0_wo0_cm0_q <= "1111111110100000";
                WHEN "010001" => u0_m0_wo0_cm0_q <= "0000000000001101";
                WHEN "010010" => u0_m0_wo0_cm0_q <= "0000000000000000";
                WHEN "010011" => u0_m0_wo0_cm0_q <= "0000000000000000";
                WHEN "010100" => u0_m0_wo0_cm0_q <= "0000000000000000";
                WHEN "010101" => u0_m0_wo0_cm0_q <= "1111111100101000";
                WHEN "010110" => u0_m0_wo0_cm0_q <= "1111101110001010";
                WHEN "010111" => u0_m0_wo0_cm0_q <= "1111010110101101";
                WHEN "011000" => u0_m0_wo0_cm0_q <= "1111010110111111";
                WHEN "011001" => u0_m0_wo0_cm0_q <= "0000100101101001";
                WHEN "011010" => u0_m0_wo0_cm0_q <= "0011010101001001";
                WHEN "011011" => u0_m0_wo0_cm0_q <= "0110011101111101";
                WHEN "011100" => u0_m0_wo0_cm0_q <= "0111111111111110";
                WHEN "011101" => u0_m0_wo0_cm0_q <= "0110110010001001";
                WHEN "011110" => u0_m0_wo0_cm0_q <= "0011101010110011";
                WHEN "011111" => u0_m0_wo0_cm0_q <= "0000101011101101";
                WHEN "100000" => u0_m0_wo0_cm0_q <= "1111001101011111";
                WHEN "100001" => u0_m0_wo0_cm0_q <= "1111001001100000";
                WHEN "100010" => u0_m0_wo0_cm0_q <= "1111100110001111";
                WHEN "100011" => u0_m0_wo0_cm0_q <= "1111111010011001";
                WHEN "100100" => u0_m0_wo0_cm0_q <= "0000000000000000";
                WHEN "100101" => u0_m0_wo0_cm0_q <= "0000000000000100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_ra0_count1(COUNTER,11)@12
    -- every=1, low=0, high=37, step=1, init=1
    u0_m0_wo0_wi0_ra0_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count1_i <= TO_UNSIGNED(1, 6);
            u0_m0_wo0_wi0_ra0_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra0_count1_i = TO_UNSIGNED(36, 6)) THEN
                    u0_m0_wo0_wi0_ra0_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_ra0_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_ra0_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_ra0_count1_i <= u0_m0_wo0_wi0_ra0_count1_i - 37;
                ELSE
                    u0_m0_wo0_wi0_ra0_count1_i <= u0_m0_wo0_wi0_ra0_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count1_i, 6)));

    -- u0_m0_wo0_wi0_ra0_count1_lut(LOOKUP,12)@12
    u0_m0_wo0_wi0_ra0_count1_lut: PROCESS (u0_m0_wo0_wi0_ra0_count1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_ra0_count1_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010100";
            WHEN "000001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010101";
            WHEN "000010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010110";
            WHEN "000011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010111";
            WHEN "000100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011000";
            WHEN "000101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011001";
            WHEN "000110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011010";
            WHEN "000111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011011";
            WHEN "001000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011100";
            WHEN "001001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011101";
            WHEN "001010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011110";
            WHEN "001011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011111";
            WHEN "001100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000000";
            WHEN "001101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000001";
            WHEN "001110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000010";
            WHEN "001111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000011";
            WHEN "010000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000100";
            WHEN "010001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000101";
            WHEN "010010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000110";
            WHEN "010011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010100";
            WHEN "010100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010101";
            WHEN "010101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010110";
            WHEN "010110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "010111";
            WHEN "010111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011000";
            WHEN "011000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011001";
            WHEN "011001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011010";
            WHEN "011010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011011";
            WHEN "011011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011100";
            WHEN "011100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011101";
            WHEN "011101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011110";
            WHEN "011110" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "011111";
            WHEN "011111" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000000";
            WHEN "100000" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000001";
            WHEN "100001" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000010";
            WHEN "100010" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000011";
            WHEN "100011" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000100";
            WHEN "100100" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000101";
            WHEN "100101" => u0_m0_wo0_wi0_ra0_count1_lut_q <= "000110";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_ra0_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_ra0_count1_lutreg(REG,13)@12
    u0_m0_wo0_wi0_ra0_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count1_lutreg_q <= "010100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_ra0_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_ra0_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_ra0_count0(COUNTER,10)@12
    -- every=38, low=0, high=31, step=1, init=0
    u0_m0_wo0_wi0_ra0_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_count0_i <= TO_UNSIGNED(0, 5);
            u0_m0_wo0_wi0_ra0_count0_sc <= TO_SIGNED(36, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc - (-37);
                ELSE
                    u0_m0_wo0_wi0_ra0_count0_sc <= u0_m0_wo0_wi0_ra0_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_ra0_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_ra0_count0_i <= u0_m0_wo0_wi0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_ra0_count0_i, 6)));

    -- u0_m0_wo0_wi0_ra0_add_0_0(ADD,14)@12
    u0_m0_wo0_wi0_ra0_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count0_q);
    u0_m0_wo0_wi0_ra0_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_ra0_count1_lutreg_q);
    u0_m0_wo0_wi0_ra0_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_ra0_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_ra0_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_ra0_add_0_0_q <= u0_m0_wo0_wi0_ra0_add_0_0_o(6 downto 0);

    -- u0_m0_wo0_wi0_ra0_resize(BITSELECT,15)@13
    u0_m0_wo0_wi0_ra0_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_ra0_add_0_0_q(4 downto 0));
    u0_m0_wo0_wi0_ra0_resize_b <= u0_m0_wo0_wi0_ra0_resize_in(4 downto 0);

    -- u0_m0_wo0_wi0_delRdAddr0(DELAY,18)@13
    u0_m0_wo0_wi0_delRdAddr0_q <= u0_m0_wo0_wi0_ra0_resize_b;

    -- d_xIn_0_13_notEnable(LOGICAL,43)@10
    d_xIn_0_13_notEnable_a <= VCC_q;
    d_xIn_0_13_notEnable_q <= not (d_xIn_0_13_notEnable_a);

    -- d_xIn_0_13_nor(LOGICAL,44)@10
    d_xIn_0_13_nor_a <= d_xIn_0_13_notEnable_q;
    d_xIn_0_13_nor_b <= d_xIn_0_13_sticky_ena_q;
    d_xIn_0_13_nor_q <= not (d_xIn_0_13_nor_a or d_xIn_0_13_nor_b);

    -- d_xIn_0_13_cmpReg(REG,42)@10
    d_xIn_0_13_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_sticky_ena(REG,45)@10
    d_xIn_0_13_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_13_nor_q = "1") THEN
                d_xIn_0_13_sticky_ena_q <= STD_LOGIC_VECTOR(d_xIn_0_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13_enaAnd(LOGICAL,46)@10
    d_xIn_0_13_enaAnd_a <= d_xIn_0_13_sticky_ena_q;
    d_xIn_0_13_enaAnd_b <= VCC_q;
    d_xIn_0_13_enaAnd_q <= d_xIn_0_13_enaAnd_a and d_xIn_0_13_enaAnd_b;

    -- d_xIn_0_13_replace_rdcnt(COUNTER,38)@10
    -- every=1, low=0, high=1, step=1, init=1
    d_xIn_0_13_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_replace_rdcnt_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_replace_rdcnt_i <= d_xIn_0_13_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_xIn_0_13_replace_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_xIn_0_13_replace_rdcnt_i, 1)));

    -- d_xIn_0_13_replace_rdmux(MUX,40)@10
    d_xIn_0_13_replace_rdmux_s <= VCC_q;
    d_xIn_0_13_replace_rdmux: PROCESS (d_xIn_0_13_replace_rdmux_s, d_xIn_0_13_replace_rdreg_q, d_xIn_0_13_replace_rdcnt_q)
    BEGIN
        CASE (d_xIn_0_13_replace_rdmux_s) IS
            WHEN "0" => d_xIn_0_13_replace_rdmux_q <= d_xIn_0_13_replace_rdreg_q;
            WHEN "1" => d_xIn_0_13_replace_rdmux_q <= d_xIn_0_13_replace_rdcnt_q;
            WHEN OTHERS => d_xIn_0_13_replace_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- d_xIn_0_13_replace_rdreg(REG,39)@10
    d_xIn_0_13_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_replace_rdreg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_replace_rdreg_q <= STD_LOGIC_VECTOR(d_xIn_0_13_replace_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_replace_mem(DUALMEM,37)@10
    d_xIn_0_13_replace_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    d_xIn_0_13_replace_mem_aa <= d_xIn_0_13_replace_rdreg_q;
    d_xIn_0_13_replace_mem_ab <= d_xIn_0_13_replace_rdmux_q;
    d_xIn_0_13_replace_mem_reset0 <= areset;
    d_xIn_0_13_replace_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => d_xIn_0_13_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => d_xIn_0_13_replace_mem_reset0,
        clock1 => clk,
        address_a => d_xIn_0_13_replace_mem_aa,
        data_a => d_xIn_0_13_replace_mem_ia,
        wren_a => VCC_q(0),
        address_b => d_xIn_0_13_replace_mem_ab,
        q_b => d_xIn_0_13_replace_mem_iq
    );
    d_xIn_0_13_replace_mem_q <= d_xIn_0_13_replace_mem_iq(15 downto 0);

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,34)@10
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_wa0(COUNTER,16)@13
    -- every=1, low=0, high=31, step=1, init=6
    u0_m0_wo0_wi0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_wa0_i <= TO_UNSIGNED(6, 5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_wa0_i <= u0_m0_wo0_wi0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_wa0_i, 5)));

    -- u0_m0_wo0_wi0_delayr0(DUALMEM,17)@13
    u0_m0_wo0_wi0_delayr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_replace_mem_q);
    u0_m0_wo0_wi0_delayr0_aa <= u0_m0_wo0_wi0_wa0_q;
    u0_m0_wo0_wi0_delayr0_ab <= u0_m0_wo0_wi0_delRdAddr0_q;
    u0_m0_wo0_wi0_delayr0_reset0 <= areset;
    u0_m0_wo0_wi0_delayr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 16,
        widthad_b => 5,
        numwords_b => 32,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_delayr0_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_delayr0_aa,
        data_a => u0_m0_wo0_wi0_delayr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_delayr0_ab,
        q_b => u0_m0_wo0_wi0_delayr0_iq
    );
    u0_m0_wo0_wi0_delayr0_q <= u0_m0_wo0_wi0_delayr0_iq(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_cma(CHAINMULTADD,32)@13
    u0_m0_wo0_mtree_mult1_0_cma_p(0) <= u0_m0_wo0_mtree_mult1_0_cma_a0(0) * u0_m0_wo0_mtree_mult1_0_cma_c0(0);
    u0_m0_wo0_mtree_mult1_0_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_mult1_0_cma_p(0),32);
    u0_m0_wo0_mtree_mult1_0_cma_w(0) <= u0_m0_wo0_mtree_mult1_0_cma_u(0);
    u0_m0_wo0_mtree_mult1_0_cma_x(0) <= u0_m0_wo0_mtree_mult1_0_cma_w(0);
    u0_m0_wo0_mtree_mult1_0_cma_y(0) <= u0_m0_wo0_mtree_mult1_0_cma_x(0);
    u0_m0_wo0_mtree_mult1_0_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_cma_c0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_mult1_0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_cma_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_delayr0_q),16);
            u0_m0_wo0_mtree_mult1_0_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm0_q),16);
            u0_m0_wo0_mtree_mult1_0_cma_s(0) <= u0_m0_wo0_mtree_mult1_0_cma_y(0);
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_cma_delay : dspba_delay
    GENERIC MAP (
        width => 32,
        depth => 0
    )
    PORT MAP (
        xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_cma_s(0)(31 downto 0)),
        xout => u0_m0_wo0_mtree_mult1_0_cma_qq,
        clk => clk,
        aclr => areset
    );
    u0_m0_wo0_mtree_mult1_0_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_cma_qq(31 downto 0));

    -- u0_m0_wo0_accum(ADD,23)@15
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 32 => u0_m0_wo0_mtree_mult1_0_cma_q(31)) & u0_m0_wo0_mtree_mult1_0_cma_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(36 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,24)@14
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0010010";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 18;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(6 downto 6));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,25)@15
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_15_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,26)@15
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,28)@16
    out0_m0_wo0_lineup_select_delay_0_q <= u0_m0_wo0_oseq_gated_reg_q;

    -- xOut(PORTOUT,31)@16
    xOut_v <= out0_m0_wo0_lineup_select_delay_0_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
