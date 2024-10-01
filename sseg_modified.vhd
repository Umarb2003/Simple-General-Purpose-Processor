LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_modified IS
PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Cout: IN  STD_LOGIC;
leds : OUT STD_LOGIC_VECTOR(0 TO 6);
negleds: OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg_modified;

ARCHITECTURE Behavior OF sseg_modified IS
BEGIN

PROCESS (bcd)
BEGIN
	CASE bcd IS
		--"abcdefg"
		WHEN "1111" => leds <=  "0111011"; --input Y
		WHEN "0111" => leds <=  "0010101"; --input N
		WHEN OTHERS => leds <= "-------";
	END CASE;
END PROCESS;
PROCESS(Cout)
	BEGIN 
		CASE Cout IS
			WHEN	'0' => negleds <= "0000000";
			WHEN  '1' => negleds <= "0000001";
		END CASE;
	END PROCESS;
END Behavior;