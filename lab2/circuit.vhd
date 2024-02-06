library IEEE;
use IEEE.std_logic_1164.all;

entity d1_circuit is
port(a, b, c: in std_logic;
     output: out std_logic);
end d1_circuit;

architecture d1_arch of d1_circuit is

component d1_and
port(a, b, c : in std_logic;
     output : out std_logic);
end component;

component d1_or
port(a, b, c : in std_logic;
     output : out std_logic);
end component;

signal s1, s2, s3 : std_logic;
signal nota,notb,notc : std_logic;

for U1, U2, U3 : d1_and use entity WORK.d1_and(d1_arch);
for U4: d1_or use entity WORK.d1_or(d1_arch);

begin
nota <= not(a);
notb <= not(b);
notc <= not(c);


U1 : d1_and port map(a => nota ,b => notb, c => c , output => s1);
U2 : d1_and port map(a => nota ,b => b, c => c , output => s2);
U3 : d1_and port map(a => a ,b => b, c => c , output => s3);
U4 : d1_or port map(a => s1, b => s2, c=> s3, output => output);
end d1_arch;

    
