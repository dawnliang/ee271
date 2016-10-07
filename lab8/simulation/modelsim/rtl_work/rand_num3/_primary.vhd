library verilog;
use verilog.vl_types.all;
entity rand_num3 is
    generic(
        WIDTH           : integer := 9
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        active          : in     vl_logic;
        \out\           : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end rand_num3;
