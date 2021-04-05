library IEEE;
use IEEE.std_logic_1164.all;
entity Half_Adder is
    port(
        aHA,bHA: in std_logic;
        sumHA,carryHA: out std_logic
        );
end entity;    
architecture ok of Half_Adder is 
begin
    sumHA <= (aHA XOR bHA);
    carryHA <= (aHA AND bHA);
end ok;       