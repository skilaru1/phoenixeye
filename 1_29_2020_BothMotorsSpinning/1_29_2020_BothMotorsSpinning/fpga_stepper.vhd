library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity stepper_test is
	Port( clk50M	: in	STD_LOGIC;
	
		sw_dir		: in	STD_LOGIC;
		sw_enable	: in 	STD_LOGIC;
		sw_speed	: in 	STD_LOGIC;
		
		position	: out	STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		phase_a		: out	STD_LOGIC;
		phase_b		: out	STD_LOGIC;
		phase_c		: out	STD_LOGIC;
		phase_d		: out	STD_LOGIC );
		
end stepper_test;

architecture behavior of stepper_test is
	SIGNAL coils		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
	SIGNAL count		: unsigned( 18 DOWNTO 0) := (others =>'0');
	SIGNAL step_count	: unsigned(7 DOWNTO 0) := (others => '0');
begin
	phase_a <= coils(0);
	phase_b <= coils(1);
	phase_c <= coils(2);
	phase_d <= coils(3);
	position <= std_logic_vector(step_count);
	
	process(clk50M)
	begin
		if rising_edge(clk50M) then
			if count = 0 then
				if sw_enable = '1' then
					if sw_dir = '1' then
						coils <= coils(0) & coils(coils'high downto 1);
						step_count <= step_count + 1;
					else
						coils <= coils(coils'high-1 downto 0) & coils(coils'high);
						step_count <= step_count - 1;
					end if;
				end if;
			end if;
			
			if sw_speed = '1' and count = 100000-1 then
				
				count <= (others=>'0');
			elsif count = 4000000-1 then
			
				count <= (others=>'0');
			else
				count <= count + 1;
			end if;
		end if;
	end process;
end behavior;
		