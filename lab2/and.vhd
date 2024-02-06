library IEEE;
use IEEE.std_logic_1164.all;

entity d1_and is
port(a,b,c : in std_logic;
     output : out std_logic);
end d1_and;

architecture d1_arch of d1_and is
begin
    output <= a and b and c;
end d1_arch;
