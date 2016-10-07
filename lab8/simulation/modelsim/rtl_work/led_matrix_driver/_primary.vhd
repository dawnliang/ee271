library verilog;
use verilog.vl_types.all;
entity led_matrix_driver is
    port(
        clk             : in     vl_logic;
        red_array       : in     vl_logic_vector(7 downto 0);
        green_array     : in     vl_logic_vector(7 downto 0);
        red_driver      : out    vl_logic_vector(7 downto 0);
        green_driver    : out    vl_logic_vector(7 downto 0);
        row_sink        : out    vl_logic_vector(7 downto 0)
    );
end led_matrix_driver;
