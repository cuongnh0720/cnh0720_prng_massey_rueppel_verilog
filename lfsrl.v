module lfsrl (
    input i_clk,
    input i_rst,
    input [12:0] i_seed,
    output [12:0] o_lfsrL
);
    wire msb_lfsrL_sig;
    wire [12:0] temp1; 
    reg [12:0]temp2; 
    wire [12:0] temp ;
    wire msb_lfsrL;

    always @(posedge i_clk ) begin
        if (i_rst) begin
            temp2 <= i_seed;
        end else begin
            temp2 <= temp;
        end
//        o_lfsrL <= temp;
//        msb_lfsrL_sig <= temp[12] ^ temp[3] ^ temp[2] ^ temp[0];
    end
    assign temp = {msb_lfsrL, temp1[12:1]};
    assign temp1 = {msb_lfsrL_sig, temp2[12:1]};
    assign o_lfsrL = temp2;
    assign msb_lfsrL_sig = temp2[12] ^ temp2[3] ^ temp2[2] ^ temp2[0];
    assign msb_lfsrL = temp1[12] ^ temp1[3] ^ temp1[2] ^ temp1[0];
endmodule
