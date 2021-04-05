library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity pipelineMultiplier is
  port (

         a  : in std_logic_vector (3 downto 0);
         b  : in std_logic_vector (3 downto 0);
         RESULT  : out std_logic_vector(7 downto 0);
         reset :in std_logic;
         clk: in std_logic
         
         );  
  end pipelineMultiplier;

architecture Multiplier of pipelineMultiplier is

    component multLINE
    Port (
         a  : in std_logic_vector (3 downto 0);
         b  : in std_logic;
         aOUTs  : out std_logic_vector(3 downto 0);
         sout  : out std_logic_vector(3 downto 0);
         Cout : out std_logic;
         sin : in std_logic_vector (3 downto 0);
         clk : in std_logic;
         reset : in std_logic
            );
    end component;  
    signal alphas1 : std_logic_vector (3 downto 0);
    signal alphas2 : std_logic_vector (3 downto 0);
    signal alphas3 : std_logic_vector (3 downto 0);
    signal sums1   : std_logic_vector (3 downto 0);
    signal sums2   : std_logic_vector (3 downto 0);
    signal sums3   : std_logic_vector (3 downto 0);
    signal sums4   : std_logic_vector (3 downto 0);
    signal sins1   : std_logic_vector (3 downto 0);
    signal sins2   : std_logic_vector (3 downto 0);
    signal sins3   : std_logic_vector (3 downto 0);
    signal carria : std_logic_vector (3 downto 0);
    signal carriaREG1  : std_logic := '0' ;
    signal carriaREG2  : std_logic := '0' ;
    signal carriaREG3  : std_logic := '0' ;



    signal sinFIRST : std_logic_vector (3 downto 0) ;
    signal regA0: std_logic:= '0';
    signal regA1: std_logic_vector (1 downto 0):= (others=> '0');
    signal regA2: std_logic_vector (2 downto 0):= (others=> '0');
    signal regA3: std_logic_vector (3 downto 0):= (others=> '0');
    signal regB0 : std_logic := '0' ;
    signal regB1 : std_logic_vector (2 downto 0):= (others=> '0');
    signal regB2 : std_logic_vector (4 downto 0):= (others=> '0');
    signal regB3 : std_logic_vector (6 downto 0):= (others=> '0');
    signal Ainput: std_logic_vector (3 downto 0);
    signal Binput: std_logic_vector (3 downto 0);
    signal regP0 : std_logic_vector (8 downto 0):= (others=> '0');
    signal regP1 : std_logic_vector (6 downto 0):= (others=> '0');
    signal regP2 : std_logic_vector (4 downto 0):= (others=> '0');
    signal regP3 : std_logic_vector(2 downto 0):= (others=> '0');
    signal regP4 : std_logic_vector(1 downto 0):= (others=> '0');
    signal regP5 : std_logic := '0' ;



begin 
sinFIRST<= "0000";
process(clk)
begin
if (rising_edge(clk)) then
carriaREG1<=carria(0);
carriaREG2<=carria(1);
carriaREG3<=carria(2);
end if;
end process; 


sins1 <=carriaREG1 &sums1(3 downto 1);
sins2 <= carriaREG2&sums2(3 downto 1);
sins3 <= carriaREG3&sums3(3 downto 1);

-- A INPUTS flip flopped
process(clk)
begin
if (rising_edge(clk)) then 
regA0<=a(0);
--
regA1(0)<=a(1);
regA1(1)<=regA1(0);
--
regA2(0)<=a(2);
regA2(1)<=regA2(0);
regA2(2)<=regA2(1);

--
regA3(0)<=a(3);
regA3(1)<=regA3(0);
regA3(2)<=regA3(1);
regA3(3)<=regA3(2);
end if;
end process;   

Ainput<=regA3(3)&regA2(2)&regA1(1)&regA0;

-- B INPUTS FLIP FLOPPED
process(clk)
begin
if (rising_edge(clk)) then 
regB0<=b(0);
--
regB1(0)<=b(1);
regB1(1)<=regB1(0);
regB1(2)<=regB1(1);
--
regB2(0)<=b(2);
regB2(1)<=regB2(0);
regB2(2)<=regB2(1);
regB2(3)<=regB2(2);
regB2(4)<=regB2(3);

--
regB3(0)<=b(3);
regB3(1)<=regB3(0);
regB3(2)<=regB3(1);
regB3(3)<=regB3(2);
regB3(4)<=regB3(3);
regB3(5)<=regB3(4);
regB3(6)<=regB3(5);
end if;
end process;   

Binput<=regB3(6)&regB2(4)&regB1(2)&regB0;

multLINE_0: multLINE
 port map (
            a => Ainput, 
            b => Binput(0), 
            aOUTs => alphas1,
            sin => sinFIRST,
            sout => sums1, 
            Cout => carria(0),
            clk=>clk, 
            reset => reset
            );

multLINE_1: multLINE
     port map (
            a => alphas1, 
            b => Binput(1), 
            aOUTs => alphas2,
            sin => sins1,
            sout => sums2, 
            Cout => carria(1),
            clk=>clk, 
            reset => reset
                       );
multLINE_2: multLINE
 port map (
            a => alphas2, 
            b => Binput(2), 
            aOUTs => alphas3,
            sin => sins2,
            sout => sums3, 
            Cout => carria(2),
            clk=>clk, 
            reset => reset
            );

multLINE_3: multLINE
 port map (
            a => alphas3, 
            b =>Binput(3), 
            sin => sins3,
            sout => sums4, 
            Cout => carria(3),
            clk=>clk, 
            reset => reset
            );            
-- output flip floped
process(clk)
begin
if (rising_edge(clk)) then 
regP0(0)<=sums1(0);
regP0(1)<=regP0(0);
regP0(2)<=regP0(1);
regP0(3)<=regP0(2);
regP0(4)<=regP0(3);
regP0(5)<=regP0(4);
regP0(6)<=regP0(5);
regP0(7)<=regP0(6);
regP0(8)<=regP0(7);

regP1(0)<=sums2(0);
regP1(1)<=regP1(0);
regP1(2)<=regP1(1);
regP1(3)<=regP1(2);
regP1(4)<=regP1(3);
regP1(5)<=regP1(4);
regP1(6)<=regP1(5);

regP2(0)<=sums3(0);
regP2(1)<=regP2(0);
regP2(2)<=regP2(1);
regP2(3)<=regP2(2);
regP2(4)<=regP2(3);
-----------------------------
regP3(0)<=sums4(0);
regP3(1)<=regP3(0);
regP3(2)<=regP3(1);
-------------------------------
regP4(0)<=sums4(1);
regP4(1)<=regP4(0);
------------------------------
regP5<=sums4(2);

end if;
end process; 
            
   RESULT<=carria(3)&sums4(3)&regP5&regP4(1)&regP3(2)&regP2(4)&regP1(6)&regP0(8);
               
end Multiplier;
