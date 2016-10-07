library verilog;
use verilog.vl_types.all;
entity lfsr is
    generic(
        \on\            : vl_logic := Hi1;
        off             : vl_logic := Hi0
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \on\ : constant is 1;
    attribute mti_svvh_generic_type of off : constant is 1;
end lfsr;
