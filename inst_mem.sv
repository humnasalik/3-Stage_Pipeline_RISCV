
module inst_mem (
    input logic [31:0] addr,      
    output logic [31:0] data       
    logic [31:0] mem [1023:0];

    // Combinational read: convert byte address to word address
    // PC increments by 4 (byte addressing), but we need word addressing
    // so we use addr[31:2] to divide by 4
    always_comb 
    begin
        data = mem[addr[31:2]];  
    end
endmodule
