library verilog;
use verilog.vl_types.all;
entity upc_display is
    port(
        upc             : in     vl_logic_vector(2 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0)
    );
end upc_display;
