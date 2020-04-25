module tb_DataMem;

    // inputs
    reg tb_MemRead; 
    reg tb_MemWrite; 
    reg [8:0] tb_addr; 
    reg [31:0] tb_write_data; 
    
    // outputs
    wire [31:0] tb_read_data; 

    integer s ; 

    // UUT 
    DataMem UUT (
        .MemRead(tb_MemRead),
        .MemWrite(tb_MemWrite),
        .addr(tb_addr),
        .write_data(tb_write_data),
        .read_data(tb_read_data)
    );
    
    initial begin
        s = 0; 
        tb_MemRead = 0; 
        tb_MemWrite =0;     
        tb_addr = 9'h000;  
        tb_write_data=0 ; 
        #100; 

        // test writing capabilities
        tb_MemWrite = 1; 
        tb_addr = 9'h001; 
        tb_write_data = 32'h99999999; 
        #100; 

        // test read
        tb_MemRead = 1; 
        tb_MemWrite = 0; 
        tb_addr = 9'h001; 

    end

endmodule