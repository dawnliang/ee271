library verilog;
use verilog.vl_types.all;
entity pipe_generator is
    generic(
        WIDTH           : integer := 9
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        active          : in     vl_logic;
        over            : in     vl_logic;
        index           : in     vl_logic_vector(2 downto 0);
        pattern         : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end pipe_generator;
