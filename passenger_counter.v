module passenger_counter (
    input  wire clk,
    input  wire rst_n,
    input  wire count_enable,
    output reg  [31:0] total_passengers
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            total_passengers <= 32'd0;
        end else if (count_enable) begin
            total_passengers <= total_passengers + 1;
        end
    end
endmodule
