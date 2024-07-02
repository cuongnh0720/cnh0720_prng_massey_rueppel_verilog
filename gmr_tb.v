module gmr_tb;

    // Signal declarations
    reg i_clk = 0;
    reg i_rst = 0;
    reg [6:0] i_seed_lfsrM = 7'b0;
    reg [12:0] i_seed_lfsrL = 13'b0;
    wire [6:0] o_lfsrM;
    wire [12:0] o_lfsrL;
    wire o_keystream;

    // Clock period definitions
    parameter clk_period = 10; // in ns

    // Instantiate the Unit Under Test (UUT)
    gmr uut (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_seed_lfsrM(i_seed_lfsrM),
        .i_seed_lfsrL(i_seed_lfsrL),
        .o_lfsrM(o_lfsrM),
        .o_lfsrL(o_lfsrL),
        .o_keystream(o_keystream)
    );

    // Clock process definitions
    always begin
        i_clk = 1;
        # (clk_period / 2);
        i_clk = 0;
        # (clk_period / 2);
    end

    // Stimulus process
    initial begin
        // Hold reset state for 20 ns
        #20;
        i_rst = 1;
        i_seed_lfsrM = 7'b1011010;
        i_seed_lfsrL = 13'b1010110100111;
        #50;

        // Release reset and observe behavior
        i_rst = 0;

        // Wait for some time to observe the output
        #200;

        // Finish simulation
        $finish;
    end

endmodule
