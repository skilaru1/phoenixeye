-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"
-- CREATED		"Thu Jan 23 12:43:33 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY step IS 
	PORT
	(
		pin_name :  IN  STD_LOGIC;
		pin_name1 :  OUT  STD_LOGIC;
		pin_name2 :  OUT  STD_LOGIC;
		pin_name3 :  OUT  STD_LOGIC;
		pin_name4 :  OUT  STD_LOGIC;
		pin_name5 :  OUT  STD_LOGIC;
		pin_name6 :  OUT  STD_LOGIC;
		pin_name7 :  OUT  STD_LOGIC
	);
END step;

ARCHITECTURE bdf_type OF step IS 

COMPONENT stepper_control
	PORT(clk50M : IN STD_LOGIC;
		 stby : OUT STD_LOGIC;
		 ain1 : OUT STD_LOGIC;
		 ain2 : OUT STD_LOGIC;
		 bin1 : OUT STD_LOGIC;
		 bin2 : OUT STD_LOGIC;
		 pwma : OUT STD_LOGIC;
		 pwmb : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT p11
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



b2v_inst : stepper_control
PORT MAP(clk50M => SYNTHESIZED_WIRE_0,
		 stby => pin_name1,
		 ain1 => pin_name2,
		 ain2 => pin_name3,
		 bin1 => pin_name4,
		 bin2 => pin_name5,
		 pwma => pin_name6,
		 pwmb => pin_name7);


b2v_inst1 : p11
PORT MAP(inclk0 => pin_name,
		 c0 => SYNTHESIZED_WIRE_0);


END bdf_type;