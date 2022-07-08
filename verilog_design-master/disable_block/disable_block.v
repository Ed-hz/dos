// 命名块的禁用

// 在一个标志寄存器中查找第一个不为0的位
module disable_block();
  reg [15:0]flag;

  integer i;

  initial begin
    flag = 16'b0010_0000_0000_0000;
    i = 0;
    begin : block1
      while(i<16)begin
        if(flag[i])
          begin 
            $display("Encounter a TRUE bit at element number %d", i);
            disable block1;
          end
        i = i + 1;
      end
    end
  end

  
endmodule