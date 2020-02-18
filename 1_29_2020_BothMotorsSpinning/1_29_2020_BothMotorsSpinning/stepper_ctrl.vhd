library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity stepper_ctrl is
	Generic(
		angle_width : INTEGER := 8
    );
	Port(
		clk50M:	in	STD_LOGIC;
		button: in 	STD_LOGIC;
		angle:	in	SIGNED(angle_width-1 downto 0);
		
		-- Allows the H-bridges to work when high (has a pulldown resistor so it must actively pulled high)
		stby:	out	STD_LOGIC;
		-- determine direction
		ain1:	out	STD_LOGIC;
		ain2:	out	STD_LOGIC;
		bin1:	out	STD_LOGIC;
		bin2:	out	STD_LOGIC;
		
		--pwm input that controls speed
		pwma:	out	STD_LOGIC;
		pwmb:	out	STD_LOGIC;
		
		--2nd stepper motor----------------------------------
		stby2:	out	STD_LOGIC;
		-- determine direction
		ain2_1:	out	STD_LOGIC;
		ain2_2:	out	STD_LOGIC;
		bin2_1:	out	STD_LOGIC;
		bin2_2:	out	STD_LOGIC;
		
		--pwm input that controls speed
		pwma2:	out	STD_LOGIC;
		pwmb2:	out	STD_LOGIC
		

		
	);
		
end stepper_ctrl;

architecture behavior of stepper_ctrl is
	signal count: unsigned(31 DOWNTO 0) := (others =>'0');
	signal motors: std_logic_vector(3 downto 0) := "0000";
	signal motor2: std_logic_vector(3 downto 0) :="0000";
	signal switched: std_logic := '0';
	
	
	signal quotient:	signed(angle_width-1 downto 0) := angle;
	signal clicks:		signed(angle_width-1 downto 0) := (others => '0');
	signal current_angle: signed(angle_width-1 downto 0) := (others => '0');
	signal steps_to_move: signed(angle_width-1 downto 0) := (others => '0');
	signal divide_done:	std_logic := '0';
begin
	stby <= '1';
	pwma <= '1';
	pwmb <= '1';
	
	ain1 <= motors(3);
	ain2 <= motors(2);
	bin1 <= motors(1);
	bin2 <= motors(0);
	
	--2nd stepper-----------------------------------
	stby2 <= '1';
	pwma2 <= '1';
	pwmb2 <= '1';
	
	ain2_1 <= motor2(3);
	ain2_2 <= motor2(2);
	bin2_1 <= motor2(1);
	bin2_2 <= motor2(0);
	
	process(clk50M)
	begin
		if rising_edge(clk50M) then
			if (quotient > 360) then
				quotient <= quotient - 360;
			elsif (quotient > 18) then
				quotient <= quotient - 18;
				clicks <= clicks + 1;
			else
				steps_to_move <= (clicks - current_angle);
				if (steps_to_move < 0) then
					steps_to_move <= steps_to_move + 20;
				else
					--divide_done <= '1';
					--if (divide_done = '1') and (clicks > count) and (switched = '0') then
						if (clicks > count) and (switched = '0') then
						--if button = '1' and switched = '0' then
							if motors = "0000" then
								motors <= "0110";
								motor2 <= "0110";
							elsif motors = "0110" then
								motors <= "1001";
								motor2 <= "1001";
							elsif motors = "1001" then
								motors <= "0110";
								motor2 <= "0110";
							end if;
							switched <= '1';
							count <= count + 1;
							current_angle <= current_angle + 1;
						elsif (clicks = count) then
							count <= (others => '0');
						end if;
						if switched = '1' then
							switched <= '0';
						end if;
				end if;
			end if;
			
			
			
			
			

				--Motor 2 else statements------
				--elsif motor2 = "0001" then
					--motor2 <= "0000";
				--elsif motor2 = "0010" then
					--motor2 <= "0001";
				--elsif motor2 ="0100" then
					--motor2 <= "0010";
				--elsif motor2 = "1000" then
					--motor2 <= "0100";
				--elsif motor2 = "0000" then
					--motor2 <= "1000";
				--end if;
			--end if;
			
--			if (count >= 4000000) then
--				count <= (others=>'0');
--			elsif (count >= 3000000) then
--				motors <= "0001";
--				motor2 <= "0001";
--			elsif (count >= 2000000) then
--				motors <= "0010";
--				motor2 <= "0010";
--			elsif (count >= 1000000) then
--				motors <= "0010";
--				motor2 <= "0010";
--			elsif (count >= 0) then
--				motors <= "0000";
--				motor2 <= "0000";
--			end if;
--		end if;
		end if;
	end process;
end behavior;
		