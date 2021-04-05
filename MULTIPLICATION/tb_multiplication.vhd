library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity tb_MULTIPLIER is
end tb_MULTIPLIER;

architecture tb_rtl of tb_MULTIPLIER is
    signal clk : std_logic := '1';
    signal reset: std_logic := '0';
    constant clk_period : time  := 100 ns;
    constant TIME_DELAY : time  := 10000 ns;
    signal RESULT  : std_logic_vector(7 downto 0);
    signal a  : std_logic_vector (3 downto 0):="0000";
    signal b  :  std_logic_vector (3 downto 0):="0000";
    component  pipelineMultiplier is
        port (
               a  : in std_logic_vector (3 downto 0);
               b  : in std_logic_vector (3 downto 0);
               RESULT  : out std_logic_vector(7 downto 0);
               reset :in std_logic;
               clk: in std_logic        
               );  
      
    end component;
begin

    uut: pipelineMultiplier PORT MAP (
        a => a,
        b => b,
        RESULT => RESULT,
        clk=>clk,
        reset=>reset
    );
     
     idk: process
           begin
           wait for clk_period;
           if(a/=15) then
           a<=a+1;
           else
           a<=(others=>'0');
           b<=b+1;
           end if;
           end process;

    clk <= not clk after clk_period/2; 
    

end tb_rtl;
