library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity method2 is
port( sign_mag : in std_logic_vector(3 downto 0);
twos_comp : out std_logic_vector(3 downto 0));
end method2;

architecture arch_method2 of method2 is
begin
process(sign_mag)
variable a, b: std_logic_vector(2 downto 0);
variable ans: std_logic_vector(3 downto 0);
begin
a := not sign_mag(2 downto 0);
b := a + "001"; 
if(sign_mag(3) = '0')
then ans := sign_mag;
else ans := sign_mag(3) & b;
end if;
twos_comp <= ans;
end process;

end arch_method2;

