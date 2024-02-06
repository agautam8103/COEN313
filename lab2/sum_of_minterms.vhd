library IEEE;
use IEEE.std_logic_1164.all;

entity sum_of_minterms is
 port( a,b,c : in std_logic;
       output : out std_logic);
end sum_of_minterms;

architecture example of sum_of_minterms is
begin
	output <= ((not(a)) and (not(b)) and c) or ((not(a)) and b and c) or (a and b and c);
end; 
