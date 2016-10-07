library verilog;
use verilog.vl_types.all;
entity status_checker is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        active          : in     vl_logic;
        player          : in     vl_logic_vector(7 downto 0);
        pipes           : in     vl_logic_vector(7 downto 0);
        crash           : out    vl_logic;
        addPoint        : out    vl_logic
    );
end status_checker;
