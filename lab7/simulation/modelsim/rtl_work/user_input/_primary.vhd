library verilog;
use verilog.vl_types.all;
entity user_input is
    generic(
        OFF             : vl_logic := Hi0;
        \ON\            : vl_logic := Hi1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key             : in     vl_logic;
        tug             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of OFF : constant is 1;
    attribute mti_svvh_generic_type of \ON\ : constant is 1;
end user_input;
