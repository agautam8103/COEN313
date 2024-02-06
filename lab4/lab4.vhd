library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_unsigned.all;

entity registers_min_max is

port( din : in std_logic_vector(3 downto 0);

    reset : in std_logic;

    clk   : in std_logic;

    sel   : in std_logic_vector(1 downto 0);

    max_out : out std_logic_vector(3 downto 0);

    min_out : out std_logic_vector(3 downto 0);

    reg_out: out std_logic_vector(3 downto 0));

end registers_min_max ;

architecture arch of registers_min_max is

signal d_r0, d_r1, d_r2, d_r3 : std_logic_vector (3 downto 0) := "0000";

signal LED_max, LED_min : std_logic := '0';

signal max_reg_in, max_reg_out : std_logic_vector (3 downto 0) := "0000";

signal min_reg_in, min_reg_out : std_logic_vector (3 downto 0) := "0000";

begin

REG_FILE: process (clk, reset)

begin

if (reset = '1') then

d_r0 <= "1000";

d_r1 <= "1000";

d_r2 <= "1000";

d_r3 <= "1000";

elsif (rising_edge(clk)) then

d_r0 <= din;

d_r1 <= d_r0;

d_r2 <= d_r1;

d_r3 <= d_r2;

else d_r0 <= d_r0; d_r1 <= d_r1; d_r2 <= d_r2; d_r3 <= d_r3;

end if;

end process REG_FILE;

MUX: process (sel, clk)

variable mux_out : std_logic_vector (3 downto 0) := "0000";

begin

reg_out <= mux_out;

if (sel = "00") then

    mux_out := d_r0;

elsif (sel = "01") then

    mux_out := d_r1;

elsif (sel = "10") then

    mux_out := d_r2;

elsif (sel = "11") then

    mux_out := d_r3;

else mux_out := "0000";

end if;

end process MUX;

COMBO: process (d_r0, d_r1, d_r2, d_r3)

variable currentMin : std_logic_vector (3 downto 0);

variable currentMax : std_logic_vector (3 downto 0);

variable R0, R1, R2, R3 : std_logic_vector(3 downto 0);

variable index : integer := 0;

begin

R0 := d_r0; R1 := d_r1; R2:= d_r2; R3 := d_r3;

if (R0 > R1 and R0 > R2 and R0 > R3) then

currentMax := R0;

elsif (R1 > R0 and R1 > R2 and R1 > R3) then

currentMax := R1;

elsif (R2 > R0 and R2 > R1 and R2 > R3) then

currentMax := R2;

else currentMax := R3;

end if;

if (R3 < R0 and R3 < R1 and R3 < R2) then

currentMin := R3;

elsif (R2 < R0 and R2 <R1 and R2 < R3) then

currentMin := R2;

elsif (R1 < R0 and R1 < R2 and R1 < R3) then

currentMin := R1;

else currentMin := R0;

end if;

 

max_reg_in <= currentMax;

min_reg_in <= currentMin;

end process COMBO;

MAX_REG: process (clk, reset)

begin

max_reg_out <= max_reg_in;

if (reset = '1') then

max_out <= "1000";

elsif (rising_edge(clk)) then

if (max_reg_in >= max_reg_out) then

LED_max <= '1';

else LED_max <= '0';

end if;

if (LED_max = '1') then

max_out <= max_reg_in;

else

max_out <= max_reg_out;

end if;

end if;

end process MAX_REG;

MIN_REG: process (clk, reset)

begin

min_reg_out <= min_reg_in;

if (reset = '1') then

min_out <= "1000";

elsif (rising_edge(clk)) then

if (min_reg_in <= min_reg_out) then

LED_min <= '1';

else LED_min <= '0';

end if;

if (LED_min = '1') then

min_out <= min_reg_in;

else

min_out <= min_reg_out;

end if;

end if;

end process MIN_REG;

end arch;
