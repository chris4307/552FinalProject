`timescale 1 ns / 100 ps

module skeleton_tb();

    // inputs to the ALU are reg type

    reg            clock, reset;

    // outputs from the ALU are wire type
    wire [31:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31, address, wdata, alu_out, r1d_out_real;
	 wire Rwe_o, ALUinB_o;
	 wire [31:0] Immediate32, Instruct_FD, Instruct_DX, Instruct_XM, Instruct_MW, PC, PC_D, PC_X, PC_M, PC_W, data_readRegA_o, data_readRegB_o;
	 wire [4:0] aluop, readRegA, readRegB, Rs, Rt, Rd, writeReg, Shamt, Rs1_DX_bypass, Rs2_DX_bypass, Rd_XM_bypass, Rd_MW_bypass;
	 wire [3:0] bypass_select;


    // Tracking the number of errors
    integer errors;
    integer index;    // for testing...
	 integer clock_cycle;

	 
    // Instantiate ALU
	 
    skeleton my_skeleton(clock, reset, d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, 
										d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31,
					address, 
					Rwe_o, Immediate32, ALUinB_o, Instruct_FD, Instruct_DX, Instruct_XM, Instruct_MW, PC, PC_D, PC_X, PC_M, PC_W,
					wdata, alu_out, aluop, readRegA, readRegB, data_readRegA_o, data_readRegB_o,
					Rs, Rt, Rd, writeReg, Shamt, r1d_out_real, bypass_select,
					Rs1_DX_bypass, Rs2_DX_bypass, Rd_XM_bypass, Rd_MW_bypass);
					

    initial

    begin
        //$display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;
			
		  clock_cycle = 0;
        checkOr();

        if(errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        $stop;
    end

    // Clock generator
    always
         #10     clock = ~clock;

    task checkOr;
        begin				
            @(negedge clock);
            assign reset = 1'b0;

            @(negedge clock);
				$display("Reg7: %d", d7);

            @(negedge clock);
				$display("Reg7: %d", d7);            

            @(negedge clock);
				$display("Reg7: %d", d7); 

            @(negedge clock);
				$display("Reg7: %d", d7);
				
				@(negedge clock);
				$display("Reg7: %d", d7); 
				
				@(negedge clock);
				$display("Reg7: %d", d7); 
				
				@(negedge clock);
				$display("Reg7: %d", d7); 
        end
    endtask

endmodule