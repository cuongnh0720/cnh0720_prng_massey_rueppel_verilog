module lfsrm (
    input i_clk,
    input i_rst,
    input [6:0] i_seed,
    output [6:0] o_lfsrM
);
    wire msb_lfsrM;
    reg [6:0] temp;

    always @(posedge i_clk) begin
        if (i_rst) begin
            temp <= i_seed;
        end else begin
            temp <= {msb_lfsrM, temp[6:1]};
        end
        
    end
    assign o_lfsrM = temp;
    assign msb_lfsrM = temp[6] ^ temp[0];
endmodule
