library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity multLINE is
  port (
         a  : in std_logic_vector (3 downto 0);
         b  : in std_logic;
         aOUTs  : out std_logic_vector(3 downto 0);
         sout  : out std_logic_vector(3 downto 0);
         Cout : out std_logic;
         sin : in std_logic_vector (3 downto 0);
         clk : in std_logic;
         reset : in std_logic
         
         );  
  end multLINE;

architecture LINEr of multLINE is

component FABOX is
  Port (
    a,b,sin,cin,clk,reset : in std_logic;
    aout,bout,cout,sout : out std_logic);
end component;
signal carries : std_logic_vector (3 downto 0):=(others => '0'); 
signal betas   : std_logic_vector (3 downto 0):=(others => '0');
signal sinFIRST : std_logic;
begin 
sinFIRST<='0';
 -- row
 multcell_0: FABOX
 port map (
            a    => a(0),
            b    => b,
            sin => sin(0),
            cin => sinFIRST,  
            sout => sout(0),
            cout => carries(0),
            bout => betas(0),
            aout => aOUTs(0),
            clk => clk,
            reset=>reset
            );
                         
 multcell_1: FABOX
 port map (
             a    => a(1),
             b    => betas(0), 
             cin  => carries(0),
             sout => sout(1),
             cout => carries(1),
             bout => betas(1),
             aout => aOUTs(1),
             sin => sin(1),
             clk => clk, 
             reset=>reset
             );
multcell_2: FABOX
port map (  
            a    => a(2),
            b    => betas(1), 
            cin  => carries(1),
            sout => sout(2),
            cout => carries(2),
            bout => betas(2),
            aout => aOUTs(2),
             sin => sin(2),
             clk => clk, 
             reset=>reset  
            );
multcell_3: FABOX
port map (  
            a    => a(3),
            b    => betas(2), 
            cin  => carries(2),
            sout => sout(3),
            cout => Cout,
            aout => aOUTs(3),
             sin => sin(3),
             clk => clk, 
             reset=>reset
);  

end LINEr;
