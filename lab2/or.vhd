library IEEE;
use IEEE.std_logic_1164.all;

entity d1_or is 
port( a, b, c: in std_logic;
      output : out std_logic);
end d1_or;

architecture d1_arch of d1_or is
begin
   output <= a or b or c;
end d1_arch;
