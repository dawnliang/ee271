library verilog;
use verilog.vl_types.all;
entity user_input is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key             : in     vl_logic;
        ctrl            : out    vl_logic
    );
end user_input;
