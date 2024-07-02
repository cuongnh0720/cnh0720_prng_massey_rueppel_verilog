module andg (
    input [6:0] lfsrM,
    input [12:0] lfsrL,
    output [6:0] keystream_and
);

    assign keystream_and = lfsrM & lfsrL[6:0];
endmodule
