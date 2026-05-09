module fare_calculator (
    input  wire [15:0] current_balance,
    input  wire [15:0] fare_amount,
    output wire [15:0] new_balance
);
    assign new_balance = current_balance - fare_amount;

endmodule
