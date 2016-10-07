library verilog;
use verilog.vl_types.all;
entity active_game is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ctrl            : in     vl_logic;
        \out\           : out    vl_logic
    );
end active_game;
