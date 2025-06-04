module fsm_top (
    input clk,
    input rst,
    input startfill,
    input productook,
    output llenando,
    output sellando,
    output LED,
    output [2:0] state_filler,
    output [2:0] state_sealer
);

    wire lleno_flag;

    // Instancia de la FSM de llenado (Moore)
    fsm_moore_filler u_filler (
        .clk(clk),
        .rst(rst),
        .startfill(startfill),
        .lleno_flag(lleno_flag),
        .llenando(llenando),
        .state_indicator(state_filler)
    );

    // Instancia de la FSM de sellado (Mealy)
    fsm_mealy_sealer u_sealer (
        .clk(clk),
        .rst(rst),
        .lleno_flag(lleno_flag),
        .productook(productook),
        .sellando(sellando),
        .LED(LED),
        .state_indicator(state_sealer)
    );

endmodule
