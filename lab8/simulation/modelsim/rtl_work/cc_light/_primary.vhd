library verilog;
use verilog.vl_types.all;
entity cc_light is
    generic(
        WIDTH           : integer := 7
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        active          : in     vl_logic;
        over            : in     vl_logic;
        ctrl            : in     vl_logic;
        dv              : in     vl_logic;
        nu              : in     vl_logic;
        nd              : in     vl_logic;
        ul              : in     vl_logic;
        light           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end cc_light;
