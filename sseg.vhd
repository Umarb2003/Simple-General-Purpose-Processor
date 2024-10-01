LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
sign : IN STD_LOGIC;
leds : OUT STD_LOGIC_VECTOR(0 TO 6);
ledsn : OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN

PROCESS (bcd)
BEGIN
	CASE bcd IS
		--"abcdefg"
		WHEN "0000" => leds <= NOT "1111110"; --0
		WHEN "0001" => leds <= NOT "0110000"; --1
		WHEN "0010" => leds <= NOT "1101101"; --2
		WHEN "0011" => leds <= NOT "1111001"; --3
		WHEN "0100" => leds <= NOT "0110011"; --4
		WHEN "0101" => leds <= NOT "1011011"; --5
		WHEN "0110" => leds <= NOT "1011111"; --6
		WHEN "0111" => leds <= NOT "1110000"; --7
		WHEN "1000" => leds <= NOT "1111111"; --8
		WHEN "1001" => leds <= NOT "1111011"; --9
		WHEN OTHERS => leds <= "-------";
	END CASE;
END PROCESS;

PROCESS(sign)
BEGIN
	if (sign = '0') then
		ledsn <= NOT "0000000";
	else
		ledsn <= NOT "0000001";
	end if;
END PROCESS;

END Behavior;