module LED(clk,count,LED_l,LED_h,sel);
input clk;
input [4:0] count;
output [7:0] LED_l;//low
output [7:0] LED_h;//high
output [7:0] sel;

reg [7:0] LED_l;
reg [7:0] LED_h;
reg [7:0] LED1;
reg [7:0] LED0;

always@(count)//decoder
  case(count)
    5'd00:
      begin
        LED0 = 8'h3f;
        LED1 = 8'h3f;
      end
    5'd01:
      begin
        LED0 = 8'h06;
        LED1 = 8'h3f;
      end
    5'd02:
      begin
        LED0 = 8'h5b;
        LED1 = 8'h3f;
      end
    5'd03:
      begin
        LED0 = 8'h4f;
        LED1 = 8'h3f;
      end
    5'd04:
      begin
        LED0 = 8'h66;
        LED1 = 8'h3f;
      end
    5'd05:
      begin
        LED0 = 8'h6d;
        LED1 = 8'h3f;
      end
    5'd06:
      begin
        LED0 = 8'h7d;
        LED1 = 8'h3f;
      end
    5'd07:
      begin
        LED0 = 8'h07;
        LED1 = 8'h3f;
      end
    5'd08:
      begin
        LED0 = 8'h7f;
        LED1 = 8'h3f;
      end
    5'd09:
      begin
        LED0 = 8'h6f;
        LED1 = 8'h3f;
      end
    5'd10:
      begin
        LED0 = 8'h3f;
        LED1 = 8'h06;
      end
    5'd11:
      begin
        LED0 = 8'h06;
        LED1 = 8'h06;
      end
    5'd12:
      begin
        LED0 = 8'h5b;
        LED1 = 8'h06;
      end
    5'd13:
      begin
        LED0 = 8'h4f;
        LED1 = 8'h06;
      end
    5'd14:
      begin
        LED0 = 8'h66;
        LED1 = 8'h06;
      end
    5'd15:
      begin
        LED0 = 8'h6d;
        LED1 = 8'h06;
      end
    5'd16:
      begin
        LED0 = 8'h7d;
        LED1 = 8'h06;
      end
    5'd17:
      begin
        LED0 = 8'h07;
        LED1 = 8'h06;
      end
    5'd18:
      begin
        LED0 = 8'h7f;
        LED1 = 8'h06;
      end
    5'd19:
      begin
        LED0 = 8'h6f;
        LED1 = 8'h06;
      end
    5'd20:
      begin
        LED0 = 8'h3f;
        LED1 = 8'h5b;
      end
    5'd21:
      begin
        LED0 = 8'h06;
        LED1 = 8'h5b;
      end
    5'd22:
      begin
        LED0 = 8'h5b;
        LED1 = 8'h5b;
      end
    5'd23:
      begin
        LED0 = 8'h4f;
        LED1 = 8'h5b;
      end
    5'd24:
      begin
        LED0 = 8'h66;
        LED1 = 8'h5b;
      end
    5'd25:
      begin
        LED0 = 8'h6d;
        LED1 = 8'h5b;
      end
    5'd26:
      begin
        LED0 = 8'h7d;
        LED1 = 8'h5b;
      end
    5'd27:
      begin
        LED0 = 8'h07;
        LED1 = 8'h5b;
      end
    5'd28:
      begin
        LED0 = 8'h7f;
        LED1 = 8'h5b;
      end
    5'd29:
      begin
        LED0 = 8'h6f;
        LED1 = 8'h5b;
      end
    5'd30:
      begin
        LED0 = 8'h3f;
        LED1 = 8'h4f;
      end
    default:
        begin
          LED0 = 8'hff;
          LED1 = 8'hff;
        end
    endcase

always@(posedge clk)
    begin
      LED_h <= LED1;
      LED_l <= LED0;
    end

assign sel = 8'b00011000;

endmodule