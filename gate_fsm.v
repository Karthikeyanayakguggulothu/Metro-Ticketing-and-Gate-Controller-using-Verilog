module gate_fsm (
    input  wire clk,
    input  wire rst_n,
    input  wire card_tapped,
    input  wire card_valid,
    input  wire sufficient_balance,
    input  wire passenger_passed_event,
    input  wire timeout_event,
    
    output reg  gate_open,
    output reg  alarm_trigger,
    output reg  deduct_fare_en
);
   
    localparam IDLE      = 3'd0;
    localparam VALIDATE  = 3'd1;
    localparam GATE_OPEN = 3'd2;
    localparam ALARM     = 3'd3;

    reg [2:0] current_state, next_state;

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) current_state <= IDLE;
        else        current_state <= next_state;
    end

   
    always @(*) begin
       
        next_state = current_state;
        gate_open = 1'b0;
        alarm_trigger = 1'b0;
        deduct_fare_en = 1'b0;

        case (current_state)
            IDLE: begin
                if (card_tapped) next_state = VALIDATE;
            end
            
            VALIDATE: begin
                if (card_valid && sufficient_balance) begin
                    deduct_fare_en = 1'b1;
                    next_state = GATE_OPEN;
                end else begin
                    next_state = ALARM;
                end
            end
            
            GATE_OPEN: begin
                gate_open = 1'b1;
                if (passenger_passed_event || timeout_event) begin
                    next_state = IDLE;
                end
            end
            
            ALARM: begin
                alarm_trigger = 1'b1;
                next_state = IDLE;
            end
            
            default: next_state = IDLE;
        endcase
    end
endmodule
