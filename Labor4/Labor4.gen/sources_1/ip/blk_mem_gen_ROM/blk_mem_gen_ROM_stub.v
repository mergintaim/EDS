// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sun Sep  3 21:41:34 2023
// Host        : md3hhm5c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Privat/EDS/Projects/Labor/Labor4/Labor4.gen/sources_1/ip/blk_mem_gen_ROM/blk_mem_gen_ROM_stub.v
// Design      : blk_mem_gen_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *)
module blk_mem_gen_ROM(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[14:0],douta[14:0]" */;
  input clka;
  input ena;
  input [14:0]addra;
  output [14:0]douta;
endmodule
