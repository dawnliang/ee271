library verilog;
use verilog.vl_types.all;
entity single_hex is
    generic(
        zero            : vl_logic_vector(0 to 6) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        one             : vl_logic_vector(0 to 6) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1);
        two             : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        three           : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0);
        four            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1);
        five            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0);
        six             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        seven           : vl_logic_vector(0 to 6) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0);
        eight           : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        nine            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        active          : in     vl_logic;
        dv              : in     vl_logic_vector(6 downto 0);
        increment       : in     vl_logic;
        display         : out    vl_logic_vector(6 downto 0);
        cycle           : out    vl_logic
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
    attribute mti_svvh_generic_type of eight : constant is 1;
    attribute mti_svvh_generic_type of nine : constant is 1;
end single_hex;
