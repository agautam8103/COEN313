library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity converter is
port( sign_mag : in std_logic_vector(3 downto 0) ;
twos_comp : out std_logic_vector(3 downto 0) );
end converter;

architecture arch_con of converter is
signal plus, not_a: std_logic_vector(2 downto 0);
signal fin : std_logic_vector(3 downto 0);
begin
process (sign_mag,plus, not_a)
begin
not_a <= not sign_mag(2 downto 0);
plus <= not_a + "001";
if (sign_mag(3) = '0')
then
fin <= sign_mag;
else
fin <= sign_mag(3) & plus;
end if;
end process;

twos_comp <= fin;
end arch_con;

