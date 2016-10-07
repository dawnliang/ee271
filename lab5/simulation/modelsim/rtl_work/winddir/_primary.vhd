library verilog;
use verilog.vl_types.all;
entity winddir is
    generic(
        OUTER           : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi1);
        INNER           : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        LEFT            : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        RIGHT           : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        CALM            : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        RTL             : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        LTR             : vl_logic_vector(1 downto 0) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        dir             : in     vl_logic_vector(1 downto 0);
        pattern         : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of OUTER : constant is 2;
    attribute mti_svvh_generic_type of INNER : constant is 2;
    attribute mti_svvh_generic_type of LEFT : constant is 2;
    attribute mti_svvh_generic_type of RIGHT : constant is 2;
    attribute mti_svvh_generic_type of CALM : constant is 2;
    attribute mti_svvh_generic_type of RTL : constant is 2;
    attribute mti_svvh_generic_type of LTR : constant is 2;
end winddir;
