library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL:
use IEEE.NUMERIC_STD.ALL;
entity ALU is
	port( Clock : in std_logic; --input clock signal
	A,B: in unsigned(7 downto 0); --8-bit inputs from latches A and B
	student_id : in unsigned(3 downto 0); --4 bit student id from FSM
	OP : in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
	Neg: out std_logic; --is the result negative ? Set-ve bit output
	R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Resull Output
	R2 : out unsigned(3 downto 0));-- higher 4-bits of 8-bit Result Output
end ALU;
architecture calculation of ALU is --temporary signal declarations.
signal Regl,Reg2,Result : unsigned(7 downto 0):= (others=>'0'):
signal Reg4: unsigned (0 to 7):
begin
Regl <= A; --temporarily store A in Regl local variable
Reg2<- B; --temporarily store B in Reg2 local variable
process(Clk, OP)
begin
if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
case OP is
WHEN "0000000000000001" =>
--Do Addition for Regl and Reg2
WIIEN "0000000000000010" =>
--Do Subtraction
--"Neg" bit set if required
WHEN "0000000000000100"  =>
--Do Inverse
WHEN "0000000000001000" =>
--Do Boolean NAND
WHEN "0000000000010000"  =>
--Do Boolean NOR
WHEN "0000000000100000" =>
--Do Boolean AND
WHEN "0000000001000000" =>
--Do Boolean OR
WHEN "0000000010000000" =>
--Do Boolean XOR
WHEN "0000000100000000" =>
-- D)o Boolean XNOR
WHEN OTHERS =>
--Don't care, do nothing
end case;
end if:
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits
end calculation;