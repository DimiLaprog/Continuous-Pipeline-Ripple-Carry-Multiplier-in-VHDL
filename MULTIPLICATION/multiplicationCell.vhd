library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FABOX is
    Port    (a,b,sin,cin,clk,reset : in std_logic;
             aout,bout,cout,sout : out std_logic);
end FABOX;

architecture cell of FABOX is
component Full_adder_seq is
Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       reset: in STD_LOGIC;
       clk: in STD_LOGIC;
       Sum : out STD_LOGIC);
end component;
signal rega: std_logic;
signal andgate: std_logic;

begin
andgate<= a and b;
-- this fulladder includes registers in outputs
fulladder: Full_adder_seq
port map( a=>andgate,
          b=>sin,
          Cin=>cin,
          Sum=>sout,
          reset=>reset,
          clk=>clk,
          Cout =>cout);
process(clk)
begin
if (rising_edge(clk)) then 
rega <= a;
aout <= rega;
bout <= b;
end if;
end process;         


end cell;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FABOX is
    Port    (a,b,sin,cin,clk,reset : in std_logic;
             aout,bout,cout,sout : out std_logic);
end FABOX;

architecture cell of FABOX is
component Full_adder_seq is
Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       reset: in STD_LOGIC;
       clk: in STD_LOGIC;
       Sum : out STD_LOGIC);
end component;
signal rega: std_logic;
signal andgate: std_logic;

begin
andgate<= a and b;
-- this fulladder includes registers in outputs
fulladder: Full_adder_seq
port map( a=>andgate,
          b=>sin,
          Cin=>cin,
          Sum=>sout,
          reset=>reset,
          clk=>clk,
          Cout =>cout);
process(clk)
begin
if (rising_edge(clk)) then 
rega <= a;
aout <= rega;
bout <= b;
end if;
end process;         


end cell;
