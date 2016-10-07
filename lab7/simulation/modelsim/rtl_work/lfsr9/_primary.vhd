library verilog;
use verilog.vl_types.all;
entity lfsr9 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        num             : out    vl_logic_vector(8 downto 0)
    );
end lfsr9;
