#  FPGA-Based Vending Machine

An FPGA-based vending machine designed and implemented using **Verilog HDL** and a **Finite State Machine (FSM)** architecture. The system handles product selection, money insertion, product dispensing, change calculation, refund requests, and out-of-stock conditions.

The design was implemented and tested on the **Basys3 FPGA development board** using a keypad for input and the onboard LEDs and 7-segment display for output.

---

## 📌 Features

-  Selection of multiple products
-  Money insertion and amount tracking
-  Product dispensing when sufficient money is inserted
-  Automatic change calculation and return
-  Refund functionality
-  Out-of-stock detection
-  7-segment display output
-  LED-based state and status indication
-  Keypad-based user input
-  Reset functionality
-  Implemented using Verilog HDL and FSM architecture

---

##  FSM Architecture

The vending machine operates using a **7-state Finite State Machine**.

| State | Binary Code | Function |
|---|---|---|
| Reset | `000` | Initializes the vending machine |
| Product Select | `001` | Allows the user to select a product |
| Amount Select | `010` | Accepts and tracks the inserted amount |
| Dispense | `011` | Dispenses the selected product |
| Change | `100` | Returns the remaining change |
| Refund | `101` | Returns the inserted amount |
| Out of Stock | `110` | Indicates that the selected product is unavailable |

---

##  System Architecture

```text
                    ┌──────────────────┐
                    │   PMOD Keypad    │
                    │   User Input     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  Clock Divider   │
                    │ & Input Handling │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   Vending FSM    │
                    │   7-State FSM    │
                    └────────┬─────────┘
                             │
             ┌───────────────┼────────────────┐
             │               │                │
             ▼               ▼                ▼
      ┌────────────┐   ┌────────────┐  ┌────────────┐
      │ Product    │   │ Money &    │  │ Stock      │
      │ Selection  │   │ Change     │  │ Detection  │
      └─────┬──────┘   └─────┬──────┘  └─────┬──────┘
            │                │               │
            └────────────────┼───────────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ Output Interface │
                    ├──────────────────┤
                    │ LEDs             │
                    │ 7-Segment Display│
                    │ Product Dispense │
                    └──────────────────┘
