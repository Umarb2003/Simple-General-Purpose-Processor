library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU2 is
	port( Clock : in std_logic; --input clock signal
	A,B: in unsigned(7 downto 0); --8-bit inputs from latches A and B
	student_id : in unsigned(3 downto 0); --4 bit student id from FSM
	OP : in unsigned(15 downto 0); --16-bit selector for Operation from Decoder
	Neg: out std_logic; --is the result negative ? Set-ve bit output
	R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Resull Output
	R2 : out unsigned(3 downto 0));-- higher 4-bits of 8-bit Result Output
end ALU2;
architecture calculation of ALU2 is --temporary signal declarations.
signal Reg1,Reg2,Result : unsigned(7 downto 0):= (others=>'0');
signal Reg4: unsigned (7 DOWNTO 0);
begin
Reg1 <= A; --temporarily store A in Regl local variable
Reg2 <= B; --temporarily store B in Reg2 local variable
process(Clock, OP)
begin
if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
case OP is
--produce the difference between A and B
WHEN "0000000000000001" => 
	if (Reg1 > Reg2) then
		Result <= Reg1 - Reg2;
		Neg <= '0';
	elsif (Reg1 = Reg2) then
		Result <= "00000000";
		Neg <= '0';
	else
		Result <= not(Reg1 - Reg2) + 1;
		Neg <= '1';
	end if;
--produce the 2's complement of B
WHEN "0000000000000010" => Result <= (NOT(Reg2))+1;
--Swap the lower 4 bits of A with lower 4 bits of B
WHEN "0000000000000100"  => 
	Result(3 DOWNTO 0) <= Reg2(3 downto 0);
   Result(7 DOWNTO 4) <= Reg1(7 downto 4);
-- Produce null on the output
WHEN "0000000000001000" => Result <= (others => '0');
-- Decrement B by 5
WHEN "0000000000010000"  => Result <= Reg2 - 5;
-- Invert the bit-significance order of A
WHEN "0000000000100000" => 
												 Result(0)<= Reg1(7);
												 Result(1)<= Reg1(6);
												 Result(2)<= Reg1(5);
												 Result(3)<= Reg1(4);
												 Result(4)<= Reg1(3);
												 Result(5)<= Reg1(2);
												 Result(6)<= Reg1(1);
												 Result(7)<= Reg1(0);
												 
-- Shift B to left by 3 bits, input bit = 1 (SHL)
WHEN "0000000001000000" => Result <= Reg2 SLL 3;
-- Increment A by 3
WHEN "0000000010000000" => Result <= Reg1 + 3;
-- Invert all bits of B
WHEN "0000000100000000" => 
									Result(7)<= NOT Reg2(7);
									Result(6)<= NOT Reg2(6);
									Result(5)<= NOT Reg2(5);
									Result(4)<= NOT Reg2(4);
									Result(3)<= NOT Reg2(3);
									Result(2)<= NOT Reg2(2);
									Result(1)<= NOT Reg2(1);
									Result(0)<= NOT Reg2(0);
WHEN OTHERS =>
--Don't care, do nothing
end case;
end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits
end calculation;