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
        integer i;
    reg [3:0] idx;

    // Diseño bajo prueba, conectado por nombre. esta parte la ia me ayudo ha hacerla ya que no tenia una idea clara y se me estaba
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
     // Hoja de respuestas de u: sale de la lista de minterms del PDF que me asignaron como matricula
    function ref_u;
        input [3:0] n;
        begin
            case (n)
                4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd9, 4'd11, 4'd13, 4'd15: ref_u = 1'b1;
                default: ref_u = 1'b0;
            endcase
        end
    endfunction
        // Hoja de respuestas de v: sale de la lista de minterms del PDF esta parte como es similar a la  de u copie y
        // pegue algunas cosas
    function ref_v;
        input [3:0] n;
        begin
            case (n)
                4'd2, 4'd6, 4'd7, 4'd8, 4'd9, 4'd10, 4'd11, 4'd14, 4'd15: ref_v = 1'b1;
                default: ref_v = 1'b0;
            endcase
        end
    endfunction

    // Secuencia principal de pruebas (esta parte tambien pregunte a la ia)
    initial begin
        comparaciones = 0;
        errores       = 0;
        a = 0; b = 0; c = 0; d = 0;
        A = 0; B = 0;
        rst = 0; en = 0;
        #20;

                // Prueba del control: las 16 combinaciones de a,b,c,d
        for (i = 0; i < 16; i = i + 1) begin
            idx = i;
            {a, b, c, d} = idx;
            #1;
            comparaciones = comparaciones + 1;
            if (u !== ref_u(idx) || v !== ref_v(idx)) begin
                errores = errores + 1;
                $display("ERROR control idx=%0d: u=%b (esperado %b) v=%b (esperado %b)",
                         idx, u, ref_u(idx), v, ref_v(idx));
            end
        end
        $display("Fin: %0d comparaciones, %0d errores", comparaciones, errores);
        $finish;
    end

endmodule
