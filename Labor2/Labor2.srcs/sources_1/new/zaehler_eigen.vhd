----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2022 17:59:45
-- Design Name: 
-- Module Name: zaehler_eigen - 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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



entity zaehler_eigen is
 Generic (length : integer;
 maxvalue : integer);
 Port (C_out : out std_logic;
 Q : out std_logic_vector (length-1 downto 0);
 clk : in std_logic;
 reset : in std_logic;
 enable : in std_logic
  );
end zaehler_eigen;

