`timescale 1ns/1ps

module tb_top_20221152;
 
 //esta vendrian siendo las entradas de los diseños 
  reg        a, b, c, d;
    reg  [3:0] A, B;
    reg        clk, rst, en;
    //ahora por aca pondre las salidas
     wire       u, v;
    wire [3:0] Y;
    wire       flag_comb;
    wire [3:0] Q;
    wire       flag_q;
        // Contadores de la verificacion
    integer comparaciones;
    integer errores;

    // Diseno bajo prueba, conectado por nombre. esta parte la ia me ayudo ha hacerla ya que no tenia una idea clara y se me estaba
    //acabando el tiempo de entrega
    top_20221152 dut (
        .a(a), .b(b), .c(c), .d(d),
        .A(A), .B(B),
        .clk(clk), .rst(rst), .en(en),
        .u(u), .v(v),
        .Y(Y), .flag_comb(flag_comb),
        .Q(Q), .flag_q(flag_q)
    );

    // Reloj con periodo de 10 ns esta use un recurso que estaba en la plataforma de teams que el profesor dejo
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Archivo de ondas
    initial begin
        $dumpfile("build/dump.vcd");
        $dumpvars(0, tb_top_20221152);
    end

    // Secuencia principal de pruebas (esta parte tambien pregunte a la ia)
    initial begin
        comparaciones = 0;
        errores       = 0;
        a = 0; b = 0; c = 0; d = 0;
        A = 0; B = 0;
        rst = 0; en = 0;
        #20;

        // aqui iran las pruebas

        $display("Fin: %0d comparaciones, %0d errores", comparaciones, errores);
        $finish;
    end

endmodule
