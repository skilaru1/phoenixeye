library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity stepper_control is
	Port(
		clk50M:	in	STD_LOGIC;
		button: in 	STD_LOGIC;
		
		-- Allows the H-bridges to work when high (has a pulldown resistor so it must actively pulled high)
		stby:	out	STD_LOGIC;
		-- determine direction
		ain1:	out	STD_LOGIC;
		ain2:	out	STD_LOGIC;
		bin1:	out	STD_LOGIC;
		bin2:	out	STD_LOGIC;
		
		--pwm input that controls speed
		pwma:	out	STD_LOGIC;
		pwmb:	out	STD_LOGIC
	);
		
end stepper_control;

architecture behavior of stepper_control is
--	signal count: unsigned(20 DOWNTO 0) := (others =>'0');
	signal motors: std_logic_vector(3 downto 0) := "0000";
begin
	stby <= '1';
	pwma <= '1';
	pwmb <= '1';
	
	ain1 <= motors(3);
	ain2 <= motors(2);
	bin1 <= motors(1);
	bin2 <= motors(0);
	process(button)
	begin
--		if rising_edge(clk50M) then
--			count <= count + 1;
			if button = '0' then
				if motors = "0001" then
					motors <= "1000";
				elsif motors = "0010" then
					motors <= "0001";
				elsif motors = "0100" then
					motors <= "0010";
				elsif motors = "1000" then
					motors <= "0100";
				else
					motors <= "0000";
				end if;
			end if;
				
--			if (count >= 800000) then
--				count <= (others=>'0');
--			elsif (count >= 600000) then
--				motors <= "1000";
--			elsif (count >= 400000) then
--				motors <= "0100";
--			elsif (count >= 200000) then
--				motors <= "0010";
--			else
--				motors <= "0001";
--			end if;
--		end if;
	end process;
end behavior;
		