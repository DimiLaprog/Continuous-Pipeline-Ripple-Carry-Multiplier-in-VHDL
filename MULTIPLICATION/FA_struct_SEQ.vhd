library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_seq is
    port(
        a,b,Cin,clk,reset: in std_logic;
        Sum,Cout: out std_logic
    );
end Full_adder_seq;

architecture struct of Full_adder_seq is
    signal sum1,carry1, sum2, carry2: std_logic;
    component Half_Adder is
        Port
        (
            aHA: in std_logic;
            bHA: in std_logic;
            sumHA: out std_logic;
            carryHA: out std_logic
        );
    end component;    
begin
     HA1: Half_Adder
        port map(        
            aHA => a,
            bHA => b,
            sumHA => sum1,
            carryHA => carry1
        );
     HA2: Half_Adder   
        port map(
            aHA=> cin,
            bHA=> sum1,
            sumHA=> sum2,
            carryHA=> carry2
        );
   
process(clk)
begin
    if (rising_edge(clk)) then
        if reset='1' then 
    Sum <= '0';
    Cout <= '0';
    else        
    Sum<=sum2;
    Cout<=carry2 OR carry1;
    end if; 
    end if;
end process;

end struct;