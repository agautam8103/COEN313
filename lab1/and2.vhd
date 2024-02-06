library IEEE;
use IEEE.std_logic_1164.all;

entity and2_gate is
port( in_1, in_2: in std_logic;
      output    : out std_logic);
end;

architecture example of and2_gate is
begin
  output <= in_1 and in_2;
end;
