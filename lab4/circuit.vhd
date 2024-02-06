library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity registers_min_max is

port( din : in std_logic_vector(3 downto 0);
reset : in std_logic;
clk : in std_logic;
sel : in std_logic_vector(1 downto 0);
max_out : out std_logic_vector(3 downto 0);
min_out : out std_logic_vector(3 downto 0);
reg_out : out std_logic_vector(3 downto 0));
end registers_min_max ;

architecture arc_lab4 of registers_min_max is
signal r0, r1, r2, r3: std_logic_vector(3 downto 0);

begin 
process(clk,reset)
begin
   if reset = '1' then
	r0 <= "1000";
	r1 <= "1000";
	r2 <= "1000";
	r3 <= "1000";
   elsif clk'event and rising_edge(clk) then
	r0 <= din;
	r1 <= r0;
	r2 <= r1;
	r3 <= r2;
   end if;
end process;
with sel select
        reg_out <= r0 when "00",
                   r1 when "01",
                   r2 when "10",
                   r3 when others;


process(clk, reset)
begin 
	if(clk'event and rising_edge(clk)) then
	   if(r0 > r1 or r1 > r2 or r2 > r1 or r3 > r1 or r1 > r3) then
		max_out <= r0;
	   elsif(r1 > r0 or r0 > r2 or r2 > r3 or r3 > r2 or r0 > r3 or r3 > r0)then
		max_out <= r1 ;
	   elsif(r2 > r0 or r0 > r1 or r1 > r3 or r3 > r1 or r0 > r3 or r3 > r0)then
                max_out	<= r1 ;
           elsif(r3 > r0 or r0 > r2 or r2 > r1 or r1 > r2 or r0 > r1 or r1 > r0)then
                max_out	<= r1 ;
	   end if;
	end if;
					
end process;

end arc_lab4;

