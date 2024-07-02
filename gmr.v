module gmr (
    input wire i_clk,
    input wire i_rst,
    input wire [6:0] i_seed_lfsrM,
    input wire [12:0] i_seed_lfsrL,
    output wire [6:0] o_lfsrM,
    output wire [12:0] o_lfsrL,
    output wire o_keystream
);

    wire clk_reg;
    wire [6:0] lfsrM_reg;
    wire [12:0] lfsrL_reg;
    wire [6:0] keystream_and;
    wire keystream_xor;

    // Instantiate div_clk
    div_clk div (
        .i_clk(i_clk),
        .o_clk(clk_reg)
    );

    // Instantiate lfsrl
    lfsrl lfsrL (
        .i_clk(clk_reg),
        .i_rst(i_rst),
        .i_seed(i_seed_lfsrL),
        .o_lfsrL(lfsrL_reg)
    );

    // Instantiate lfsrm
    lfsrm lfsrM (
        .i_clk(clk_reg),
        .i_rst(i_rst),
        .i_seed(i_seed_lfsrM),
        .o_lfsrM(lfsrM_reg)
    );

    // Instantiate andg
    andg and_gate (
        .lfsrM(lfsrM_reg),
        .lfsrL(lfsrL_reg),
        .keystream_and(keystream_and)
    );

    // Instantiate xorg
    xorg xor_gate (
        .keystream_and(keystream_and),
        .keystream_xor(keystream_xor)
    );

    assign o_lfsrM = lfsrM_reg;
    assign o_lfsrL = lfsrL_reg;
    assign o_keystream = keystream_xor;

endmodule
