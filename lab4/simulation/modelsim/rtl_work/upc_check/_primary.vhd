library verilog;
use verilog.vl_types.all;
entity upc_check is
    port(
        mupc            : in     vl_logic_vector(3 downto 0);
        D               : out    vl_logic;
        S               : out    vl_logic
    );
end upc_check;
