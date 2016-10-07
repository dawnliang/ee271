library verilog;
use verilog.vl_types.all;
entity led_matrix_driver_testbench is
    generic(
        EIGHT_OFF       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        CLOCK_PERIOD    : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of EIGHT_OFF : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
end led_matrix_driver_testbench;
