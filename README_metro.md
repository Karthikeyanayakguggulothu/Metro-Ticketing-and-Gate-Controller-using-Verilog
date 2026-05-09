# Metro Ticketing and Automatic Entry/Exit Gate Controller using Verilog

## Project Overview

This project implements a **Metro Ticketing and Automatic Entry/Exit Gate Controller** using **Verilog HDL**.  
The system is designed to simulate the working of an automated metro station gate system where passengers use a smart card to enter and exit through metro gates.

The controller verifies card validity, checks available balance, calculates fare, deducts the required amount, and controls the opening and closing of entry/exit gates automatically.

This project is suitable for **Advanced Digital Systems**, **Digital Design**, and **Verilog HDL** based academic projects.

## Main Objective

To design a metro gate system that:

* Checks card validity
* Verifies available balance
* Calculates travel fare
* Deducts fare automatically
* Controls entry and exit gate operations

## Features

* Entry gate control
* Exit gate control
* Smart card validation
* Balance checking
* Fare calculation
* Automatic fare deduction
* Gate open/close operation
* Invalid card detection
* Low balance detection
* Timeout feature
* Passenger count monitoring

## System Working

### Entry Operation

1. Passenger taps the metro card.
2. System validates the card.
3. Available balance is checked.
4. If balance is sufficient:

   * Entry gate opens
   * Passenger enters
   * Gate closes automatically
5. If balance is insufficient:

   * Access is denied
   * Low balance indication is generated

### Exit Operation

1. Passenger taps the card at exit.
2. Fare is calculated based on travel.
3. Fare amount is deducted.
4. Exit gate opens.
5. Passenger exits.
6. Gate closes automatically.

## Functional Blocks

* Card Validation Module
* Balance Checker
* Fare Calculator
* Fare Deduction Unit
* Entry Gate Controller
* Exit Gate Controller
* Timeout Controller
* Passenger Counter
* Finite State Machine (FSM)

## Technologies Used

* Verilog HDL
* Digital System Design
* Finite State Machine (FSM)
* Simulation Tools:

  * ModelSim / Vivado / Xilinx ISE

## Inputs and Outputs

### Inputs

* Clock (`clk`)
* Reset (`rst`)
* Card Detect Signal
* Card Valid Signal
* Balance Amount
* Entry Request
* Exit Request

### Outputs

* Gate Open Signal
* Gate Close Signal
* Invalid Card Alert
* Low Balance Alert
* Fare Deducted Signal
* Passenger Count

## FSM States

|State|Description|
|-|-|
|IDLE|Waiting for passenger|
|CARD\_CHECK|Validating card|
|BALANCE\_CHECK|Checking balance|
|ENTRY\_OPEN|Opening entry gate|
|ENTRY\_CLOSE|Closing entry gate|
|FARE\_CALC|Calculating fare|
|DEDUCT\_FARE|Deducting fare|
|EXIT\_OPEN|Opening exit gate|
|EXIT\_CLOSE|Closing exit gate|
|ERROR|Invalid operation handling|



## Project Advantages

* Fully automated operation
* Reduces manual ticket checking
* Fast passenger processing
* Low hardware complexity
* Efficient digital control using FSM
* Suitable for real-time metro systems

## Applications

* Metro Rail Systems
* Railway Automatic Gates
* Smart Transportation Systems
* Access Control Systems
* Automated Ticketing Systems

## Future Enhancements

* RFID card integration
* QR code ticket support
* Recharge module
* Mobile app connectivity
* Database integration
* FPGA hardware implementation

## Expected Output

The system successfully:

* Validates cards
* Detects invalid or low balance cards
* Opens/closes gates automatically
* Calculates and deducts fare
* Tracks passenger count

## Conclusion

The **Metro Ticketing and Automatic Entry/Exit Gate Controller using Verilog** demonstrates the implementation of a real-time automated metro access system using digital design concepts and FSM-based control logic. The project improves automation, passenger management, and fare handling while providing efficient and reliable gate control functionality.



