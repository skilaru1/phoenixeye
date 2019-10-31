LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY stepper_control IS 
	PORT(
		clock, button 					: IN std_logic;
		pin1, pin2, pin3, pin4, led1	: OUT std_logic;
	);
END stepper_control;

ARCHITECHTURE a OF stepper_control IS
	TYPE STATE_TYPE IS (