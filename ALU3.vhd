library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU3 is
port( Clock : in std_logic; --input clock signal
A,B: in unsigned(7 downto 0); --8-bit inputs from latches A and B
student_id : in unsigned(3 downto 0); --4 bit student id from FSM
OP : in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
Result : out unsigned (3 downto 0));
end ALU3;
architecture calculation of ALU3 is
signal p : std_logic;
begin
Result(0) <= '1';
Result(1) <= '1';
Result(2) <= '1';
process(Clock, OP, p)
begin
if(rising_edge(Clock)) THEN
case OP is
WHEN "0000000000000001" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000000000010" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000000000100"  =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000000001000" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000000010000"  =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000000100000" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000001000000" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000010000000" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN "0000000100000000" =>
p <= student_id(0) xnor student_id(1) xnor student_id(2) xnor student_id(3);
WHEN OTHERS =>
--Don't care, do nothing
Result <= null;
end case;
end if;
Result(3) <= p;
end process;
end calculation;
