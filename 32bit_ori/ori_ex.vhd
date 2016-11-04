LIBRARAY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY ex IS
  PORT(
    rst: IN STD_LOGIC;

    //译码阶段->执行阶段
    aluop_i: IN STD_LOGIC_VECTOR (7 downto 0);
    alusel_i: IN STD_LOGIC_VECTOR (2 downto 0);
    reg1_i: IN STD_LOGIC_VECTOR (31 downto 0);
    reg2_i: IN STD_LOGIC_VECTOR (31 downto 0);
    wd_i: IN STD_LOGIC_VECTOR (4 downto 0);
    wreg_i: IN STD_LOGIC;

    //执行结果
    wd_o: OUT STD_LOGIC_VECTOR (4 downto 0);
    wreg_o: OUT STD_LOGIC;
    wdata_o: OUT STD_LOGIC_VECTOR (31 downto 0)
  );

  ARCHITECTURE behave OF ex IS
    SIGNAL wd_s: STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL wdata_s: STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL wreg_s: STD_LOGIC;
    SIGNAL logicout: STD_LOGIC_VECTOR (31 downto 0);
  BEGIN
    PROCESS(ALL)
      BEGIN
        IF(rst='1')THEN
          logicout <= X"00000000";
        ELSE
          CASE aluop_i IS
            WHEN "00100101"=>logicout<=reg1_i OR reg2_i;
            WHEN others=>logicout<=X"00000000";
          END CASE;
        END IF;
      END PROCESS;

    PROCESS(ALL)
      BEGIN
        wd_s <= wd_i;
        wreg_s <= wreg_i;
        CASE alusel_i IS
          WHEN "001"=>wdata_s<=logicout;
          WHEN others=>wdata_s<=X"00000000";
        END CASE;
        wd_o <= wd_s;
        wreg_o <= wreg_s;
        wdata_o <= wdata_s;
      END PROCESS;
  END;
