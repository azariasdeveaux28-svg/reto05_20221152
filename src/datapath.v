module datapath(
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       u,
    input  wire       v,
    output wire [3:0] Y,
    output wire       flag_comb
);
// Aqui pondre la parte de la suma 
    wire [4:0] sum_ext = {1'b0, A} + {1'b0, B};
    wire [3:0] y_sum   = sum_ext[3:0];
    wire       f_sum   = sum_ext[4];

 // aqui la parte de resta para casi culminar esta parte, la cual son condiciones para comparar es como si fuese un prestamo. algo asi
    wire [3:0] y_sub = A - B;
    wire       f_sub = (A < B);

endmodule
