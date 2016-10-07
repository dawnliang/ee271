library verilog;
use verilog.vl_types.all;
entity victory is
    generic(
        zero            : vl_logic_vector(0 to 6) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        one             : vl_logic_vector(0 to 6) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1);
        two             : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        three           : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0);
        four            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1);
        five            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0);
        six             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        seven           : vl_logic_vector(0 to 6) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0);
        \on\            : vl_logic := Hi1;
        off             : vl_logic := Hi0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        side            : in     vl_logic;
        control         : in     vl_logic;
        oppose          : in     vl_logic;
        disp            : out    vl_logic_vector(6 downto 0);
        playAgain       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of zero : constant is 1;
    attribute mti_svvh_generic_type of one : constant is 1;
    attribute mti_svvh_generic_type of two : constant is 1;
    attribute mti_svvh_generic_type of three : constant is 1;
    attribute mti_svvh_generic_type of four : constant is 1;
    attribute mti_svvh_generic_type of five : constant is 1;
    attribute mti_svvh_generic_type of six : constant is 1;
    attribute mti_svvh_generic_type of seven : constant is 1;
    attribute mti_svvh_generic_type of \on\ : constant is 1;
    attribute mti_svvh_generic_type of off : constant is 1;
end victory;
