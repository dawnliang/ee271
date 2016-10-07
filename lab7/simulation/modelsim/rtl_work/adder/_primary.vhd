library verilog;
use verilog.vl_types.all;
entity adder is
    generic(
        WIDTH           : integer := 9
    );
    port(
        \out\           : out    vl_logic_vector;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder;
