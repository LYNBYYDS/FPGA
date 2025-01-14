----------------------------------------------------------------------------------
-- Company: Sorbonne University
-- Engineer: Yong LI 
-- 
-- Create Date: 22.03.2023 18:39:36
-- Design Name: Registre_DCC
-- Module Name: REGISTRE_DCC - Behavioral
-- Project Name: IP_Centrale_DCC
-- Target Devices: 
-- Tool Versions: Vivado 2020.2
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REGISTRE_DCC is
    Port (  Clk : in std_logic;		                            -- Horloge 100 MHz 
            Reset : in std_logic;		                        -- Reset Asynchrone
            Trame_DCC : in std_logic_vector(50 downto 0);	    -- Trame DCC
            Com_REG : in std_logic_vector(1 downto 0);          -- Command for register
            Bit_out : out std_logic                             -- Bit send to MAE
            );
end REGISTRE_DCC;

architecture Behavioral of REGISTRE_DCC is

signal nb_shifted : INTEGER range 0 to 50;	                    -- Compteur de cycles d'horloge
signal reg_data : std_logic_vector(50 downto 0);			 	-- Signal stock the Trame data
signal bit_out_s : std_logic;                                   -- Signal stock the last data send to FSM

begin

    bit_out <= bit_out_s;

    -- Command for register
        -- shift 
        -- charge
        -- im trying to do it with the Com_REG which
            -- 01 is shift
            -- 10 is charge
            -- others do nothing 

	process (Clk, Reset)
	begin
		-- Reset Asynchrone
		if Reset = '1' then 
            nb_shifted <= 50;                                  -- Reset shift number to 0
			reg_data <= Trame_DCC;                              -- Recharge the data to shift
			Bit_out_s <= '1';
		-- A Chaque Front d'Horloge
		elsif rising_edge (Clk) then
			case (Com_REG) is 
                when "01" =>                                                -- Shift the data
                    if nb_shifted > 0 then                                 -- if not shift to last bit 
                        Bit_out_s <= reg_data(nb_shifted);
                        nb_shifted <= nb_shifted - 1;
                    elsif nb_shifted = 0 then
                        Bit_out_s <= reg_data(nb_shifted);
                        nb_shifted <= 50;
                        reg_data <= Trame_DCC;
                    end if;
                when "10" =>                                                -- Charge new data
                    nb_shifted <= 50;                                        -- Reset the pointer
                    reg_data <= Trame_DCC;
                    Bit_out_s <= '1';
                when others => NULL;
            end case;                    
		end if;
    end process;
end Behavioral;