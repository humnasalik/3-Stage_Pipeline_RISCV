module data_mem (
    input logic clk,
    input logic [31:0] addr,      
    input logic [31:0] wdata,      
    input logic [2:0] load_type,    
    input logic load_unsigned,     
    input logic mem_write,         
    input logic [2:0] store_type,  
    output logic [31:0] rdata      
);
    logic [7:0] mem [1024];
    logic [9:0] addr_idx;
    assign addr_idx = addr[9:0];  

    always_comb begin
        case(load_type)
            3'b000: begin 
                if (load_unsigned)
                    rdata = {24'b0, mem[addr_idx]};  
                else
                    rdata = {{24{mem[addr_idx][7]}}, mem[addr_idx]};  
            end

            3'b001: begin
                if (load_unsigned)
                    rdata = {16'b0, mem[addr_idx+1], mem[addr_idx]};  
                else
                    rdata = {{16{mem[addr_idx+1][7]}}, mem[addr_idx+1], mem[addr_idx]};  
            end

            // Word load: LW (always 32 bits)
            3'b010: begin
                rdata = {mem[addr_idx+3], mem[addr_idx+2], mem[addr_idx+1], mem[addr_idx]};
            end

            default: rdata = 32'b0;
        endcase
    end

    always_ff @(posedge clk) begin
        if (mem_write) begin
            case (store_type)
                3'b000: begin // SB: Store byte
                    mem[addr_idx] <= wdata[7:0];
                end
                3'b001: begin // SH: Store halfword
                    mem[addr_idx]     <= wdata[7:0];
                    mem[addr_idx + 1] <= wdata[15:8];
                end
                3'b010: begin // SW: Store word
                    mem[addr_idx]     <= wdata[7:0];
                    mem[addr_idx + 1] <= wdata[15:8];
                    mem[addr_idx + 2] <= wdata[23:16];
                    mem[addr_idx + 3] <= wdata[31:24];
                end
                default: begin
                    mem[addr_idx] <= wdata[7:0];  // Default: store byte
                end
            endcase
        end
    end
endmodule