module tb_DataMem;

    // inputs
    reg tb_MemRead; 
    reg tb_MemWrite; 
    reg [8:0] tb_addr; 
    reg [31:0] tb_write_data; 
    
    // outputs
    wire [31:0] tb_read_data; 


    // UUT 
    DataMem UUT (
        .MemRead(tb_MemRead),
        .MemWrite(tb_MemWrite),
        .addr(tb_addr),
        .write_data(tb_write_data),
        .read_data(tb_read_data)
    );
    
    initial begin
        
        // test writing
        tb_MemRead =  1; 
        tb_addr = 9'b00; 
        tb_write_data = 32'h99999999; 
        

    end

endmodule