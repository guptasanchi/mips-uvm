//32x32 Register File 
//Supports 2 Read requests and a single write request

module regfile 
    (
        input   wire           clk,
        input   wire           reset,
        input   wire           w_en_rf_i,
        input   wire [31:0]    w_data_rf_i,
        input   wire [31:0]    w_addr_rf_i,
        input   wire [31:0]    r_addr_p1_rf_i,
        input   wire [31:0]    r_addr_p2_rf_i,
        output  wire [31:0]    r_data_p1_rf_o,
        output  wire [31:0]    r_data_p2_rf_o
    );

    wire [31:0]    r_data_p1;
    wire [31:0]    r_data_p2;

    assign r_data_p1_rf_o = r_data_p1;
    assign r_data_p2_rf_o = r_data_p2;

    //Create the RegFile as a 2 dim array
    reg [31:0] reg_file [31:0];
    
    always @ (posedge clk)
        if (w_en_rf_i)
        reg_file [w_addr_rf_i] <= w_data_rf_i;

    assign r_data_p1 = reg_file [r_addr_p1_rf_i];
    assign r_data_p2 = reg_file [r_addr_p2_rf_i];

endmodule

