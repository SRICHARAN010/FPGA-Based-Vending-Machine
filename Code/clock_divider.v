module clock_divider(
    clk,
    clk_1ms, clk_1s
    );
    reg [27:0] i = 0;       
    reg [27:0] j = 0;       
    input wire clk;        
    output reg clk_1ms = 0; 
    output reg clk_1s = 0; 

    // Generate 1ms clock
    always @ (posedge clk)
    begin
        if (i == 49999)     // Divide factor for 1ms period (assuming 100MHz input clock)
        begin
            i <= 0;
            clk_1ms = ~clk_1ms; // Toggle 1ms clock
        end
        else i <= i + 1;
    end
    
    // Generate 1s clock
    always @ (posedge clk)
    begin
        if (j == 2499999)   // Divide factor for 1s period
        begin
            j <= 0;
            clk_1s = ~clk_1s; // Toggle 1s clock
        end
        else j <= j + 1;
    end
    
endmodule

