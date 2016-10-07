library verilog;
use verilog.vl_types.all;
entity upc_check_display is
    port(
        mupc            : in     vl_logic_vector(3 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        D               : out    vl_logic;
        S               : out    vl_logic
    );
end upc_check_display;
