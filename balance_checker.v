module balance_checker (
    input  wire [15:0] current_balance,
    input  wire [15:0] fare_amount,
    output wire        has_sufficient_balance
);
    
    assign has_sufficient_balance = (current_balance >= fare_amount);

endmodule
