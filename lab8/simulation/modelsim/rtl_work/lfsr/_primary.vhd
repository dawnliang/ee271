library verilog;
use verilog.vl_types.all;
entity lfsr is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end lfsr;
