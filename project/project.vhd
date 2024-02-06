library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity comb_lock is
port( ld1    : in std_logic;
      ld2    : in std_logic;
      ld3    : in std_logic;
      value  : in std_logic_vector(3 downto 0);
      enter  : in std_logic;
      reset  : in std_logic;
      clock  : in std_logic;
      unlock : out std_logic);																			 
		  
end entity;

architecture arch_comb of comb_lock is
signal c1,c2,c3: std_logic_vector(3 downto 0) := "0000";
subtype state_type is integer range 0 to 31;
signal state, next_state: state_type;  

begin
process(clock , reset, value, state)
begin
if(clock'event and clock = '1' and enter = '1')
then	
state <= next_state;
        if (ld1 = '1' and ld2 = '0' and ld3 = '0')
        then
        c1 <= value;
        elsif (ld1 = '0' and ld2 = '1' and ld3 = '0')
        then
        c2 <= value;
        elsif(ld1 = '0' and ld2 = '0' and ld3 = '1' )
        then
        c3 <= value;
		end if;
             if(ld1 = '0' and ld2 = '0'and ld3 = '0')
        then
        case state is
			when 0 => if(c1 = value) then next_state <= state+1;
			end if;
			when 1 => if(c2 = value) then next_state <= state+1;
			end if;
			when 2 => if(c3 = value) then next_state <= state+1;
			end if;
			when 3 to 31 => next_state <= state+1;
			end case;
			case state is
				when 0 to 1 => unlock <= '0';
				when 2 to 31 => unlock <= '1';
			end case;	 
				
end if;	
end if;
if(reset = '1')
then
unlock <= '0';
state <= 0;
next_state <= 0;
end if;	
end process;	
end;
