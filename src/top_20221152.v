module top_20221152 (
    input  wire       a,
    input  wire       b,
    input  wire       c,
    input  wire       d,
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       clk,
    input  wire       rst,
    input  wire       en,
    output wire       u,
    output wire       v,
    output wire [3:0] Y,
    output wire       flag_comb,
    output wire [3:0] Q,
    output wire       flag_q
);

       // Control: calcula u y v a partir de a, b, c, d
    control_logic inst_control (
        .a(a), .b(b), .c(c), .d(d),
        .u(u), .v(v)
    );
    datapath inst_datapath (
        .A(A), .B(B),
        .u(u), .v(v),
        .Y(Y), .flag_comb(flag_comb)
    );
    //esto es basicamente como una ruta para los datos.

endmodule