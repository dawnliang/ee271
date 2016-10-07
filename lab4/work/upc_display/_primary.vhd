library verilog;
use verilog.vl_types.all;
entity upc_display is
    port(
        upc             : in     vl_logic_vector(2 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0)
    );
end upc_display;
