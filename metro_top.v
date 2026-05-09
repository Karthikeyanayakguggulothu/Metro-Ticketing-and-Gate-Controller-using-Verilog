module metro_top #(
    parameter FARE_AMOUNT = 16'd300,
    parameter TIMEOUT_CYCLES = 32'd1000000
)(
    input  wire clk,
    input  wire rst_n,
    
    input  wire card_tapped,
    input  wire card_valid,
    input  wire [15:0] card_balance,
    input  wire passenger_sensor,
    
    output wire gate_open,
    output wire alarm_trigger,
    output wire [15:0] updated_balance,
    output wire write_back_en,
    output wire [31:0] passenger_count
);
    wire w_sufficient_balance;
    wire w_passenger_event;
    wire w_timeout_event;

    balance_checker u_balance_checker (
        .current_balance(card_balance),
        .fare_amount(FARE_AMOUNT),
        .has_sufficient_balance(w_sufficient_balance)
    );

    fare_calculator u_fare_calculator (
        .current_balance(card_balance),
        .fare_amount(FARE_AMOUNT),
        .new_balance(updated_balance)
    );

    entry_exit_tracker #(
        .TIMEOUT_CYCLES(TIMEOUT_CYCLES)
    ) u_entry_exit_tracker (
        .clk(clk),
        .rst_n(rst_n),
        .gate_is_open(gate_open),
        .passenger_sensor(passenger_sensor),
        .passenger_passed_event(w_passenger_event),
        .timeout_event(w_timeout_event)
    );

    passenger_counter u_passenger_counter (
        .clk(clk),
        .rst_n(rst_n),
        .count_enable(w_passenger_event),
        .total_passengers(passenger_count)
    );

    gate_fsm u_gate_fsm (
        .clk(clk),
        .rst_n(rst_n),
        .card_tapped(card_tapped),
        .card_valid(card_valid),
        .sufficient_balance(w_sufficient_balance),
        .passenger_passed_event(w_passenger_event),
        .timeout_event(w_timeout_event),
        .gate_open(gate_open),
        .alarm_trigger(alarm_trigger),
        .deduct_fare_en(write_back_en)
    );

endmodule