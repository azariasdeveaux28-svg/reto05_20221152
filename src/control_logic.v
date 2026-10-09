module control_logic (
    input  wire a,
    input  wire b,
    input  wire c,
    input  wire d,
    output wire u,
    output wire v
);
// este es el modulo que usare para las entradas y salidas 


// en esta parte hare la parte de assign que el documento menciona cuando lo fui leyendo que usare el assign. cosa que me simplifica todo 

assign u = (~a & b) | (c & d) | (a & d); //estas ecuaciones salen de los mapas de karnaut que estan en mi pdf
assign v = (a & ~b) | (c & ~d)| (b & c);


endmodule
