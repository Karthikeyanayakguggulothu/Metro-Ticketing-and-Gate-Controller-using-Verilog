module metro_tb();

    reg clk;
    reg rst_n;
    reg card_tapped;
    reg card_valid;
    reg [15:0] card_balance;
    reg passenger_sensor;
    
    wire gate_open;
    wire alarm_trigger;
    wire [15:0] updated_balance;
    wire write_back_en;
    wire [31:0] passenger_count;

    
    metro_top #(
        .FARE_AMOUNT(16'd300),
        .TIMEOUT_CYCLES(32'd15) 
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .card_tapped(card_tapped),
        .card_valid(card_valid),
        .card_balance(card_balance),
        .passenger_sensor(passenger_sensor),
        .gate_open(gate_open),
        .alarm_trigger(alarm_trigger),
        .updated_balance(updated_balance),
        .write_back_en(write_back_en),
        .passenger_count(passenger_count)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end


    initial begin
        
        rst_n = 0;
        card_tapped = 0;
        card_valid = 0;
        card_balance = 0;
        passenger_sensor = 0;

        
        #20 rst_n = 1;
        #10;

        
        $display("Test 1: Valid Card ($5.00)");
        card_balance = 500; 
        card_valid = 1;
        card_tapped = 1;
        #10 card_tapped = 0;
   
        #20;
   
        #10 passenger_sensor = 1;
        #10 passenger_sensor = 0;
        
        #30; 

        $display("Test 2: Low Balance Card ($1.00)");
        card_balance = 100; 
        card_valid = 1;
        card_tapped = 1;
        #10 card_tapped = 0;
        
        #50;

        
        $display("Test 3: Timeout Scenario");
        card_balance = 800; 
        card_tapped = 1;
        #10 card_tapped = 0;
        
        
        #200;

        $finish;
    end

    
    initial begin
        $monitor("Time=%0t | GateOpen=%b | Alarm=%b | PassCount=%0d | NewBal=%0d", 
                 $time, gate_open, alarm_trigger, passenger_count, updated_balance);
    end

endmodule