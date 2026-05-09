module entry_exit_tracker #(
    parameter TIMEOUT_CYCLES = 32'd1000000
)(
    input  wire clk,
    input  wire rst_n,
    input  wire gate_is_open,
    input  wire passenger_sensor,
    output reg  passenger_passed_event,
    output reg  timeout_event
);
    reg [31:0] timer;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer <= 32'd0;
            passenger_passed_event <= 1'b0;
            timeout_event <= 1'b0;
        end else begin
            passenger_passed_event <= 1'b0;
            timeout_event <= 1'b0;

            if (gate_is_open) begin
                if (passenger_sensor) begin
                    passenger_passed_event <= 1'b1;
                    timer <= 32'd0;
                end else if (timer >= TIMEOUT_CYCLES) begin
                    timeout_event <= 1'b1;
                    timer <= 32'd0;
                end else begin
                    timer <= timer + 1;
                end
            end else begin
                timer <= 32'd0;
            end
        end
    end
endmodule